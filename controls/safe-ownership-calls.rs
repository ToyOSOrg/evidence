//! Each item is safe code that reaches a handle's ownership by number; every
//! one must be refused by the compiler (E0133 or a type error).
use toyos_abi::{syscall, RawHandle};

pub fn close_by_number(h: RawHandle) { syscall::close(h) }
pub fn dup_by_number(h: RawHandle) { let _ = syscall::dup(h); }
pub fn dup_narrowed_by_number(h: RawHandle) { let _ = syscall::dup_narrowed(h, toyos_abi::handle::Rights::NONE); }
pub fn shm_sub_by_number(h: RawHandle) { let _ = syscall::shm_sub(h, 0, 4096); }
pub fn send_by_number(c: RawHandle, h: RawHandle) { let _ = syscall::message_send(c, b"x", &[h], false); }
pub fn dma_map_by_number(c: RawHandle, h: RawHandle) { let _ = syscall::device_dma_map(c, h); }
pub fn owned_from_number(h: RawHandle) -> toyos::OwnedHandle { toyos::OwnedHandle::from_raw(h) }
pub fn borrow_from_number(h: RawHandle) -> toyos::BorrowedHandle<'static> { toyos::BorrowedHandle::borrow_raw(h) }
