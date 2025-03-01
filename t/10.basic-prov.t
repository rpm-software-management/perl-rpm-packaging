#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use FindBin '$Bin';

my $prov = "$Bin/../scripts/perl.prov";
my $data = "$Bin/data/prov";

subtest basic => sub {
    my $exp = <<'EOM';
perl(Example::Module) = 3.14159
EOM

    my $out = qx{find $data/basic | $^X $prov};
    is $out, $exp, 'perl.prov (STDIN) output as expected';

    chomp(my @files = qx{find $data/basic});
    $out = qx{$^X $prov @files};
    is $out, $exp, 'perl.prov (@ARGV) output as expected';
};

subtest errors => sub {
    my $out = qx{$^X $prov $data/some/nonexistant/file.pm 2>&1};
    my $rc = $?;
    is $rc, 0, 'Missing file still exits with 0';
    like $out, qr{Could not open file.*for reading}, 'Warning about missing file';

    $out = qx{$^X $prov $data/broken/Module1.pm 2>&1};
    $rc = $? >> 8;
    is $rc, 255, 'Broken heredoc exits with 255';
    like $out, qr{Unclosed HEREDOC \[EOM\] in.*Module1.pm}, 'Error about broken heredoc';
};


done_testing;
