package Example1;

our $VERSION = 1.1;

=pod

=encoding utf-8

=head1 NAME

YAML::PP - YAML 1.2 processor

our $VERSION = 1;

=cut



package Example2;

our $VERSION = 1.2;

=head1 DESCRIPTION

our $VERSION = 2;

=cut



package Example3;

our $VERSION = 1.3;

=over

our $VERSION = 999;

=cut

package Example4;

our $VERSION = 1.4;

=item one

our $VERSION = 4;

=item two

our $VERSION = 5;

=back

=cut

package Example5;
our $VERSION = 1.5;

my $here1 = <<EOM;
our $VERSION = 6;
EOM

my $here2 = <<'EOM2';
our $VERSION = 7;
EOM2

package Example6;

our $VERSION = 1.6;
our $VERSION = 8; # NO_RPM_PERL_PROVIDES

package Example7;

our $VERSION = 1.7;

 # our $VERSION = 8;

package main;
our $VERSION = 3.14;

package Example8;

# note perl.prov does it wrong because printf would make it 1.008
our $VERSION = sprintf '%d.%03d', q$Revision: 1.8 $ =~ /: (\d+).(\d+)/;

our $RPM_Provides = "Extra1 Extra2::Module";

1;

__DATA__

package Data;

our $VERSION = 3.14;
