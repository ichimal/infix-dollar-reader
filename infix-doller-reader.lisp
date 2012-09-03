(cl:eval-when (:load-toplevel :compile-toplevel :execute)
  (cl:in-package #:infix-doller-reader-asd) )

(defpackage :infix-doller-reader
  (:nicknames :idoller)
  (:shadow #:infix-doller-reader)
  (:use :cl) )

(eval-when (:load-toplevel :compile-toplevel :execute)
  (in-package :infix-doller-reader) )

(defun infix-doller-reader (stream char)
  (declare (ignore char))
  (let* ((lp-reader (get-macro-character #\())
         (entity (funcall lp-reader stream #\()) )
    (unread-char #\) stream)
    entity ))

(set-macro-character #\$ #'infix-doller-reader)

