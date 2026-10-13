//! Measurement only, never lands: PR #863 round 7's BLOCKERs 2 and 3 and
//! round 8's BLOCKER, a datagram socket's two waits, modelled with stage 2's (#878)
//! `toyos_transport::stream` ends unchanged as `main` holds them.
//!
//! A datagram region has a receive ring and a send ring of records, each
//! record one ring unit here, and a `pending` word. The connection is the
//! netstack-to-client doorbell a receiver waits on; the bell is the one a
//! sender waits on for room; a third pipe carries the client's rings and the
//! card's leaves to netstack, and a fourth netstack's rings to the card. A doorbell is a kernel pipe as the client waits on it: a ring is a
//! byte written and every waiting thread woken, a drain takes every byte there
//! without waiting, and a wait blocks until a byte is there and takes them
//! all. Every sleeper drains its doorbell before it looks. loom fails a run
//! that ends with a thread waiting, and one whose assertion fails.
//!
//! Shared by `Rc`, as #878's model is: loom's threads run on the one thread
//! that runs the model, and loom's `Arc` panics again in its drop while a
//! failed model unwinds.

use core::sync::atomic::Ordering;

use loom::sync::atomic::AtomicU32;
use loom::sync::{Condvar, Mutex};
use std::rc::Rc;
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

struct Pipe {
    bytes: Mutex<u32>,
    posted: Condvar,
}

impl Pipe {
    fn new() -> Self {
        Self { bytes: Mutex::new(0), posted: Condvar::new() }
    }

    fn ring(&self) {
        *self.bytes.lock().unwrap() += 1;
        self.posted.notify_all();
    }

    fn drain(&self) {
        *self.bytes.lock().unwrap() = 0;
    }

    fn wait(&self) {
        let mut bytes = self.bytes.lock().unwrap();
        while *bytes == 0 {
            bytes = self.posted.wait(bytes).unwrap();
        }
        *bytes = 0;
    }
}

const RING: u32 = 1;
const WORDS: usize = 9;
const RX: stream::Place<RING, WORDS> = stream::Place::new::<0, 1, 2, 3, 0>();
const TX: stream::Place<RING, WORDS> = stream::Place::new::<4, 5, 6, 7, 1>();
/// `RX`'s data want (the client's `rx_data`) and `TX`'s room want (`tx_room`).
const RX_DATA: usize = 2;
const TX_ROOM: usize = 7;
const PENDING: usize = 8;
/// The error netstack holds for the socket: any value but 0.
const REFUSED: u32 = 7;

/// The waker's exchange of a want with no cursor moved: the one stage 3 adds
/// for the `end` word (amendment A), as `stream.rs`'s own `WAKE` orders it.
const WAKE: Ordering = if cfg!(feature = "want-relaxed") { Ordering::Relaxed } else { Ordering::Release };

type Page = Rc<[Shared; WORDS]>;

fn page() -> Page {
    Rc::new(core::array::from_fn(|_| Shared(AtomicU32::new(0))))
}

fn wake(page: &Page, want: usize, bell: &Pipe) {
    if page[want].swap(0, WAKE) != 0 {
        bell.ring();
    }
}

/// A call's look at `pending`: a load, and an exchange only when it is set,
/// so a call with nothing pending writes no header line netstack reads.
fn take_pending(page: &Page) -> Option<u32> {
    if page[PENDING].load(Ordering::Acquire) == 0 {
        return None;
    }
    Some(page[PENDING].swap(0, Ordering::Acquire)).filter(|&held| held != 0)
}

#[derive(Clone, Copy, PartialEq)]
enum Sleeper {
    /// A `recv_from` with nothing to receive, on the connection.
    Receiver,
    /// A `send_to` over a full send ring, on the bell.
    Sender,
}

#[derive(Clone, Copy, PartialEq)]
enum Look {
    /// The design: the look after the arm reads `pending` beside the ring.
    AfterArm,
    /// The control: `pending` is read before the drain and the arm, and the
    /// look reads only the ring.
    BeforeArm,
}

#[derive(Clone, Copy, PartialEq)]
enum Raise {
    /// The design: `pending` stored, then each want exchanged for 0 and rung
    /// if it was set.
    StoreThenWake,
    /// The control: each want exchanged before `pending` is stored.
    WakeThenStore,
    /// Round 7's reading of the record: `pending` stored, then the doorbell
    /// rung whatever the want held.
    StoreThenRing,
}

#[derive(Clone, Copy, PartialEq)]
enum Wants {
    /// The design: both client wants, as for a fatal `end` (amendment A).
    Both,
    /// The control: only the receive want, as round 7's owed fix reads.
    ReceiveOnly,
}

fn pending(sleeper: Sleeper, look: Look, raise: Raise, wants: Wants) {
    loom::model(move || {
        let page = page();
        let connection = Rc::new(Pipe::new());
        let bell = Rc::new(Pipe::new());

        let _net_rx = stream::Producer::new(&*page, RX);
        let mut client_rx = stream::Consumer::new(&*page, RX);
        let mut client_tx = stream::Producer::new(&*page, TX);
        let _net_tx = stream::Consumer::new(&*page, TX);

        if sleeper == Sleeper::Sender {
            // The send ring starts full: netstack holds it at [udp]'s full queue.
            assert_eq!(client_tx.room(&*page), Ok(1));
            assert!(client_tx.advance(1));
            assert!(!client_tx.publish(&*page), "netstack is not asleep");
        }

        let netstack = {
            let (page, connection, bell) = (Rc::clone(&page), Rc::clone(&connection), Rc::clone(&bell));
            loom::thread::spawn(move || {
                let store = || {
                    page[PENDING].0.compare_exchange(0, REFUSED, Ordering::Release, Ordering::Relaxed).unwrap();
                };
                let wake_all = || {
                    wake(&page, RX_DATA, &connection);
                    if wants == Wants::Both {
                        wake(&page, TX_ROOM, &bell);
                    }
                };
                match raise {
                    Raise::StoreThenWake => {
                        store();
                        wake_all();
                    }
                    Raise::WakeThenStore => {
                        wake_all();
                        store();
                    }
                    Raise::StoreThenRing => {
                        store();
                        connection.ring();
                        if wants == Wants::Both {
                            bell.ring();
                        }
                    }
                }
            })
        };

        let doorbell = match sleeper {
            Sleeper::Receiver => &connection,
            Sleeper::Sender => &bell,
        };
        let answer = loop {
            if look == Look::BeforeArm {
                if let Some(held) = take_pending(&page) {
                    break held;
                }
            }
            doorbell.drain();
            let ready = match sleeper {
                Sleeper::Receiver => client_rx.arm(&*page),
                Sleeper::Sender => client_tx.arm(&*page),
            };
            assert_eq!(ready, Ok(0), "nothing is received and no room is made");
            if look == Look::AfterArm {
                if let Some(held) = take_pending(&page) {
                    break held;
                }
            }
            doorbell.wait();
        };
        assert_eq!(answer, REFUSED);

        netstack.join().unwrap();
    });
}

#[test]
fn receiver_answers_pending() {
    pending(Sleeper::Receiver, Look::AfterArm, Raise::StoreThenWake, Wants::Both);
}

#[test]
fn receiver_answers_pending_rung_whatever_the_want() {
    pending(Sleeper::Receiver, Look::AfterArm, Raise::StoreThenRing, Wants::Both);
}

#[test]
fn receiver_reads_pending_before_arm() {
    pending(Sleeper::Receiver, Look::BeforeArm, Raise::StoreThenWake, Wants::Both);
}

#[test]
fn receiver_reads_pending_before_arm_rung_whatever_the_want() {
    pending(Sleeper::Receiver, Look::BeforeArm, Raise::StoreThenRing, Wants::Both);
}

#[test]
fn receiver_woken_before_pending_is_stored() {
    pending(Sleeper::Receiver, Look::AfterArm, Raise::WakeThenStore, Wants::Both);
}

#[test]
fn sender_answers_pending() {
    pending(Sleeper::Sender, Look::AfterArm, Raise::StoreThenWake, Wants::Both);
}

#[test]
fn sender_answers_pending_only_receive_want_rung() {
    pending(Sleeper::Sender, Look::AfterArm, Raise::StoreThenWake, Wants::ReceiveOnly);
}

#[derive(Clone, Copy, PartialEq)]
enum RoomBell {
    /// The design: netstack rings `tx_room` on the socket's own bell.
    Own,
    /// The control: on the connection, where a receiver waits.
    Connection,
}

#[derive(Clone, Copy, PartialEq)]
enum AtFull {
    /// The design: a record found at a full [udp] queue is held on the send
    /// ring, and netstack looks at the ring again when a datagram leaves.
    Hold,
    /// The control: the record is held, but after the leave netstack waits on
    /// the client's next ring without looking at the send ring again.
    HoldUntilRing,
    /// The control: a record taken off the ring at a full queue is refused,
    /// as `TxQueueFull` is today.
    Refuse,
}

/// As the kernel's own models bound theirs, and amendment B's.
const PREEMPTIONS: usize = 5;

/// Records sent: the first fills the ring before any thread runs, the second
/// waits for room.
const RECORDS: u32 = 2;

/// netstack's [udp] queue holds one datagram and starts full with datagram 0,
/// and the send ring starts full with record 1.
/// The card is its own thread: a leave is its step, taking the queued datagram
/// and ringing netstack, at any point loom interleaves it, so netstack may find
/// a published record while its queue is still full. netstack moves each
/// record into the queue as room comes and rings the card. A `recv_from`
/// waits on the connection until netstack hands it a datagram after the last
/// record, where room is rung on the connection. Every record must leave, in
/// order, none refused.
fn room(bell: RoomBell, at_full: AtFull) {
    let mut model = loom::model::Builder::new();
    model.preemption_bound = Some(PREEMPTIONS);
    model.check(move || {
        let page = page();
        let cells: Rc<[AtomicU32; RING as usize]> = Rc::new(core::array::from_fn(|_| AtomicU32::new(0)));
        let queue: Rc<Mutex<Option<u32>>> = Rc::new(Mutex::new(Some(0)));
        let connection = Rc::new(Pipe::new());
        let room_bell = match bell {
            RoomBell::Own => Rc::new(Pipe::new()),
            RoomBell::Connection => Rc::clone(&connection),
        };
        let to_netstack = Rc::new(Pipe::new());
        let to_card = Rc::new(Pipe::new());

        let mut net_rx = stream::Producer::new(&*page, RX);
        let mut client_rx = stream::Consumer::new(&*page, RX);
        let mut client_tx = stream::Producer::new(&*page, TX);
        let mut net_tx = stream::Consumer::new(&*page, TX);

        let send = |client_tx: &mut stream::Producer<RING, WORDS>, record: u32| {
            cells[((record - 1) % RING) as usize].store(record, Ordering::Relaxed);
            assert!(client_tx.advance(1));
            if client_tx.publish(&*page) {
                to_netstack.ring();
            }
        };
        assert_eq!(client_tx.room(&*page), Ok(1));
        send(&mut client_tx, 1);

        let card = {
            let (queue, to_netstack, to_card) = (Rc::clone(&queue), Rc::clone(&to_netstack), Rc::clone(&to_card));
            loom::thread::spawn(move || {
                let mut sent = vec![];
                while sent.len() <= RECORDS as usize {
                    let left = queue.lock().unwrap().take();
                    match left {
                        Some(datagram) => {
                            sent.push(datagram);
                            to_netstack.ring();
                        }
                        None => to_card.wait(),
                    }
                }
                assert_eq!(sent, (0..=RECORDS).collect::<Vec<_>>(), "every record leaves, in order, none refused");
            })
        };

        let netstack = {
            let (page, cells, queue, connection, room_bell, to_netstack, to_card) = (
                Rc::clone(&page),
                Rc::clone(&cells),
                Rc::clone(&queue),
                Rc::clone(&connection),
                Rc::clone(&room_bell),
                Rc::clone(&to_netstack),
                Rc::clone(&to_card),
            );
            loom::thread::spawn(move || {
                let mut taken = 0u32;
                let mut refused = vec![];
                let take = |net_tx: &mut stream::Consumer<RING, WORDS>, taken: &mut u32| {
                    let record = cells[(*taken % RING) as usize].load(Ordering::Relaxed);
                    assert!(net_tx.advance(1));
                    *taken += 1;
                    if net_tx.release(&*page) {
                        room_bell.ring();
                    }
                    record
                };
                while taken < RECORDS {
                    if net_tx.ready(&*page) == Ok(0) {
                        to_netstack.drain();
                        if net_tx.arm(&*page) == Ok(0) {
                            to_netstack.wait();
                        }
                        continue;
                    }
                    to_netstack.drain();
                    if queue.lock().unwrap().is_some() {
                        if at_full == AtFull::Refuse {
                            refused.push(take(&mut net_tx, &mut taken));
                            continue;
                        }
                        // Held: the record stays on the ring, and the leave rings netstack.
                        to_netstack.wait();
                        if at_full == AtFull::HoldUntilRing {
                            while queue.lock().unwrap().is_some() {
                                to_netstack.wait();
                            }
                            to_netstack.wait();
                        }
                        continue;
                    }
                    let record = take(&mut net_tx, &mut taken);
                    *queue.lock().unwrap() = Some(record);
                    to_card.ring();
                }
                assert_eq!(refused, [], "no record is refused");

                assert_eq!(net_rx.room(&*page), Ok(1));
                assert!(net_rx.advance(1));
                if net_rx.publish(&*page) {
                    connection.ring();
                }
            })
        };

        // Only room rung on the connection reaches a `recv_from`: on the
        // socket's own bell, it shares no step with the sender's path but
        // netstack's last publish.
        let receiver = (bell == RoomBell::Connection).then(|| {
            let (page, connection) = (Rc::clone(&page), Rc::clone(&connection));
            loom::thread::spawn(move || {
                while client_rx.ready(&*page) == Ok(0) {
                    connection.drain();
                    if client_rx.arm(&*page) == Ok(0) {
                        connection.wait();
                    }
                }
            })
        });

        for record in 2..=RECORDS {
            while client_tx.room(&*page) == Ok(0) {
                room_bell.drain();
                if client_tx.arm(&*page) == Ok(0) {
                    room_bell.wait();
                }
            }
            send(&mut client_tx, record);
        }

        if let Some(receiver) = receiver {
            receiver.join().unwrap();
        }
        netstack.join().unwrap();
        card.join().unwrap();
    });
}

#[test]
fn sender_waits_on_its_own_bell() {
    room(RoomBell::Own, AtFull::Hold);
}

#[test]
fn sender_waits_on_the_connection() {
    room(RoomBell::Connection, AtFull::Hold);
}

#[test]
fn netstack_waits_for_a_ring_after_the_leave() {
    room(RoomBell::Own, AtFull::HoldUntilRing);
}

#[test]
fn netstack_refuses_at_the_full_queue() {
    room(RoomBell::Own, AtFull::Refuse);
}
