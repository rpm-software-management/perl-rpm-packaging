#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin '$Bin';

my $req = "$Bin/../scripts/perl.req";
my $data = "$Bin/data/req";

my $exp = <<'EOM';
/path/to/Module.pm
Extra1
Extra::Module2
perl >= 0:5.008009
perl >= 1:5.10
perl(Example2)
perl(Example::Module) = 1
perl(Exporter)
perl(Parent::Class)
perl(base)
perl(parent)
EOM

my $out = qx{$^X $req $data/variants/Module.pm};
is $out, $exp, 'perl.req (@ARGV) output as expected';

done_testing;
