# Provider key initialization in its final allocation

TLS record constructors previously built expanded keys in temporary record
values before Box allocation. The provider now builds zero storage and public
metadata, allocates the final Seal/Open object, then initializes the key through
a non-inlined mutable borrow. AES expansion writes into its borrowed schedule;
GCM computes H in its final field. ChaCha copies the borrowed traffic key
directly into its final field. Only a Box pointer moves after initialization.
No new unsafe code or public API is introduced.

The provider-only storage helpers must be initialized before any cryptographic
operation. They remain inside the crate; the completed provider constructors
perform that initialization before returning a trait object. Every secret
field is a valid, Drop-wiped owner even during initialization. These private
construction invariants need review along with the code-generation evidence.

ARM dispatched and portable suites each pass 48 tests, including the existing
TLS interoperability and key-update matrix. All-target/all-feature host lint,
Rust 1.89 host library check, and Linux/Windows/UEFI provider cross-checks pass.
Complete logs, full ARM/x86 release assembly and focused constructor/initializer
excerpts are retained here.

For each inspected target, both opening and sealing constructors allocate
before calling Key::initialize. Every constructor memcpy/memmove call is before
that initialization call; none copies the newly initialized record afterwards.
The copied pre-initialization storage contains zeros and public metadata. The
initialization argument is a pointer into the returned heap allocation. AES
expansion receives the schedule's address, and H is encrypted at its final
address. ChaCha's raw key loads store directly to the key owner's address.
constructor-order.json records the call order and exact assembly line numbers;
the full assembly supports inspection of pointer flow and non-call instructions.

This addresses the identified provider expanded-key move in these builds.
It does not erase arbitrary compiler spills, registers, caller-owned AeadKey
arguments, prior moves in the core's by-value constructors, or abort-time data.
The volatile Drop contract remains limited to owned storage. Native x86
execution of this change and independent review remain pending. Earlier AVX2
qualification requests target the preceding commit and cannot qualify this
subsequent constructor change.
