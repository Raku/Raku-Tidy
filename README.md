[![Build Status](https://travis-ci.org/Raku/Raku-Tidy.svg?branch=master)](https://travis-ci.org/Raku/Raku-Tidy)

NAME
====

Raku::Tidy - Tidy Raku source code according to your guidelines

SYNOPSIS
========

    bin/raku-tidy

    Indents code to match simple tab style (mine in this case).

    Choices of tab style include:
        'tab' (aka 1-true-brace-style or k-n-r)
        'Allman'
        'GNU'
        'Whitesmiths'
        'Horstmann'
        'Pico'
        'Ratliff'
        'Lisp'

    # This *will* execute phasers such as BEGIN in your existing code.
    # This may constitute a security hole, at least until the author figures
    # out how to truly make the Raku grammar standalone.

DESCRIPTION
===========

Uses [Raku::Parser](Raku::Parser) to parse your source into a Raku data structure, then walks the data structure and prints it according to your format guidelines.

Indentation
===========

Just as a reminder, here are quasi-formal names for common indentation styles.

'tab' - "One True Brace Style", "K&R":

```
while (x == y) {
    something();
    somethingelse();
}
```

Allman:

```
while (x == y)
{
    something();
    somethingelse();
}
```

GNU:

```
while (x == y)
{
    something();
    somethingelse();
}
```

Whitesmiths:

```
while (x == y)
  {
    something();
    somethingelse();
  }
```

Horstmann

```
while (x == y)
{   something();
    somethingelse();
}
```

Pico

```
while (x == y)
{   something();
    somethingelse(); }
```

Ratliff

```
while (x == y) {
    something();
    somethingelse();
    }
```

Lisp

```
while (x == y) {
    something();
    somethingelse(); }
```

Installation
============

* Using zef (a module management tool bundled with Rakudo Star):

```
    zef update && zef install Raku::Tidy
```

## Testing

To run tests:

```
    prove -e 'raku -Ilib'
```

## Author

Jeffrey Goff, DrForr on #raku, https://github.com/drforr/

## License

Artistic License 2.0
