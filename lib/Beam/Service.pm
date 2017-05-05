package Beam::Service;
our $VERSION = '0.001';
# ABSTRACT: Role for services to access Beam::Wire features

=head1 SYNOPSIS

    package My::Object;
    use Role::Tiny::With; # or Moo, or Moose
    with 'Beam::Service';

    package main;
    use Beam::Wire;
    my $wire = Beam::Wire->new(
        config => {
            my_object => {
                '$class' => 'My::Object',
            },
        },
    );

    print $wire->get( 'my_object' )->name; # my_object

=head1 DESCRIPTION

This role adds extra functionality to an object that is going to be used
as a service in a L<Beam::Wire> container. While any object can be
configured with Beam::Wire, consuming the Beam::Service role allows an
object to know its own name and to access the container it was
configured in to fetch other objects that it needs.

=head1 SEE ALSO

L<Beam::Wire>

=cut

use strict;
use warnings;
use Moo::Role;
use Types::Standard qw( Str InstanceOf );

=attr name

The name of the service. This is the name used in the L<Beam::Wire>
configuration file for this service.

=cut

has name => (
    is => 'ro',
    isa => Str,
);

=attr container

The L<Beam::Wire> container object that contained this service. Using
this container we can get other services as-needed.

=cut

has container => (
    is => 'ro',
    isa => InstanceOf['Beam::Wire'],
);

1;

