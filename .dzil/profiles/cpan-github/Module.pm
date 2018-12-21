use utf8;

{{
    ( $env_name    = uc $name ) =~ s/::/_/g;
    ( $config_name = lc $name ) =~ s/::/-/g;
    ( $dist_name   = $name    ) =~ s/::/-/g;
    ( $dir_name    = $name    ) =~ s{::}{/}g;
    q{};
}}package {{ $name }};

# ABSTRACT: {{ $name }}

use Params::ValidationCompiler qw( validation_for );
use Types::Standard qw(
    ArrayRef
    Bool
    HashRef
    Int
    Str
);

use Moo;
use strictures 2;
use namespace::clean;
use experimental qw( signatures );

our $VERSION = '0.001';

=attr foo

...

=cut

has foo => (
    is      => 'ro',
    isa     => ArrayRef,
    default => sub { [] },
);

=method bar

...

=cut

{
    my $validator = validation_for(
        params => {
            baz => {
                type     => Str,
                optional => 1,
                default  => 'baz string',
            },
            qux => {
                type     => Int,
                optional => 1,
                default  => 99,
            },
        },
    );
    sub bar ( $self, @_args ) {
        my %args = $validator->(@_args);

        #$args{baz}
        #$args{qux}
    }
}

1;

# COPYRIGHT

__END__

=for Pod::Coverage

=head1 SYNOPSIS

    use {{ $name }};

    ...

=head1 DESCRIPTION

...


=head1 INSTALLATION

L<{{ $name }}> uses well-tested and widely-used CPAN modules, so installation should be as simple as

    $ cpanm {{ $name }}

when using L<App::cpanminus>. Of course you can use your favorite CPAN client or install manually by cloning the L</"Source Code">.
