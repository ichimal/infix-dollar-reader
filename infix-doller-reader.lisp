(cl:eval-when (:load-toplevel :compile-toplevel :execute)
  (cl:in-package #:infix-doller-reader-asd) )

(defpackage :infix-doller-reader
  (:nicknames :infix-doller :idoller)
  (:shadow #:infix-doller-reader #:*original-readtable*)
  (:use :cl)
  (:export #:use-infix-doller #:unuse-infix-doller) )

(eval-when (:load-toplevel :compile-toplevel :execute)
  (in-package :infix-doller-reader) )

(defvar *original-readtable* nil
  "Saving original readtable" )

(defun infix-doller-reader (stream char)
  (declare (ignore char))
  (let* ((lp-reader (get-macro-character #\())
         (entity (funcall lp-reader stream #\()) )
    (unread-char #\) stream)
    entity ))

(defun use-infix-doller (&optional print-note)
  (declare (ignorable print-note))
  "Enable infix $ operator.
CAUTION: enable-infix-doller could modify *readtable* globally."
  (push *readtable* *original-readtable*)
  (setf *readtable* (copy-readtable) )
  (set-macro-character #\$ #'infix-doller-reader)
  (when print-note
    (format t "~&NOTE: set #\\$ as macro character globally.~%") ))

(defun unuse-infix-doller (&optional print-note)
  "Restore whole *readtable*.
CAUTION: unuse-infix-doller could rollback all of the changes on *readtable*
after invoking enable-infix-doller."
  (unless (readtablep (car *original-readtable*))
    (error "No readtable modified") )
  (setf *readtable* (pop *original-readtable*))
  (when print-note
    (format t "~&NOTE: restored *readtable* globally.~%") ))


