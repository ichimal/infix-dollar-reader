(cl:in-package #:infix-dollar-reader-asd)

(defpackage :infix-dollar-reader-test
  (:use :cl :infix-dollar-reader :rt) )

(in-package :infix-dollar-reader-test)

;; enable infix-$ here to compile this test suite itself
(syntax:use-syntax :infix-dollar)

(deftest enable-notaion.1
  (syntax:use-syntax :infix-dollar)
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

