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
my $data = "$Bin/data/prov";

my $exp = <<'EOM';
perl(Example1) = 1.0
perl(Example2) = 3.14159
perl(Example3) = 3.14
perl(Example4) = 3.14
perl(Example5)
EOM

my $exp_normal = <<'EOM';
perl(Example1) = 1.0.0
perl(Example2) = 3.141.590
perl(Example3) = 3.140.0
perl(Example4) = 3.140.0
perl(Example5)
EOM

my $exp_perln = <<'EOM';
perl(Example1) = 1.0
perln(Example1) = 1.0.0
perl(Example2) = 3.14159
perln(Example2) = 3.141.590
perl(Example3) = 3.14
perln(Example3) = 3.140.0
perl(Example4) = 3.14
perln(Example4) = 3.140.0
perl(Example5)
perln(Example5)
EOM

my $file1 = "$data/versions/Module.pm";
subtest various => sub {

    my $out = qx{$^X $prov $file1};
    is $out, $exp, 'perl.prov decimal versions as expected';
};

subtest normalize => sub {
    my $out = qx{$^X $prov --normalversion $file1};
    is $out, $exp_normal, 'perl.prov --normalversion as expected';

    $out = qx{$^X $prov --perln $file1};
    is $out, $exp_perln, 'perl.prov --normalversion as expected';
};

subtest other => sub {

    my $file2 = "$data/versions/Other.pm";

    $exp = <<'EOM';
perl(Example1) = 3.141_59
EOM

    $exp_normal = <<'EOM';
perl(Example1) = 3.141.590
EOM

    $exp_perln = <<'EOM';
perl(Example1) = 3.141_59
perln(Example1) = 3.141.590
EOM

    my $out = qx{$^X $prov $file2};
    is $out, $exp, 'perl.prov decimal versions as expected';

    subtest 'underscore normalize' => sub {
        if ($^V < v5.24) { # uncoverable branch true
            plan skip_all => 'Perl < v5.24 normalizes versions with underscores differently'; # uncoverable statement
        }
        $out = qx{$^X $prov --normalversion $file2};
        is $out, $exp_normal, 'perl.prov --normalversion as expected';

        $out = qx{$^X $prov --perln $file2};
        is $out, $exp_perln, 'perl.prov --normalversion as expected';
    };
};

done_testing;
