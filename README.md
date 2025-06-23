# Test2::Require::ProgramInPath ![static](https://github.com/uperl/Test2-Require-ProgramInPath/workflows/static/badge.svg) ![linux](https://github.com/uperl/Test2-Require-ProgramInPath/workflows/linux/badge.svg)

Skip test unless a program exists in the PATH

# SYNOPSIS

```perl
use Test2::Require::ProgramInPath 'gcc';
use Test2::V0;
use Test::Script qw( program_runs );

program_runs ['gcc', 'foo.c'];

done_testing;
```

# DESCRIPTION

This is skip unless a particular program can be found in the `PATH`.  Under the covers [File::Which](https://metacpan.org/pod/File::Which) is used.  This is a subclass of [Test2::Require](https://metacpan.org/pod/Test2::Require).

# METHODS

## skip

Should not be invoked directly, but returns \`undef\` if the test should not be skipped and a string containing
the reason why the test was skipped.  Currently \`This test only runs if $program is in the PATH\` is returned.

# SEE ALSO

- [File::Which](https://metacpan.org/pod/File::Which)
- [Test2::Require](https://metacpan.org/pod/Test2::Require)

# AUTHOR

Graham Ollis <plicease@cpan.org>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2025 by Graham Ollis.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
