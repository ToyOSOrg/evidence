#[derive(Debug)]
struct SystemRandom;
impl rustls::crypto::SecureRandom for SystemRandom {
    fn fill(&self, b: &mut [u8]) -> Result<(), rustls::crypto::GetRandomFailed> { getrandom::fill(b).map_err(|_| rustls::crypto::GetRandomFailed) }
}
static TLS: toyos_crypto::rustls_provider::Backend = toyos_crypto::rustls_provider::Backend::new(&SystemRandom);
fn main() {
    let mut p = TLS.provider();
    p.kx_groups.retain(|g| matches!(g.name(), rustls::NamedGroup::X25519MLKEM768 | rustls::NamedGroup::X25519));
    let tls = ureq::tls::TlsConfig::builder().unversioned_rustls_crypto_provider(std::sync::Arc::new(p)).build();
    let agent = ureq::Agent::config_builder().user_agent("toyos-build (https://github.com/ToyOSOrg/ToyOS)").http_status_as_error(false).tls_config(tls).build().new_agent();
    for url in ["https://api.github.com/repos/ToyOSOrg/ToyOS", "https://index.crates.io/config.json", "https://github.com/ozkl/doomgeneric/archive/refs/heads/master.tar.gz", "https://static.crates.io/crates/libm/libm-0.2.16.crate"] {
        match agent.get(url).call() {
            Ok(mut r) => { let n = r.body_mut().read_to_vec().map(|v| v.len()); println!("{url}: {} ({:?} bytes)", r.status(), n) }
            Err(e) => println!("{url}: ERROR {e}"),
        }
    }
}
