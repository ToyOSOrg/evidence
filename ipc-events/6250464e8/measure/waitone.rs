//! MEASUREMENT ONLY, never lands: a one-handle wait three ways, for the
//! decision whether SYS_HANDLE_WAIT replaces the one-shot pollers.
//! - fresh: Poller::new(1), watch, wait, drop, per wait (today's sites).
//! - cached: one Poller kept, watch and wait per wait (the alternative).
//! - handle_wait: SYS_HANDLE_WAIT.
//! `ready`: the bell is pending, so no wait parks: the setup alone.
//! `pingpong`: two threads ring each other's bell and wait on their own.

use std::sync::Arc;
use std::time::Instant;

use toyos::poller::{wait_one, Poller, READABLE};
use toyos::wake::{self, Bell, Waker};

use crate::ns_since;
use crate::report::result;

const WARMUP: usize = 500;
const SAMPLES: usize = 10_000;

#[derive(Clone, Copy)]
enum Way {
    Fresh,
    Cached,
    HandleWait,
}

impl Way {
    fn name(self) -> &'static str {
        match self {
            Way::Fresh => "fresh_poller",
            Way::Cached => "cached_poller",
            Way::HandleWait => "handle_wait",
        }
    }
}

struct Waiter {
    way: Way,
    cached: Option<Poller>,
}

impl Waiter {
    fn new(way: Way) -> Self {
        Self { way, cached: matches!(way, Way::Cached).then(|| Poller::new(1)) }
    }

    fn wait(&self, bell: &Bell) {
        match self.way {
            Way::Fresh => {
                let poller = Poller::new(1);
                poller.watch(bell, READABLE, 0);
                poller.wait(1, u64::MAX - 1, |_| {});
            }
            Way::Cached => {
                let poller = self.cached.as_ref().expect("a cached poller");
                poller.watch(bell, READABLE, 0);
                poller.wait(1, u64::MAX - 1, |_| {});
            }
            Way::HandleWait => {
                assert!(wait_one(bell, READABLE, u64::MAX - 1).expect("a wait"));
            }
        }
    }
}

pub fn suite() {
    for way in [Way::Fresh, Way::Cached, Way::HandleWait] {
        ready(way);
    }
    for way in [Way::Fresh, Way::Cached, Way::HandleWait] {
        pingpong(way);
    }
}

fn ready(way: Way) {
    let (waker, bell) = wake::pair().expect("an event");
    waker.wake();
    let waiter = Waiter::new(way);
    for _ in 0..WARMUP {
        waiter.wait(&bell);
    }
    crate::clock::settle();
    let mut ns = Vec::with_capacity(SAMPLES);
    for _ in 0..SAMPLES {
        let t = Instant::now();
        waiter.wait(&bell);
        ns.push(ns_since(t));
    }
    result(&format!("waitone.ready.{}", way.name()), "ns", &mut ns, &[]);
}

fn pingpong(way: Way) {
    let (to_pong, pong_bell) = wake::pair().expect("an event");
    let (to_ping, ping_bell) = wake::pair().expect("an event");
    let to_ping = Arc::new(to_ping);
    let echo = {
        let to_ping: Arc<Waker> = Arc::clone(&to_ping);
        std::thread::spawn(move || {
            let waiter = Waiter::new(way);
            for _ in 0..WARMUP + SAMPLES {
                waiter.wait(&pong_bell);
                pong_bell.take();
                to_ping.wake();
            }
        })
    };
    let waiter = Waiter::new(way);
    let mut ns = Vec::with_capacity(SAMPLES);
    for i in 0..WARMUP + SAMPLES {
        let t = Instant::now();
        to_pong.wake();
        waiter.wait(&ping_bell);
        ping_bell.take();
        if i >= WARMUP {
            ns.push(ns_since(t));
        }
    }
    echo.join().expect("the echo thread");
    result(&format!("waitone.pingpong.{}", way.name()), "ns", &mut ns, &[]);
}
