#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin '$Bin';

my $prov = "$Bin/../scripts/perl.prov";
my $data = "$Bin/data";

my $exp = <<'EOM';
perl(Example1) = 1.0
perl(Example2) = 3.14159
perl(Example3) = 3.141_59
perl(Example4)
EOM

my $exp_normal = <<'EOM';
perl(Example1) = 1.0.0
perl(Example2) = 3.141.590
perl(Example3) = 3.141.590
perl(Example4)
EOM

my $exp_perln = <<'EOM';
perl(Example1) = 1.0
perln(Example1) = 1.0.0
perl(Example2) = 3.14159
perln(Example2) = 3.141.590
perl(Example3) = 3.141_59
perln(Example3) = 3.141.590
perl(Example4)
perln(Example4)
EOM

chomp(my @files = qx{find $data/versions});

my $out = qx{$^X $prov @files};
is $out, $exp, 'perl.prov decimal versions as expected';

$out = qx{$^X $prov --normalversion @files};
is $out, $exp_normal, 'perl.prov --normalversion as expected';

$out = qx{$^X $prov --perln @files};
is $out, $exp_perln, 'perl.prov --normalversion as expected';

done_testing;
