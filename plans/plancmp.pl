# plancmp.pl <before> <after>: per boot, the jobs the second plan drops from and adds to the first, and
# whether what both keep stands in the same order.
use strict; use warnings;
sub plan { my %p; open my $f, '<', shift or die; while (<$f>) { next unless /^(\S+): \d+ job\(s\).*?— \[(.*)\]$/; my ($b, $l) = ($1, $2); $p{$b} = [ $l =~ /"([^"]+)"/g ]; } \%p }
my ($a, $b) = (plan($ARGV[0]), plan($ARGV[1]));
for my $boot (sort keys %{{ %$a, %$b }}) {
  my @x = @{ $a->{$boot} // [] }; my @y = @{ $b->{$boot} // [] };
  my %iny = map { $_ => 1 } @y; my %inx = map { $_ => 1 } @x;
  my @drop = grep { !$iny{$_} } @x; my @add = grep { !$inx{$_} } @y;
  my @kx = grep { $iny{$_} } @x; my @ky = grep { $inx{$_} } @y;
  my $order = "@kx" eq "@ky" ? "same order" : "ORDER DIFFERS";
  next if !@drop && !@add && !exists($a->{$boot}) == !exists($b->{$boot}) && $order eq "same order";
  printf "%s: %s; drops [%s]; adds [%s]; %s\n", $boot, (exists $a->{$boot} ? "" : "new boot") . (exists $b->{$boot} ? "" : "boot gone"), join(", ", @drop), join(", ", @add), $order;
}
print "every other boot: identical\n";
