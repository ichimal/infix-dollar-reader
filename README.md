infix-doller-reader
===================

Infix $ operator for reducing redundant paranthesis.

### usage:

1. load package;

        (asdf:load-system :infix-doller-reader)

2. enable to use infix $ notation;

  for REPL:

        (idoller:use-infix-doller)

  for source code:

        (eval-when (:compile-toplevel)
          (idoller:use-infix-doller) )

  CAUTION: this operation replaces current \*READTABLE\* with copied one.

3. write your forms with infix $ notation s.t. (the fixnum $ + x 10)


4. rollback \*READTABLE\*;

  for REPL:

        (idoller:unuse-infix-doller)

  for source code:

        (eval-when (:compile-toplevel)
          (idoller:unuse-infix-doller) )

### example:

        (fun x y $ fun2 z)

This form above would be expanded to below form.

        (fun x y (fun2 z))

And also,

        (= (+ 1 2 $ * 3 4 $ + 5 6) (+ 1 2 (* 3 4 (+ 5 6)))) ; => T

### limitation:

A symbol name which has any $ characters would cause unexpected behavior.

You should not use any $ characters in a symbol name without barrier or intern from a string.

e.g.

        (idoller:use-infix-doller)

        (defconstant foo$- 1) ; => FOO
        ;; would be parsed as (defconstant foo(- 1))

        (defconstant |FOO$-| 1) ; => FOO$- or |FOO$-|
        ;; not be parsed a #\$ as a #\( because of barrier

        (intern "FOO$-") ; => FOO$-
        ;; #\$, $-in-a-string and $-in-a-comment are not affected

