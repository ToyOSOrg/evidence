#!/bin/bash
cd $EVIDENCE/nc
M=./mutate.py
E=lib/bcachefs/src/engine
G="geometry::every_accepted geometry::a_publication_split geometry::one_publication geometry::an_encrypted_node_of_one_block_unmounts"
$M nc1-old-drain $E/mount/mod.rs nc1.old nc1.new -- geometry::every_accepted
$M nc2-no-join $E/mount/publish.rs nc2.old nc2.new -- $G mount::
$M nc3-drain-first $E/mount/publish.rs nc3.old nc3.new -- $G mount:: buckets::
$M nc4-no-settle $E/mount/publish.rs nc4.old nc4.new -- $G mount::
$M nc5-overwrite-old $E/mount/publish.rs nc5.old nc5.new -- geometry::a_node_of_one_block_survives crash::creates_survive_a_crash
$M nc6-skip-zero $E/journal.rs nc6.old nc6.new -- never_reappears
