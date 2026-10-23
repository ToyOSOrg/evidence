printf '%s\n' $(tr 0 1 < pass) > wrong; bcachefs unlock -k session -f wrong data-64m.img; echo exit $?
