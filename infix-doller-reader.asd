(in-package :cl-user)

(defpackage #:infix-dollar-reader-asd
  (:use :cl :asdf) )

(in-package #:infix-dollar-reader-asd)

(defsystem infix-dollar-reader
  :name "infix-dollar-reader"
  :version "0.3.0"
  :maintainer "SUZUKI Shingo"
  :author "SUZUKI Shingo"
  :licence "MIT"
  :description "Infix $ operator for reducing redundant parenthesis"
  :serial nil
  :depends-on (:cl-syntax)
  :components
    ((:file "infix-dollar-reader")) )

(defmethod perform ((op test-op)
                    (component (eql (find-system :infix-dollar-reader))) )
  (declare (ignore op component))
  (operate 'load-op :infix-dollar-reader-test)
  (operate 'test-op :infix-dollar-reader-test :force t) )

