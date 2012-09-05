(in-package :cl-user)

(defpackage #:infix-doller-reader-asd
  (:use :cl :asdf) )

(in-package #:infix-doller-reader-asd)

(defsystem infix-doller-reader
  :name "infix-doller-reader"
  :version "0.3.0"
  :maintainer "SUZUKI Shingo"
  :author "SUZUKI Shingo"
  :licence "MIT"
  :description "Infix $ operator for reducing redundant parenthesis"
  :serial nil
  :depends-on (:cl-syntax)
  :components
    ((:file "infix-doller-reader")) )

(defmethod perform ((op test-op)
                    (component (eql (find-system :infix-doller-reader))) )
  (declare (ignore op component))
  (operate 'load-op :infix-doller-reader-test)
  (operate 'test-op :infix-doller-reader-test :force t) )

