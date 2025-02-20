#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin '$Bin';

# TODO only execute version->parse if flag is used
if ($] < 5.010) { # uncoverable branch true
    plan skip_all => 'Perl < v5.8 does not have version.pm'; # uncoverable statement
}

my $req = "$Bin/../scripts/perl.req";
my $data = "$Bin/data/req";

my $exp = <<'EOM';
perl(Example1)
perl(Example2) = 3.14
perl(Example3) = 1.2
EOM

my $exp_normal = <<'EOM';
perl(Example1)
perl(Example2) = 3.140.0
perl(Example3) = 1.200.0
EOM

my $exp_perln = <<'EOM';
perl(Example1)
perln(Example1)
perl(Example2) = 3.14
perln(Example2) = 3.140.0
perl(Example3) = 1.2
perln(Example3) = 1.200.0
EOM

my $file1 = "$data/versions/Module.pm";
subtest various => sub {

    my $out = qx{$^X $req $file1};
    is $out, $exp, 'perl.req decimal versions as expected';
};

subtest normalize => sub {
    my $out = qx{$^X $req --normalversion $file1};
    is $out, $exp_normal, 'perl.req --normalversion as expected';

    $out = qx{$^X $req --perln $file1};
    is $out, $exp_perln, 'perl.req --perln as expected';
};

done_testing;
