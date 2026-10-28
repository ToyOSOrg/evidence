//! Safe code that reaches a handle's ownership by descriptor number, or keeps a
//! stream's bell past the borrow it came from: each must be refused.
use toyos::{BorrowedHandle, OwnedHandle};

pub fn close_by_descriptor(fd: i32) { let _ = toyos::fd::close(fd); }
pub fn dup2_over_a_descriptor(old: i32, new: i32) { let _ = toyos::fd::dup2(old, new, false); }
pub fn replace_a_descriptor(fd: i32, h: OwnedHandle) { let _ = toyos::fd::replace(fd, toyos::fd::Object::handle(h)); }
pub fn bell_outliving_its_stream(stream: &OwnedHandle) -> BorrowedHandle<'static> {
    toyos::net::stream::doorbell(toyos::AsHandle::as_handle(stream), toyos::net::stream::Way::Send).unwrap()
}
