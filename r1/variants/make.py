# Scratch: writes one patch per ablation (each technique taken back out of the
# branch's lib/crypto), as `patch -p1` input relative to lib/crypto.
import subprocess, os, shutil, sys
W = '~/Dev/jan/toyos-aes-gcm/lib/crypto'
OUT = os.path.dirname(os.path.abspath(__file__))

def edit(files, edits):
    for f, a, b in edits:
        s = files[f]
        assert s.count(a) == 1, (f, a[:80], s.count(a))
        files[f] = s.replace(a, b)

V = {}
V['a1-reduce-every-step'] = [
 ('src/arch/x86_64/vaes512.rs', """        let left = match steps % 3 {
            0 => 3,
            m => m,
        };""", """        let _ = steps;
        let left = 1;"""),
 ('src/arch/x86_64/vaes512.rs', "            self.left = 3;\n", "            self.left = 1;\n"),
 ('src/arch/x86_64/vaes512.rs', 'debug_assert_eq!(self.left, 3, "a group is unreduced");', 'debug_assert_eq!(self.left, 1, "a group is unreduced");'),
]
V['a2-karatsuba'] = [
 ('src/arch/x86_64/vaes512.rs', """            middle: _mm512_xor_si512(_mm512_clmulepi64_epi128::<0x01>(x, h), _mm512_clmulepi64_epi128::<0x10>(x, h)),""",
  """            middle: _mm512_clmulepi64_epi128::<0x00>(fold64(x), fold64(h)),"""),
 ('src/arch/x86_64/vaes512.rs', """    /// Adds x·h and y·g.
    #[inline]
    #[target_feature(enable = "avx512f,vpclmulqdq")]
    fn add(&mut self, x: __m512i, h: __m512i, y: __m512i, g: __m512i) {
        self.low = xor3(self.low, _mm512_clmulepi64_epi128::<0x00>(x, h), _mm512_clmulepi64_epi128::<0x00>(y, g));
        self.high = xor3(self.high, _mm512_clmulepi64_epi128::<0x11>(x, h), _mm512_clmulepi64_epi128::<0x11>(y, g));
        self.middle =
            xor3(self.middle, _mm512_clmulepi64_epi128::<0x01>(x, h), _mm512_clmulepi64_epi128::<0x10>(x, h));
        self.middle =
            xor3(self.middle, _mm512_clmulepi64_epi128::<0x01>(y, g), _mm512_clmulepi64_epi128::<0x10>(y, g));
    }""", """    /// Adds x·h and y·g, Karatsuba, with h's and g's folds.
    #[inline]
    #[target_feature(enable = "avx512f,vpclmulqdq")]
    fn add(&mut self, x: __m512i, h: __m512i, hf: __m512i, y: __m512i, g: __m512i, gf: __m512i) {
        self.low = xor3(self.low, _mm512_clmulepi64_epi128::<0x00>(x, h), _mm512_clmulepi64_epi128::<0x00>(y, g));
        self.high = xor3(self.high, _mm512_clmulepi64_epi128::<0x11>(x, h), _mm512_clmulepi64_epi128::<0x11>(y, g));
        self.middle = xor3(
            self.middle,
            _mm512_clmulepi64_epi128::<0x00>(fold64(x), hf),
            _mm512_clmulepi64_epi128::<0x00>(fold64(y), gf),
        );
    }"""),
 ('src/arch/x86_64/vaes512.rs', """    fn reduce_lanes(self) -> __m512i {
        let low""", """    fn reduce_lanes(self) -> __m512i {
        let middle = xor3(self.middle, self.low, self.high);
        let s = Self { middle, ..self };
        let low"""),
 ('src/arch/x86_64/vaes512.rs', """        let low = _mm512_xor_si512(self.low, _mm512_bslli_epi128::<8>(self.middle));
        let high = _mm512_xor_si512(self.high, _mm512_bsrli_epi128::<8>(self.middle));""",
  """        let low = _mm512_xor_si512(s.low, _mm512_bslli_epi128::<8>(s.middle));
        let high = _mm512_xor_si512(s.high, _mm512_bsrli_epi128::<8>(s.middle));"""),
 ('src/arch/x86_64/vaes512.rs', """/// `powers[at..at + 4]`, one to a lane""", """/// Each lane's halves XORed.
#[inline]
#[target_feature(enable = "avx512f")]
fn fold64(x: __m512i) -> __m512i {
    _mm512_xor_si512(x, _mm512_shuffle_epi32::<0x4e>(x))
}

/// `powers[at..at + 4]`, one to a lane"""),
 ('src/arch/x86_64/vaes512.rs', """    sums: Sums,
    /// The last reduction""", """    sums: Sums,
    folds: [__m512i; 12],
    /// The last reduction"""),
 ('src/arch/x86_64/vaes512.rs', """        Self { powers, sums: Sums::zero(), carry: _mm512_zextsi128_si512(y), left }""",
  """        let mut folds = [_mm512_setzero_si512(); 12];
        for i in 0..12 {
            folds[i] = fold64(powers4(powers, 4 * i));
        }
        Self { powers, sums: Sums::zero(), folds, carry: _mm512_zextsi128_si512(y), left }"""),
 ('src/arch/x86_64/vaes512.rs', """        self.sums.add(first, powers4(self.powers, at), x[1], powers4(self.powers, at + 4));
        self.sums.add(x[2], powers4(self.powers, at + 8), x[3], powers4(self.powers, at + 12));""",
  """        let f = &self.folds[at / 4..at / 4 + 4];
        self.sums.add(first, powers4(self.powers, at), f[0], x[1], powers4(self.powers, at + 4), f[1]);
        self.sums.add(x[2], powers4(self.powers, at + 8), f[2], x[3], powers4(self.powers, at + 12), f[3]);"""),
]
V['a3-scalar-counters'] = [
 ('src/arch/x86_64/vaes512.rs', """        let (n, q) = (self.next, self.quad);
        self.next = n.wrapping_add(16);
        // Up to n + 19, the next quad's last lane, the low byte does not carry.
        if n & 0xff <= 0xff - 19 {
            self.quad = Self::plus(q, 16);
            [q, Self::plus(q, 4), Self::plus(q, 8), Self::plus(q, 12)]
        } else {
            self.quad = Self::quad(self.nonce, self.next);
            let nonce = self.nonce;
            [q, Self::quad(nonce, n.wrapping_add(4)), Self::quad(nonce, n.wrapping_add(8)), Self::quad(nonce, n.wrapping_add(12))]
        }""", """        let n = self.next;
        self.next = n.wrapping_add(16);
        let mut out = [_mm512_setzero_si512(); 4];
        for j in 0..4 {
            let mut words = [0u32; 16];
            for l in 0..4 {
                words[4 * l + 3] = n.wrapping_add(4 * j as u32 + l as u32).to_be();
            }
            out[j] = _mm512_or_si512(self.nonce, unsafe { core::mem::transmute::<[u32; 16], __m512i>(words) });
        }
        out"""),
]
V['a4-two-pass-open'] = [
 ('src/gcm.rs', """                None => crate::ct::equal(&self.tag(nonce, self.crypt(nonce, aad, data, true)).0, tag),""",
  """                None => {
                    let mut state = Secret([0u8; 16]);
                    self.hash(&mut state.0, aad);
                    self.hash(&mut state.0, data);
                    self.hash_blocks(&mut state.0, &[Self::lengths(aad.len(), data.len())]);
                    let authentic = crate::ct::equal(&self.tag(nonce, state).0, tag);
                    if authentic {
                        self.xor(nonce, 2, data);
                    }
                    authentic
                }"""),
 ('src/arch/x86_64.rs', """        if !features().aes_clmul() {
            return false;
        }
        // AES and SSSE3 are admitted.
        unsafe { aesni::ctr(keys, rounds, nonce, counter, data) }
        true""", """        let features = features();
        if data.len() >= 512 && features.vaes512() {
            unsafe { vaes512::ctr(keys, rounds, nonce, counter, data) }
        } else if features.aes_clmul() {
            unsafe { aesni::ctr(keys, rounds, nonce, counter, data) }
        } else {
            return false;
        }
        true"""),
 ('src/arch/x86_64/vaes512.rs', """#[target_feature(enable = "avx512f,avx512bw,avx512vl,vaes,aes,vpclmulqdq,pclmulqdq,sse2,ssse3")]
fn hash_body(""", """#[target_feature(enable = "avx512f,avx512bw,avx512vl,vaes,aes,vpclmulqdq,pclmulqdq,sse2,ssse3")]
fn ctr_body<const R: usize>(keys: &[u8; 240], nonce: &[u8; 12], first: u32, data: &mut [u8]) {
    let (steps, rest) = data.as_chunks_mut::<256>();
    let (slots, _) = keys.as_chunks::<16>();
    let k: &[[u8; 16]; 15] = slots.try_into().unwrap();
    let mut counter = Counter::new(nonce, first);
    for t in 0..steps.len() {
        let (quads, _) = steps[t].as_chunks_mut::<64>();
        let mut s = counter.next16();
        let k0 = key(k, 0);
        for j in 0..4 {
            s[j] = _mm512_xor_si512(s[j], k0);
        }
        for r in 1..R {
            let key = key(k, r);
            for j in 0..4 {
                s[j] = _mm512_aesenc_epi128(s[j], key);
            }
        }
        let last = key(k, R);
        for j in 0..4 {
            let stream = _mm512_xor_si512(_mm512_aesenclast_epi128(s[j], last), load4(&quads[j]));
            store4(&mut quads[j], stream);
        }
    }
    let next = first.wrapping_add(16 * steps.len() as u32);
    unsafe { aesni::ctr(keys, R, nonce, next, rest) }
}

pub(super) unsafe fn ctr(keys: &[u8; 240], rounds: usize, nonce: &[u8; 12], first: u32, data: &mut [u8]) {
    unsafe {
        if rounds == 10 {
            ctr_body::<10>(keys, nonce, first, data)
        } else {
            ctr_body::<14>(keys, nonce, first, data)
        }
    }
}

#[target_feature(enable = "avx512f,avx512bw,avx512vl,vaes,aes,vpclmulqdq,pclmulqdq,sse2,ssse3")]
fn hash_body("""),
]
V['a5-keys-from-memory'] = [
 ('src/arch/x86_64/vaes512.rs', """    for t in 0..n {
        let (quads, _) = steps[t].as_chunks_mut::<64>();
        let mut input""", """    for t in 0..n {
        let k = core::hint::black_box(k);
        let (quads, _) = steps[t].as_chunks_mut::<64>();
        let mut input"""),
]

sys.path.insert(0, OUT + '/../mutants')
import mutants
for n, f, a, b in mutants.M:
    V.setdefault(n, []).append((f, a, b))

which = sys.argv[1:] or [n for n in V if n.startswith('a')]
for name in which:
    tmp = OUT + '/tmp'
    shutil.rmtree(tmp, ignore_errors=True)
    shutil.copytree(W + '/src', tmp + '/b/src')
    shutil.copytree(W + '/src', tmp + '/a/src')
    files = {}
    for f, _, _ in V[name]:
        files.setdefault(f, open(tmp + '/b/' + f).read())
    edit(files, V[name])
    for f, s in files.items():
        open(tmp + '/b/' + f, 'w').write(s)
    d = subprocess.run(['diff', '-ru', 'a', 'b'], cwd=tmp, capture_output=True, text=True).stdout
    open(f'{OUT}/{name}.patch', 'w').write(d)
    print(name, len(d.splitlines()), 'lines')
    shutil.rmtree(tmp)
