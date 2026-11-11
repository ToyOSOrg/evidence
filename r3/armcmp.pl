# armcmp.pl <main toyos.rs> <branch toyos.rs> <name>...: each named screen test's arm in main's
# run_screen_test against the branch's function of that name, both with leading whitespace stripped
# and `name` read as the literal; prints a diff per test, or "same".
use strict; use warnings;
my ($mainf, $branchf, @names) = @ARGV;
sub slurp { local $/; open my $f, '<', shift or die; <$f> }
my ($main, $branch) = (slurp($mainf), slurp($branchf));
sub block {  # lines from the opening line's brace to its matching close
  my ($text, $start) = @_;
  my $at = index($text, $start); die "no $start" if $at < 0;
  my $open = index($text, "{", $at); my $depth = 0; my $i = $open;
  for (; $i < length $text; $i++) { my $c = substr($text, $i, 1); $depth++ if $c eq '{'; $depth-- if $c eq '}'; last if $depth == 0; }
  return substr($text, $open + 1, $i - $open - 1);
}
sub norm { my ($t, $n) = @_; $t =~ s/print_screen\(name,/print_screen("$n",/g; join("\n", grep { $_ ne '' } map { s/^\s+//r } split /\n/, $t) . "\n" }
for my $n (@names) {
  my $arm = norm(block($main, "\"$n\" =>"), $n);
  my $fn = norm(block($branch, "fn $n("), $n);
  open my $a, '>', "<tmp> or die; print $a $arm; close $a;
  open my $b, '>', "<tmp> or die; print $b $fn; close $b;
  my $d = `diff <tmp> <tmp>
  print "== $n: ", ($d eq '' ? "same\n" : "DIFFERS\n$d");
  unlink "<tmp> "<tmp>
}
