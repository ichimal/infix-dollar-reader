infix-doller-reader
===================

Infix $ operator for reducing redundant paranthesis.

### usage:

1. load package;

        (asdf:load-system :infix-doller-reader)

2. enable to use infix $ notation;

        (idoller:use-infix-doller)

  CAUTION: this operation replaces current \*READTABLE\* with copied one.

3. write your forms with infix $ notation s.t. (the fixnum $ + x 10)


4. rollback \*READTABLE\*;

        (idoller:unuse-infix-doller)

### example:

        (fun x y $ fun2 z)

This form above would be expanded to below form.

        (fun x y (fun2 z))

And also,

        (= (+ 1 2 $ * 3 4 $ + 5 6) (+ 1 2 (* 3 4 (+ 5 6)))) ; => T

