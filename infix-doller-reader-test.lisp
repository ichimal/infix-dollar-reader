(cl:in-package #:infix-doller-reader-asd)

(defpackage :infix-doller-reader-test
  (:use :cl :infix-doller-reader :cl-syntax :rt) )

(in-package :infix-doller-reader-test)

;; enable infix-$ here to compile this test suite itself
(syntax:use-syntax :infix-doller)

(deftest enable-notaion.1
  (syntax:use-syntax :infix-doller)
  nil )

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

