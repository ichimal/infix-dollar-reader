(cl:in-package #:infix-doller-reader-asd)

(defpackage :infix-doller-reader-test
  (:use :cl :infix-doller-reader :rt) )

(in-package :infix-doller-reader-test)

;; enable infix-$ here to compile this test suite
(eval-when (:compile-toplevel) (use-infix-doller t))

(deftest enable-notaion.1
  (use-infix-doller t)
  nil )

(deftest enable-notaion.2
  (use-infix-doller)
  nil )

(deftest number-of-saved-readtable.1
  (length idoller::*original-readtable*)
  2 )

(deftest single-use.1
    (+ 1 2 $ * 3 4)
  #.(+ 1 2  (* 3 4)) )

(deftest single-use.2
  (let ((r (random 1d10)))
    (= (* 2 pi $ expt r 2)
       (* 2 pi  (expt r 2)) ))
  t )

(deftest nested-use.1
    (+ 1 2 $ * 3 4 $ + 5 6)
  #.(+ 1 2  (* 3 4  (+ 5 6))) )

(deftest disable-notation.1
  (unuse-infix-doller)
  nil )

(deftest disable-notation.2
  (unuse-infix-doller t)
  nil )

;;; disable infix-$ notation.
;;; DO NOT OMMIT THIS because of failure of NUMBER-OF-SAVED-READTABLE.1
(eval-when (:compile-toplevel) (unuse-infix-doller t))

