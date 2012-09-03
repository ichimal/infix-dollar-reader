(in-package :cl-user)

(defpackage #:infix-doller-reader-asd
  (:use :cl :asdf) )

(in-package #:infix-doller-reader-asd)

(defsystem infix-doller-reader
  :name "infix-doller-reader"
  :version "0.1.0"
  :maintainer "SUZUKI Shingo"
  :author "SUZUKI Shingo"
  :licence "MIT"
  :description "Infix $ operator for reducing redundant parenthesis"
  :serial nil
  :components
    ((:file "infix-doller-reader")) )

