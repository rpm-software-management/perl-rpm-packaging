#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin '$Bin';

# TODO only execute version->parse if flag is used
if ($] < 5.010) { # uncoverable branch true
    plan skip_all => 'Perl < v5.8 does not have version.pm'; # uncoverable statement
}

my $prov = "$Bin/../scripts/perl.prov";
my $data = "$Bin/data";

my $exp = <<'EOM';
Extra1
Extra2::Module
perl(Example1) = 1.1
perl(Example10) = 1.10
perl(Example11)
perl(Example12) = 1.12
perl(Example13) = 1.13
perl(Example14) = 1.14
perl(Example15) = 1.15
perl(Example2) = 1.2
perl(Example3) = 1.3
perl(Example4) = 1.4
perl(Example5) = 1.5
perl(Example6) = 1.6
perl(Example7) = 1.7
perl(Example8) = 1.8
perl(Example9) = 1.9
EOM

chomp(my @files = qx{find $data/variants});

my $out = qx{$^X $prov @files};
is $out, $exp, 'perl.prov (@ARGV) output as expected';

done_testing;
