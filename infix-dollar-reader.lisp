(cl:in-package #:infix-dollar-reader-asd)

(defpackage :infix-dollar-reader
  (:nicknames :infix-dollar :idollar)
  (:shadow #:infix-dollar-reader #:*original-readtable*)
  (:use :cl)
  (:import-from :syntax #:find-syntax #:define-package-syntax)
  (:export #:use-infix-dollar #:unuse-infix-dollar) )

(in-package :infix-dollar-reader)

(defvar *original-readtable* nil
  "Saving original readtable" )

(defun infix-dollar-reader (stream char)
  (declare (ignore char))
  (let* ((lp-reader (get-macro-character #\())
         (entity (funcall lp-reader stream #\()) )
    (unread-char #\) stream)
    entity ))

(unless (find-syntax :infix-dollar)
  (define-package-syntax :infix-dollar
    (:merge :standard)
    (:macro-char #\$ #'infix-dollar-reader::infix-dollar-reader) ))

;;; Yet another enabler/disabler TO MODIFY global *READTABLE*.
;;; For normal use, use (syntax:use-syntax :infix-dollar) instead of these
;;; I/Fs below.
(defun use-infix-dollar (&optional print-note)
  (declare (ignorable print-note))
  "Enable infix $ operator.
CAUTION: enable-infix-dollar could modify *readtable* globally."
  (push *readtable* *original-readtable*)
  (setf *readtable* (copy-readtable) )
  (set-macro-character #\$ #'infix-dollar-reader)
  (when print-note
    (format t "~&NOTE: set #\\$ as macro character globally.~%") ))

(defun unuse-infix-dollar (&optional print-note)
  "Restore whole *readtable*.
CAUTION: unuse-infix-dollar could rollback all of the changes on *readtable*
after invoking enable-infix-dollar."
  (unless (readtablep (car *original-readtable*))
    (error "No readtable modified") )
  (setf *readtable* (pop *original-readtable*))
  (when print-note
    (format t "~&NOTE: restored *readtable* globally.~%") ))


