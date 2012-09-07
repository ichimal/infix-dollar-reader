(cl:in-package :cl-user)

(defpackage #:infix-dollar-reader-asd
  (:use :cl :asdf) )

(in-package #:infix-dollar-reader-asd)

(defsystem infix-dollar-reader-test
  :depends-on (:infix-dollar-reader :rt)
  :components ((:file "infix-dollar-reader-test")) )

(defmethod perform ((op test-op)
                    (component (eql (find-system :infix-dollar-reader-test))) )
  (declare (ignore op component))
  (funcall (intern "DO-TESTS" :rt)) )

