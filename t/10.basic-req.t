#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin '$Bin';

my $req = "$Bin/../scripts/perl.req";
my $data = "$Bin/data/req";

subtest basic => sub {
    my $exp = <<'EOM';
perl(Example) = 3.15
EOM
    if ($] < 5.010) { # uncoverable branch true
        # perl 5.18 does not have version.pm
        $exp = <<'EOM'; # uncoverable statement
perl(Example) = 3.14
EOM
    }

    my $out = qx{find $data/basic -type f | $^X $req};
    is $out, $exp, 'perl.req (STDIN) output as expected';

    chomp(my @files = qx{find $data/basic -type f});
    $out = qx{$^X $req @files};
    is $out, $exp, 'perl.req (@ARGV) output as expected';
};

subtest errors => sub {
    my $out = qx{$^X $req $data/basic/some/nonexistant/file.pm 2>&1};
    my $rc = $?;
    is $rc, 0, 'Missing file still exits with 0';
    like $out, qr{Could not open file.*for reading}, 'Warning about missing file';
};

done_testing;

