import json, socket, sys, time
# usage: qmp.py SOCK CMDJSON...  each arg a JSON QMP command, or "sleep:SEC"
s = socket.socket(socket.AF_UNIX); s.connect(sys.argv[1]); f = s.makefile('rw')
f.readline(); f.write(json.dumps({"execute": "qmp_capabilities"}) + "\n"); f.flush(); f.readline()
for a in sys.argv[2:]:
    if a.startswith("sleep:"):
        time.sleep(float(a[6:])); continue
    f.write(a + "\n"); f.flush()
    while True:
        line = json.loads(f.readline())
        if "event" in line: continue
        print(json.dumps(line)); break
