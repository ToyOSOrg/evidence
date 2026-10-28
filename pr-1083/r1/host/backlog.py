# A listener with backlog 1 that never accepts, and three connects in a row:
# what macOS answers each.
import socket, sys
backlog = int(sys.argv[1])
l = socket.socket(); l.bind(("127.0.0.1", 0)); l.listen(backlog)
port = l.getsockname()[1]
for i in range(4):
    c = socket.socket(); c.settimeout(3)
    try:
        c.connect(("127.0.0.1", port)); c.setblocking(True); c.settimeout(1)
        try:
            d = c.recv(1); print(i, "connected; recv ->", d)
        except Exception as e:
            print(i, "connected; recv ->", repr(e))
    except Exception as e:
        print(i, "connect ->", repr(e))
