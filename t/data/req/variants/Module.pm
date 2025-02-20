package Module;

use 5.008009;
use v5.10;

use base 'Exporter';
use parent qw(Parent::Class);

require "/path/to/Module.pm";

require $some_module;

use Example::Module 1;

require Example2;

=head1 ABSTRACT

Just a test

use Ignored1;

=cut

=over

use Ignored1;

=back

=cut

my $here = <<"EOM";
use Ignored2;
EOM
# TODO we need a newline between two heredocs because the code is broken
my $here2 = <<EOM;
use Ignored3;
EOM

my $quoted = q{
use Ignored4;
};

our $RPM_Requires = "Extra1 Extra::Module2";

my $x = "
use Ignored5;
";
# TODO we need a newline between two heredocs because the code is broken
my $x = '
use Ignored6;
';

print "
use Ignored7;
";

print '
use Ignored7;
';

1;

__END__
use Ignored8;
