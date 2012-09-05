(in-package :cl-user)

(defpackage #:infix-doller-reader-asd
  (:use :cl :asdf) )

(in-package #:infix-doller-reader-asd)

(defsystem infix-doller-reader-test
  :depends-on (:infix-doller-reader :cl-syntax-infix-doller :rt)
  :components ((:file "infix-doller-reader-test")) )

(defmethod perform ((op test-op)
                    (component (eql (find-system :infix-doller-reader-test))) )
  (declare (ignore op component))
  (funcall (intern "DO-TESTS" :rt)) )

