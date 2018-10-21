use utf8;

{{
    ( $env_name    = uc $name ) =~ s/::/_/g;
    ( $config_name = lc $name ) =~ s/::/-/g;
    ( $dist_name   = $name    ) =~ s/::/-/g;
    ( $dir_name    = $name    ) =~ s{::}{/}g;
    q{};
}}package {{ $name }};

# ABSTRACT: {{ $name }}

use Moo;

our $VERSION = '0.001';

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

    $ cpanm --mirror=https://cpan.theopencloset.net --mirror=http://cpan.silex.kr --mirror-only {{ $name }}

when using L<App::cpanminus>. Of course you can use your favorite CPAN client or install manually by cloning the L</"Source Code">.
