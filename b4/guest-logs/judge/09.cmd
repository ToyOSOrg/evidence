diff <(LC_ALL=C sort root-x86_64.manifest) <(LC_ALL=C sort /tmp/root-x86_64.seen) && wc -l < root-x86_64.manifest && echo manifest-ok
