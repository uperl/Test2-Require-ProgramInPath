use warnings;
use 5.020;
use experimental qw( signatures );
use true;

package Test2::Require::ProgramInPath {

    # ABSTRACT: Skip test unless a program exists in the PATH

=head1 SYNOPSIS

 use Test2::Require::ProgramInPath 'gcc';
 use Test2::V0;
 use Test::Script qw( program_runs );
 
 program_runs ['gcc', 'foo.c'];
 
 done_testing;

=head1 DESCRIPTION

This is skip unless a particular program can be found in the C<PATH>.  Under the covers L<File::Which> is used.  This is a subclass of L<Test2::Require>.

=head1 METHODS

=head2 skip

Should not be invoked directly, but returns `undef` if the test should not be skipped and a string containing
the reason why the test was skipped.  Currently `This test only runs if $program is in the PATH` is returned.

=cut

    use File::Which ();
    use Carp qw( confess );
    use parent qw( Test2::Require );

    sub skip ( $, $program = undef ) {
        confess "no program specified" unless defined $program;
        return undef if File::Which::which $program;
        return "This test only runs if $program is in the PATH";
    }
}


=head1 SEE ALSO

=over 4

=item L<File::Which>

=item L<Test2::Require>

=back

=cut
