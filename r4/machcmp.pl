# machcmp.pl <main toyos.rs> <branch toyos.rs>: each arm of main's run_machine_test against the branch's
# MACHINE_TESTS entry of that name, whitespace removed; prints the ones that differ and the counts.
use strict; use warnings;
sub slurp { local $/; open my $f, '<', shift or die; <$f> }
my ($main, $branch) = map { slurp($_) } @ARGV;
my ($fn) = $main =~ /fn run_machine_test\(name: &str, test_config: &Path\) -> Result<\(\), String> \{\n    match name \{\n(.*?)\n        other => Err/s or die "no run_machine_test";
my %arm; my $text = $fn;
# arms: "name" => expr, where expr may span lines and end at the comma before the next arm or the end
while ($text =~ /^        "([a-z0-9_]+)" => (.*?)(?=^        "[a-z0-9_]+" =>|\z)/msg) {
  my ($n, $e) = ($1, $2); $e =~ s/\s+//g; $e =~ s/,$//; $e =~ s/^\{(.*)\}$/$1/; $arm{$n} = $e;
}
my ($table) = $branch =~ /const MACHINE_TESTS: &\[MachineTest\] = &\[\n(.*?)\n\];/s or die "no MACHINE_TESTS table";
$table =~ s{^\s*//.*$}{}mg;
my %entry;
while ($table =~ /\("([a-z0-9_]+)",\s*\|(\w+)\|\s*(.*?)\),\s*(?=\("|\z)/sg) {
  my ($n, $p, $e) = ($1, $2, $3); $e =~ s/\s+//g; $e =~ s/,$//; $e =~ s/^\{(.*)\}$/$1/; $e =~ s/\b\Q$p\E\b/test_config/g if $p ne '_'; $entry{$n} = $e;
}
my ($same, $diff) = (0, 0);
for my $n (sort keys %arm) {
  if (!exists $entry{$n}) { print "MISSING in the branch: $n\n"; $diff++; next }
  if ($entry{$n} eq $arm{$n}) { $same++ } else { print "DIFFERS $n\n  main:   $arm{$n}\n  branch: $entry{$n}\n"; $diff++ }
}
for my $n (sort keys %entry) { print "EXTRA in the branch: $n\n" unless exists $arm{$n} }
print "arms ", scalar(keys %arm), ", entries ", scalar(keys %entry), ", same $same, differing $diff\n";
