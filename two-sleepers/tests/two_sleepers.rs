//! Measurement only, never lands: PR #863's BLOCKER 6, modelled with stage 2's
//! (#878, 7ea0ff9d6) `toyos_transport::stream` ends unchanged.
//!
//! A client's reader sleeps on an empty receive ring (`rx_data`) and its
//! writer on a full send ring (`tx_room`); netstack's one thread releases a
//! byte of send room and publishes a byte of receive data, ringing each want
//! it finds set. A doorbell is a kernel pipe as the client waits on it: a ring
//! is a byte written and every waiting thread woken, and a wait reads, so
//! takes, every byte there. Each sleeper re-reads its own cursor and re-arms
//! its own want after every wake (the loop below), which is the orchestrator's
//! second candidate fix. loom fails a run that ends with a thread waiting.
//! Shared by `Rc`, as #878's model is: loom's threads run on the one thread
//! that runs the model, and loom's `Arc` panics again in its drop while a
//! failed model unwinds.

use core::sync::atomic::Ordering;

use loom::sync::atomic::AtomicU32;
use std::rc::Rc;

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

/// A one-byte doorbell pipe: netstack holds its write end, the client its
/// read end.
struct Pipe {
    bytes: Mutex<u32>,
    posted: Condvar,
}

impl Pipe {
    fn new() -> Self {
        Self { bytes: Mutex::new(0), posted: Condvar::new() }
    }

    /// `SYS_WRITE` of one byte: the watch's post wakes every waiting thread.
    fn ring(&self) {
        *self.bytes.lock().unwrap() += 1;
        self.posted.notify_all();
    }

    /// A blocking `SYS_READ` and the drain after it: every byte there is taken.
    fn wait(&self) {
        let mut bytes = self.bytes.lock().unwrap();
        while *bytes == 0 {
            bytes = self.posted.wait(bytes).unwrap();
        }
        *bytes = 0;
    }
}

const RING: u32 = 1;
const WORDS: usize = 8;
const RX: stream::Place<RING, WORDS> = stream::Place::new::<0, 1, 2, 3, 0>();
const TX: stream::Place<RING, WORDS> = stream::Place::new::<4, 5, 6, 7, 1>();

#[derive(Clone, Copy)]
enum Bells {
    /// The design as #863 recorded it: `rx_data` and `tx_room` both ring the
    /// connection's one netstack-to-client pipe.
    OneForBoth,
    /// The amendment: `rx_data` rings the connection, `tx_room` its own bell.
    OnePerDirection,
}

#[derive(Clone, Copy)]
enum First {
    Room,
    Data,
}

fn session(bells: Bells, first: First) {
    loom::model(move || {
        let page: Rc<[Shared; WORDS]> = Rc::new(core::array::from_fn(|_| Shared(AtomicU32::new(0))));
        let rx_bell = Rc::new(Pipe::new());
        let tx_bell = match bells {
            Bells::OneForBoth => Rc::clone(&rx_bell),
            Bells::OnePerDirection => Rc::new(Pipe::new()),
        };

        let mut net_rx = stream::Producer::new(&*page, RX);
        let mut client_rx = stream::Consumer::new(&*page, RX);
        let mut client_tx = stream::Producer::new(&*page, TX);
        let mut net_tx = stream::Consumer::new(&*page, TX);

        // The send ring starts full: the writer has a byte netstack has not taken.
        assert_eq!(client_tx.room(&*page), Ok(1));
        assert!(client_tx.advance(1));
        assert!(!client_tx.publish(&*page), "nobody armed yet");

        let netstack = {
            let (page, rx_bell, tx_bell) = (Rc::clone(&page), Rc::clone(&rx_bell), Rc::clone(&tx_bell));
            loom::thread::spawn(move || {
                let release_room = |net_tx: &mut stream::Consumer<RING, WORDS>| {
                    assert_eq!(net_tx.ready(&*page), Ok(1));
                    assert!(net_tx.advance(1));
                    if net_tx.release(&*page) {
                        tx_bell.ring();
                    }
                };
                let publish_data = |net_rx: &mut stream::Producer<RING, WORDS>| {
                    assert_eq!(net_rx.room(&*page), Ok(1));
                    assert!(net_rx.advance(1));
                    if net_rx.publish(&*page) {
                        rx_bell.ring();
                    }
                };
                match first {
                    First::Room => {
                        release_room(&mut net_tx);
                        publish_data(&mut net_rx);
                    }
                    First::Data => {
                        publish_data(&mut net_rx);
                        release_room(&mut net_tx);
                    }
                }
            })
        };

        let reader = {
            let (page, rx_bell) = (Rc::clone(&page), Rc::clone(&rx_bell));
            loom::thread::spawn(move || {
                while client_rx.ready(&*page) == Ok(0) {
                    if client_rx.arm(&*page) == Ok(0) {
                        rx_bell.wait();
                    }
                }
            })
        };

        while client_tx.room(&*page) == Ok(0) {
            if client_tx.arm(&*page) == Ok(0) {
                tx_bell.wait();
            }
        }

        reader.join().unwrap();
        netstack.join().unwrap();
    });
}

#[test]
fn one_bell_for_both_room_rung_first() {
    session(Bells::OneForBoth, First::Room);
}

#[test]
fn one_bell_for_both_data_rung_first() {
    session(Bells::OneForBoth, First::Data);
}

#[test]
fn one_bell_per_direction_room_rung_first() {
    session(Bells::OnePerDirection, First::Room);
}

#[test]
fn one_bell_per_direction_data_rung_first() {
    session(Bells::OnePerDirection, First::Data);
}
