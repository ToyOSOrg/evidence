mod common;
use toyos_ieee80211::element::{iter, Id};
use toyos_ieee80211::frame::Frame;
use toyos_ieee80211::mgmt::Body;
#[test]
fn scan() {
    for name in ["ieee802.11_exthdr", "ieee802.11_htc", "ieee802.11_meshid", "ieee802.11_rx-stbc", "ieee802.11_parse_elements_oobr", "ieee802.11_rates_oobr", "ieee802.11_tim_ie_oobr", "ieee802.11_meshhdr-oobr"] {
        let path = format!("{}/tests/fixtures/tcpdump/{name}.pcap", env!("CARGO_MANIFEST_DIR"));
        let file = std::fs::read(&path).unwrap();
        let (mut mgmt, mut country) = (0, 0);
        for f in common::pcap(&file).iter().map(common::mpdu) {
            let Ok(Frame::Management(m)) = Frame::parse(&f) else { continue };
            let elements = match Body::parse(m.subtype, m.body) {
                Ok(Body::Beacon(b) | Body::ProbeResponse(b)) => b.elements,
                Ok(Body::ProbeRequest { elements }) => elements,
                Ok(Body::AssociationRequest(a) | Body::ReassociationRequest(a)) => a.elements,
                Ok(Body::AssociationResponse(a) | Body::ReassociationResponse(a)) => a.elements,
                _ => continue,
            };
            mgmt += 1;
            country += iter(elements).filter(|e| matches!(e, Ok(e) if e.id == Id::COUNTRY)).count();
        }
        println!("{name}: {mgmt} management frames with element lists, {country} Country elements");
    }
}
