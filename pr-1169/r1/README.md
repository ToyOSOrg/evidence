# pr-1169 r1 (head a0fb2d9e2)

- `remote-ps2-r1.log`: jan-pc (KVM), `session_lifecycle` at a0fb2d9e2: PASS, rc=0.
- `remote-ps2-ctl.log` + `control-skip-key.patch`: the same head with the tenth key (`y`) never
  pressed (scratch revision d0dc31069, never merged): FAIL, rc=1, "the panel never changed after
  \"y\" of \"detach /system/bin/hangupholder\" was typed".
