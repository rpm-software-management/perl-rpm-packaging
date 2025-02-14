package Example1;

our $VERSION = 1.1;

=pod

=encoding utf-8

=head1 NAME

YAML::PP - YAML 1.2 processor

our $VERSION = 11;

=cut



package Example2;

our $VERSION = 1.2;

=head1 DESCRIPTION

our $VERSION = 12;

=cut



package Example3;

our $VERSION = 1.3;

=over

our $VERSION = 13;

=cut

package Example4;

our $VERSION = 1.4;

=item one

our $VERSION = 14;

=item two

our $VERSION = 15;

=back

=cut

package Example5;
our $VERSION = 1.5;

# TODO support bare heredocs
# my $here1 = <<EOM;
# our $VERSION = 17;
#EOM

my $here2 = <<'EOM2';
our $VERSION = 18;
EOM2

package Example6;

our $VERSION = 1.6;
our $VERSION = 19; # NO_RPM_PERL_PROVIDES

package Example7;

our $VERSION = 1.7;

 # our $VERSION = 8;

package main;
our $VERSION = 3.14;

package Example8;

# note perl.prov does it wrong because printf would make it 1.008
our $VERSION = sprintf '%d.%03d', q$Revision: 1.8 $ =~ /: (\d+).(\d+)/;

our $RPM_Provides = "Extra1 Extra2::Module";

package Example9 1.9 { }

package Example10;
our $VERSION = '1.10';

package Example9 9.99 {
# Previous 1.9 should win
}

package Example11;
our $VERSION = 'not a number';

package Example12;
$Example12::VERSION = 1.12;

package Example13;
$VERSION = $VERSION = 1.13;

package Example14;
our $VERSION = "1.14";

package Example15;
our $VERSION = '1.15';

1;

__DATA__

package Data;

our $VERSION = 3.14;
