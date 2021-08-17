;;; 
;;; incudine-bufs.lisp
;;;
;;; simple buffer registry to avoid duplicate loading of buffers.
;;;
;;; **********************************************************************
;;; Copyright (c) 2021 Orm Finnendahl <orm.finnendahl@selma.hfmdk-frankfurt.de>
;;;
;;; Revision history: See git repository.
;;;
;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the Gnu Public License, version 2 or
;;; later. See https://www.gnu.org/licenses/gpl-2.0.html for the text
;;; of this agreement.
;;; 
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;;; GNU General Public License for more details.
;;;
;;; **********************************************************************

(in-package :incudine)

(defparameter *buffers* (make-hash-table))
(defparameter *buffer-ids* (make-hash-table :test #'equal))
(defparameter *buffer-max-id* -1)
(defparameter *buffer-next-id* '())



(defun buffer-id (buffer)
  "get index of buffer from registry."
  (gethash buffer *buffer-ids*))

(defun get-buffer (id)
  "get buffer from registry by index."
  (gethash id *buffers*))

(defun canonicalize-name (name)
  "remove leading directories from name"
  (let ((path (pathname name)))
    (format nil "~a.~a" (pathname-name path) (pathname-type path))))

(defun get-buffer-file (buffer)
  (canonicalize-name (buffer-file buffer)))

(defun find-buffer (name)
  "find all buffers with a name being a full pathname or the
pathname-name of <name>."
  (or (gethash name *buffers*)
      (let ((sfname (canonicalize-name name)))
        (loop for entry being the hash-key of *buffer-ids*
;;;              do (format t "~a, ~a~%" entry (if (typep entry 'incudine:buffer) (list (canonicalize-name (buffer-file entry)) sfname)))
              if (and (typep entry 'buffer) (string= (canonicalize-name (buffer-file entry)) sfname))
                collect entry into result
              finally (return (if (= (length result) 1) (first result) result))))))

;;; (loop for i below 10 if (evenp i) collect i into result finally (return result))

(defun add-buffer (buf)
  "add buffer to registry."
  (unless (gethash buf *buffer-ids*)
    (setf (gethash (or (pop *buffer-next-id*) (incf *buffer-max-id*)) *buffers*) buf)
    (setf (gethash buf *buffer-ids*) *buffer-max-id*)
    (setf (gethash (buffer-file buf) *buffers*) buf)
    buf))

(defun remove-buffer (buf)
  "remove buffer from registry."
  (let ((id (buffer-id buf)))
    (unless (and
             id
             (remhash buf *buffer-ids*)
             (remhash (buffer-file buf) *buffers*)
             (if (remhash id *buffers*)
                 (push id *buffer-next-id*)))
      (warn "Can't remove buffer ~a: buf or id not found in databases!" buf))))

(defun bufname= (buf file)
  "compare file with the filename of buf. If buf is a list, compare
file to the filenames of all elements of list and return buf if any is
matching."
  (cond
    ((null buf) nil)
    ((consp buf) (or (bufname= (first buf) file) (bufname= (rest buf) file)))
    (t (and (string= (format nil "~a" (buffer-file buf)) (format nil "~a" file)) buf))))


(defun of-buffer-load (file)
  "load and register buffer from file if not loaded already. Return
buffer."
  (let ((buf (find-buffer file)))
    (or (bufname= buf file)
        (add-buffer (buffer-load file)))))

(export '(of-buffer-load buffer-id get-buffer find-buffer add-buffer remove-buffer) 'incudine)
