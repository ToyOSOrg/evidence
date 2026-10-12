//! Measurement only, never lands: PR #863's round 2 BLOCKER, a `poll` beside a
//! blocking call of the same direction, modelled with stage 2's (#878,
//! 7ea0ff9d6) `toyos_transport::stream` ends unchanged.
//!
//! One direction of one stream and three threads: netstack's, which makes the
//! direction ready once and then serves whatever the client rings it for; a
//! blocking `read` (or `write`) of one byte; and a `poll` of the same
//! direction. The blocking call leaves the direction ready behind it: one byte
//! of two in the receive ring, the receive ring's `end`, or one byte of room of
//! two in the send ring. A doorbell is a kernel pipe as the client waits on it:
//! a ring writes a byte and posts its watch, a blocking wait reads, so takes,
//! every byte there, and a watch is answered by whether the pipe holds a byte
//! when its submitter looks after the post, and is armed again if it does not
//! (`kernel/src/inbox/polls.rs`, `deliver`). loom fails a run that ends with a
//! thread waiting.
//!
//! Three rules ([`Rule`]): the one #863 records at a91748099, amendment B, and
//! amendment B less its pass. The client's `poll` returns, and the model ends,
//! only once the poll is answered with the direction ready; the client then
//! hangs up and netstack's loop ends. Shared by `Rc`, as #878's model is:
//! loom's threads run on the one thread that runs the model, and loom's `Arc`
//! panics again in its drop while a failed model unwinds.

use core::sync::atomic::Ordering;
use std::rc::Rc;

use loom::sync::atomic::{AtomicBool, AtomicU32};
use loom::sync::{Condvar, Mutex};
use toyos_transport::{stream, Word};

struct Shared(AtomicU32);

impl Word for Shared {
    fn load(&self, order: Ordering) -> u32 {
        self.0.load(order)
    }
    fn store(&self, value: u32, order: Ordering) {
        self.0.store(value, order)
    }
    fn swap(&self, value: u32, order: Ordering) -> u32 {
        self.0.swap(value, order)
    }
}

const RING: u32 = 2;
const LAP: u32 = 2 * RING;
const WORDS: usize = 8;
type Page = [Shared; WORDS];
// head, tail, data want, room want, base
const RX: stream::Place<RING, WORDS> = stream::Place::new::<0, 1, 2, 3, 0>();
const TX: stream::Place<RING, WORDS> = stream::Place::new::<4, 5, 6, 7, 2>();
/// The words a poll that does not hold the end reads and arms directly:
/// (head, tail, the client's want).
const RX_WORDS: (usize, usize, usize) = (0, 1, 2);
const TX_WORDS: (usize, usize, usize) = (4, 5, 7);

/// How a waker clears a want, as stage 2's ends do.
const WAKE: Ordering = if cfg!(feature = "want-relaxed") { Ordering::Relaxed } else { Ordering::Release };

/// A one-byte doorbell pipe: one side holds its write end, the other its read
/// end.
struct Pipe {
    level: Mutex<Level>,
    posted: Condvar,
}

struct Level {
    bytes: u32,
    posts: u32,
}

impl Pipe {
    fn new() -> Self {
        Self { level: Mutex::new(Level { bytes: 0, posts: 0 }), posted: Condvar::new() }
    }

    /// `SYS_WRITE` of one byte: the watch's post wakes every waiter.
    fn ring(&self) {
        let mut level = self.level.lock().unwrap();
        level.bytes += 1;
        level.posts += 1;
        self.posted.notify_all();
    }

    /// A nonblocking `SYS_READ` of every byte there: whether there was one.
    fn drain(&self) -> bool {
        let mut level = self.level.lock().unwrap();
        let had = level.bytes != 0;
        level.bytes = 0;
        had
    }

    /// A blocking `SYS_READ` and the drain after it: every byte there is taken.
    fn wait(&self) {
        let mut level = self.level.lock().unwrap();
        while level.bytes == 0 {
            level = self.posted.wait(level).unwrap();
        }
        level.bytes = 0;
    }

    /// `OP_WATCH` for reading, registered: `None` if the look at registration
    /// answers it, else the posts it waits past.
    fn watch(&self) -> Option<u32> {
        let level = self.level.lock().unwrap();
        (level.bytes == 0).then_some(level.posts)
    }

    /// The watch's wait: a post fires it, and its submitter looks when it
    /// runs; a look that finds no byte arms it again.
    fn answered(&self, mut seen: u32) {
        loop {
            {
                let mut level = self.level.lock().unwrap();
                while level.posts == seen {
                    level = self.posted.wait(level).unwrap();
                }
            }
            let level = self.level.lock().unwrap();
            if level.bytes != 0 {
                return;
            }
            seen = level.posts;
        }
    }
}

/// The client's end of the direction.
enum End {
    Read(stream::Consumer<RING, WORDS>),
    Write(stream::Producer<RING, WORDS>),
}

/// netstack's end of the direction.
enum NetEnd {
    Read(stream::Producer<RING, WORDS>),
    Write(stream::Consumer<RING, WORDS>),
}

/// The client's end as its threads share it.
struct Held {
    end: End,
    /// The threads counted in as waiting on the direction (amendment B).
    waiters: u32,
}

struct Session {
    case: Case,
    page: Page,
    /// The receive ring's `end`, written by netstack once.
    ended: AtomicU32,
    /// The direction's doorbell, netstack to client.
    bell: Pipe,
    /// netstack's doorbell, client to netstack.
    net_bell: Pipe,
    /// The client hung up: netstack's loop ends at its next ring.
    quit: AtomicBool,
    held: Mutex<Held>,
    /// The rule as written's blocking call holds the end: the review's
    /// interleaving starts the poll only then, for loom does not schedule the
    /// blocking call's `lock` before the poll's `try_lock` on its own (the
    /// `ungated` feature).
    holding: AtomicBool,
}

impl Session {
    /// The receive ring's `end`, read with `Acquire`; only the case that
    /// writes it reads it.
    fn ended(&self) -> bool {
        self.case == Case::EndLeft && self.ended.load(Ordering::Acquire) != 0
    }

    /// What the client waits for is there: bytes or the `end` to read, room
    /// to write.
    fn ready(&self, end: &mut End) -> bool {
        match end {
            End::Read(rx) => rx.ready(&self.page).unwrap() > 0 || self.ended(),
            End::Write(tx) => tx.room(&self.page).unwrap() > 0,
        }
    }

    /// Arm the client's want, then look again.
    fn arm(&self, end: &mut End) -> bool {
        match end {
            End::Read(rx) => rx.arm(&self.page).unwrap() > 0 || self.ended(),
            End::Write(tx) => tx.arm(&self.page).unwrap() > 0,
        }
    }

    /// The blocking call's copy, one byte, or the end read as `Ok(0)`; `true`
    /// to ring netstack for it.
    fn copy(&self, end: &mut End) -> bool {
        match end {
            End::Read(rx) => {
                if rx.ready(&self.page).unwrap() == 0 {
                    return false;
                }
                assert!(rx.advance(1));
                rx.release(&self.page)
            }
            End::Write(tx) => {
                assert!(tx.room(&self.page).unwrap() > 0 && tx.advance(1));
                tx.publish(&self.page)
            }
        }
    }

    /// The look of a poll that does not hold the end, at the shared words.
    fn ready_unheld(&self, case: Case) -> bool {
        let (head, tail, _) = case.words();
        let (head, tail) = (self.page[head].load(Ordering::Acquire), self.page[tail].load(Ordering::Acquire));
        match case {
            Case::BytesLeft | Case::EndLeft => tail != head || self.ended(),
            Case::RoomLeft => (tail + LAP - head) % LAP < RING,
        }
    }

    fn arm_unheld(&self, case: Case) -> bool {
        self.page[case.words().2].swap(1, Ordering::Acquire);
        self.ready_unheld(case)
    }
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Case {
    /// netstack publishes two bytes; the blocking `read` takes one.
    BytesLeft,
    /// netstack writes the receive ring's `end`; the blocking `read` returns
    /// `Ok(0)`.
    EndLeft,
    /// netstack releases two bytes of a full send ring; the blocking `write`
    /// fills one.
    RoomLeft,
}

impl Case {
    fn words(self) -> (usize, usize, usize) {
        match self {
            Case::BytesLeft | Case::EndLeft => RX_WORDS,
            Case::RoomLeft => TX_WORDS,
        }
    }
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Rule {
    /// As #863 records it at a91748099: the end holder drains, and holds the
    /// end across its wait; a poll takes the end only if it is free, and
    /// otherwise registers its watch before it arms and looks, and drains
    /// nothing.
    AsWritten,
    /// Amendment B: no end is held across a wait, every waiter is counted in,
    /// a take is passed on to a waiter still counted, and netstack, rung,
    /// rings each set client want whose direction is ready.
    PassOn,
    /// Amendment B less the pass: everything else as `PassOn`.
    NoPass,
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Call {
    Blocking,
    Poll,
}

/// The blocking call as the rule as written has it.
fn blocking_as_written(s: &Session) {
    let mut held = s.held.lock().unwrap();
    s.holding.store(true, Ordering::Release);
    loop {
        if s.ready(&mut held.end) {
            break;
        }
        s.bell.drain();
        if s.arm(&mut held.end) {
            break;
        }
        s.bell.wait();
    }
    if s.copy(&mut held.end) {
        s.net_bell.ring();
    }
}

/// The poll as the rule as written has it; returns once answered with the
/// direction ready.
fn poll_as_written(s: &Session, case: Case) {
    while !cfg!(feature = "ungated") && !s.holding.load(Ordering::Acquire) {
        loom::thread::yield_now();
    }
    match s.held.try_lock() {
        Ok(mut held) => loop {
            if s.ready(&mut held.end) {
                return;
            }
            s.bell.drain();
            if s.arm(&mut held.end) {
                return;
            }
            if let Some(seen) = s.bell.watch() {
                s.bell.answered(seen);
            }
        },
        Err(_) => loop {
            let seen = s.bell.watch();
            if s.arm_unheld(case) {
                return;
            }
            if let Some(seen) = seen {
                s.bell.answered(seen);
            }
            if s.ready_unheld(case) {
                return;
            }
        },
    }
}

/// A blocking call or a poll under amendment B, or under it less the pass.
fn amended(s: &Session, rule: Rule, call: Call) {
    let mut took = false;
    let mut counted = false;
    loop {
        let mut held = s.held.lock().unwrap();
        let ready = s.ready(&mut held.end) || {
            if !counted {
                held.waiters += 1;
                counted = true;
            }
            took |= s.bell.drain();
            s.arm(&mut held.end)
        };
        if ready {
            if call == Call::Blocking && s.copy(&mut held.end) {
                s.net_bell.ring();
            }
            if counted {
                held.waiters -= 1;
            }
            if rule == Rule::PassOn && took && held.waiters > 0 && s.arm(&mut held.end) {
                s.net_bell.ring();
            }
            return;
        }
        drop(held);
        match call {
            Call::Blocking => {
                s.bell.wait();
                took = true;
            }
            Call::Poll => {
                if let Some(seen) = s.bell.watch() {
                    s.bell.answered(seen);
                }
            }
        }
    }
}

fn netstack(s: &Session, case: Case, rule: Rule, mut end: NetEnd) {
    let want = case.words().2;
    let rang = match (&mut end, case) {
        (NetEnd::Read(rx), Case::BytesLeft) => {
            assert_eq!(rx.room(&s.page), Ok(RING));
            assert!(rx.advance(RING));
            rx.publish(&s.page)
        }
        (NetEnd::Read(_), Case::EndLeft) => {
            s.ended.store(1, Ordering::Release);
            s.page[want].swap(0, WAKE) != 0
        }
        (NetEnd::Write(tx), Case::RoomLeft) => {
            assert_eq!(tx.ready(&s.page), Ok(RING));
            assert!(tx.advance(RING));
            tx.release(&s.page)
        }
        _ => unreachable!(),
    };
    if rang {
        s.bell.ring();
    }
    loop {
        s.net_bell.wait();
        if rule != Rule::AsWritten {
            let ready = match &mut end {
                NetEnd::Read(rx) => rx.room(&s.page).unwrap() < RING || case == Case::EndLeft,
                NetEnd::Write(tx) => tx.ready(&s.page).unwrap() < RING,
            };
            if ready && s.page[want].swap(0, WAKE) != 0 {
                s.bell.ring();
            }
        }
        if s.quit.load(Ordering::Acquire) {
            return;
        }
    }
}

/// Every model here explores the interleavings with at most this many
/// preemptions, as the kernel's own loom models bound theirs: unbounded,
/// `pass_on_bytes_left` gave no verdict in ten minutes.
const PREEMPTIONS: usize = 5;

fn session(case: Case, rule: Rule) {
    let mut builder = loom::model::Builder::new();
    builder.preemption_bound = Some(PREEMPTIONS);
    builder.check(move || {
        let page: Page = core::array::from_fn(|_| Shared(AtomicU32::new(0)));
        let (end, net_end) = match case {
            Case::BytesLeft | Case::EndLeft => {
                (End::Read(stream::Consumer::new(&page, RX)), NetEnd::Read(stream::Producer::new(&page, RX)))
            }
            Case::RoomLeft => {
                let mut tx = stream::Producer::new(&page, TX);
                let net_tx = stream::Consumer::new(&page, TX);
                // The send ring starts full: netstack has taken none of it.
                assert_eq!(tx.room(&page), Ok(RING));
                assert!(tx.advance(RING));
                assert!(!tx.publish(&page), "nobody armed yet");
                (End::Write(tx), NetEnd::Write(net_tx))
            }
        };
        let s = Rc::new(Session {
            case,
            page,
            ended: AtomicU32::new(0),
            bell: Pipe::new(),
            net_bell: Pipe::new(),
            quit: AtomicBool::new(false),
            held: Mutex::new(Held { end, waiters: 0 }),
            holding: AtomicBool::new(false),
        });

        let net = {
            let s = Rc::clone(&s);
            loom::thread::spawn(move || netstack(&s, case, rule, net_end))
        };
        let blocking = {
            let s = Rc::clone(&s);
            loom::thread::spawn(move || match rule {
                Rule::AsWritten => blocking_as_written(&s),
                Rule::PassOn | Rule::NoPass => amended(&s, rule, Call::Blocking),
            })
        };

        match rule {
            Rule::AsWritten => poll_as_written(&s, case),
            Rule::PassOn | Rule::NoPass => amended(&s, rule, Call::Poll),
        }

        blocking.join().unwrap();
        s.quit.store(true, Ordering::Release);
        s.net_bell.ring();
        net.join().unwrap();
    });
}

#[test]
fn as_written_bytes_left() {
    session(Case::BytesLeft, Rule::AsWritten);
}

#[test]
fn as_written_end_left() {
    session(Case::EndLeft, Rule::AsWritten);
}

#[test]
fn as_written_room_left() {
    session(Case::RoomLeft, Rule::AsWritten);
}

#[test]
fn pass_on_bytes_left() {
    session(Case::BytesLeft, Rule::PassOn);
}

#[test]
fn pass_on_end_left() {
    session(Case::EndLeft, Rule::PassOn);
}

#[test]
fn pass_on_room_left() {
    session(Case::RoomLeft, Rule::PassOn);
}

#[test]
fn no_pass_bytes_left() {
    session(Case::BytesLeft, Rule::NoPass);
}

#[test]
fn no_pass_end_left() {
    session(Case::EndLeft, Rule::NoPass);
}

#[test]
fn no_pass_room_left() {
    session(Case::RoomLeft, Rule::NoPass);
}
