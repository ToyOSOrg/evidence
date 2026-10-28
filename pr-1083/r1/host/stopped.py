# Connects to QEMU's forwarded port while QEMU is suspended (so slirp accepts
# nothing): what each of two back-to-back connects is answered.
import socket, sys
port = int(sys.argv[1])
for i in range(2):
    c = socket.socket(); c.settimeout(3)
    try:
        c.connect(("127.0.0.1", port)); print(i, "connected")
    except Exception as e:
        print(i, "connect ->", repr(e))
