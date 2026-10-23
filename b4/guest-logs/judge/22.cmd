diff <(LC_ALL=C sort root-aarch64.manifest) <(LC_ALL=C sort /tmp/root-aarch64.seen) && wc -l < root-aarch64.manifest && echo manifest-ok
