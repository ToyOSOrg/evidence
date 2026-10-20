# usage: python3 -I amplify.py <tests dir>
# Widens the window the CI hit: each model's final vacuity check waits 50 ms after its
# exploration, and smp_bringup's second test starts 10 ms late. Logic is untouched.
import sys
d=sys.argv[1]
SLEEP="    std::thread::sleep(std::time::Duration::from_millis(50));\n"
p=d+'/tlb_shootdown.rs'; s=open(p).read()
old="    assert!(\n        ACKED.load(SeqCst),"
if old in s:
    n=s.count(old); assert n==5,n; s=s.replace(old,SLEEP+old)
else:
    old='    assert!(acked.load(SeqCst), "no interleaving'
    assert s.count(old)==1; s=s.replace(old,SLEEP+old)
open(p,'w').write(s)
p=d+'/smp_bringup.rs'; s=open(p).read()
old="    assert!(\n        SAW.load(SeqCst),"
assert s.count(old)==2; s=s.replace(old,SLEEP+old)
old="fn a_released_machine_is_answering() {\n"
assert s.count(old)==1; s=s.replace(old,old+"    std::thread::sleep(std::time::Duration::from_millis(10));\n")
open(p,'w').write(s)
