package OIB;

use strict;
use warnings;
use Carp;

use Exporter 'import';
our @EXPORT = qw(oib_provjera oib_kontrolna);

# za isprobati na komandnoj liniji:
# perl -MOIB -e 'print oib_kontrolna("0123456789")."\n";'
# perl -MOIB -e 'oib_provjera("12345678904") and print "OK\n" or print "Ne valja\n";'

# provjera kontrolne znamenke OIB-a
sub oib_provjera {
  my ($oib) = @_;
  $oib =~ s/^HR//;
  my $oib_zadnja = chop($oib);
  return $oib_zadnja eq oib_kontrolna($oib);
}

# izracun kontrolne znamenke (nepotpunog) OIB-a
sub oib_kontrolna {
  my ($oib) = @_;
  carp "oib_kontrolna: Prekratak OIB" unless $oib and ($oib ne "") and (length($oib) >= 10) and ($oib =~ m/^\d{10,11}$/);
  my (@znamenke, $a, $k);
  @znamenke = split(//, $oib);
  $a = 10;
  for (my $i = 0; $i < 10 && defined($znamenke[$i]); $i++) {
    $a = ($a + $znamenke[$i]) % 10; $a = 10 unless $a;
    $a <<= 1; $a %= 11;
  }
  $k = 11 - $a; if ($k == 10) { $k = 0; }
  return ($k);
}

# autor: http://qwp.me/dd

1;
