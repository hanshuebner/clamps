;;;; clog-dsp-widgets.lisp
;;;
;;; **********************************************************************
;;; Copyright (c) 2024 Orm Finnendahl
;;; <orm.finnendahl@selma.hfmdk-frankfurt.de>
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

(in-package #:clog-dsp-widgets)

;;; clog extension to integrate reactive with clog.
;;;
;;; A binding establishes a relation between a ref object <refvar> and
;;; an attribute name <attr> using #'bind-ref-to-attr. This function
;;; creates the binding and calls the watch function, which creates a
;;; ref object containing the refvar in its update fn. Adding a clog
;;; element to the b-elist of the binding will result in an update of
;;; the attribue whenever the state of the <refvar> object changes.
;;;
;;; Note: There is no handle to the update function created by watch,
;;; but the watch function returns an unwatch function which removes
;;; the ref object created in #'bind-ref-to-attr and all its
;;; dependencies. This function is stored in the unwatch slot of the
;;; binding to facilitate unbinding.

(defvar *bindings* (make-hash-table :test 'equal))

(defun clear-bindings ()
  (maphash (lambda (name binding) ;;; remove watch functions
             (declare (ignore name))
             (funcall (b-unwatch binding)))
           *bindings*)
  (setf *bindings* (make-hash-table :test 'equal)))

(defclass binding ()
  ((ref :initarg :ref :accessor b-ref)
   (attr :initarg :attr :accessor b-attr)
   (elist :initarg :elist :initform '() :accessor b-elist)
   (map :initarg :map :accessor b-map)
   (unwatch :initarg :unwatch :initform '() :accessor b-unwatch)))

(defun binding-name (refvar attr)
  (concatenate 'string (ref-id refvar) "-" attr))

(defun make-binding (&rest args)
  (apply #'make-instance 'binding args))

;;; (trigger x-bang)
(defgeneric define-watch (refvar attr new)
  (:method ((refvar ref-object) attr new)
    (watch ;;; watch registers an on-update function
     (lambda ()
       (let ((val (get-val refvar)))
         (if *debug* (format t "~&~%elist: ~a~%" (b-elist new)))
         (if *debug* (format t "~&~%seen: ~a~%" (obj-print *refs-seen*)))
         (dolist (obj (b-elist new)) ;;; iterate through all bound html elems
           (unless (member (list obj attr) *refs-seen* :test #'equal)
             (if *debug* (format t "~&~%watch update: ~a~%-> ~a ~a~%" (obj-print *refs-seen*) obj val))
             (push (list obj attr) *refs-seen*)
             (setf (attribute obj attr) val)))))))
  (:method ((refvar bang-object) attr new)
    (watch ;;; watch registers an on-update function
     (lambda ()
       (let ((val (get-val refvar))) ;; we read val only to register
                                      ;; the watch function in the
                                      ;; listeners of the bang
       (declare (ignore val))
       (if *debug* (format t "~&~%elist: ~a~%" (b-elist new)))
       (if *debug* (format t "~&~%seen: ~a~%" (obj-print *refs-seen*)))
       (dolist (obj (b-elist new)) ;;; iterate through all bound html elems
         (unless (member (list obj attr) *refs-seen* :test #'equal)
           (if *debug* (format t "~&~%watch update: ~a~%-> ~a~%" (obj-print *refs-seen*) obj))
           (push obj *refs-seen*)
           (js-execute obj (format nil "~A.bang()" (script-id obj)))
           )))))))

(defgeneric bind-ref-to-attr (refvar attr &optional map)
  (:method ((refvar ref-object-super) attr &optional (map (lambda (val) val)))
    (let ((name (binding-name refvar attr)))
      (or (gethash name *bindings*) ;;; or returns the first non-nil argument and skips evaluating the rest of its args.
          (let ((new (make-binding :ref refvar :attr attr :map map)))
            (setf (b-unwatch new) (define-watch refvar attr new))
            (setf (gethash name *bindings*) new)))))
  (:method ((refvar-array simple-array) attr &optional (map (lambda (val) val)))
    (let ((binding-array (make-array (length refvar-array))))
      (loop for refvar across refvar-array
            for idx from 0
            do (setf (aref binding-array idx)
                     (let ((name (binding-name refvar attr)))
                       (or (gethash name *bindings*) ;;; or returns the first non-nil argument and skips evaluating the rest of its args.
                           (let ((new (make-binding :ref refvar :attr attr :map map)))
                             (setf (b-unwatch new) (define-watch refvar attr new))
                             (setf (gethash name *bindings*) new)))))
            finally (return binding-array))))
  (:documentation "bind a ref (or an array of refs) to an attr of a html element. This
will establish a watch function, which will automatically set the attr
of all registered html elements on state change of the
refvar. Registering html elements is done by pushing the html element
to the b-elist slot of the binding (normally done in the creation
function of the html element). The method returns the binding or an
array of bindings, depending on the class."))

 ;;; (setf (gethash...) ) returns the value which got set (new in this case).

(defun obj-print (seq)
  (format nil "(~{~a~^ ~})"
          (mapcar (lambda (x)
                    (cond
                      ((functionp x) (format nil "<function {~a}>" (sb-kernel:get-lisp-obj-address x)))
                      (:else (format nil "~a" x))))
                  seq)))

(defmacro b-unregister (element binding)
  `(setf (b-elist ,binding) (remove ,element (b-elist ,binding))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;                       clog part                                          ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; little clog extension to allow simple data transport js -> lisp

(defparameter *data-event-script*
  "+ JSON.stringify(data)")

(defun parse-data-event (data)
  (yason:parse data))

(defmethod set-on-data ((obj clog-obj) handler)
   (clog::set-event
    obj "data"
    (when handler
      (lambda (data)
        (unless (string= data "undefined")
          (funcall handler obj (parse-data-event data)))))
    :call-back-script *data-event-script*))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; creation functions for gui widgets
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; o-knob is a custom html element defined in js:

(defun create-o-knob (parent binding min max step &key (unit "") (precision 2))
  (let ((var (b-ref binding))
        (attr (b-attr binding))
        (element (create-child
                  parent
                  (format nil "<o-knob min=\"~a\" max=\"~a\" step=\"~a\" value=\"~a\" precision=\"~a\" unit=\"~a\"></o-knob>"
                          min max step (get-val (b-ref binding)) precision unit)))) ;;; the get-val automagically registers the ref
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data element ;;; react to changes in the browser page
                 (lambda (obj data)
		   (declare (ignore obj))
                   (let ((*refs-seen* (list element)))
                     (if *debug* (format t "~&~%clog event from ~a: ~a~%" element
                                         (or (if (gethash "close" data) "close")
                                             (gethash attr data))))
                     (if (gethash "close" data)
                         (progn
;;;                           (format t "closing knob~%")
                           (setf (b-elist binding) (remove element (b-elist binding)))) ;;; cleanup: unregister elem.
                         (progn
                           (format t "~&knob recv value: ~a, ~a~%" (float (gethash attr data) 1.0) *refs-seen*)
                           (%set-val var (float (gethash attr data) 1.0)))
                         ))))
    element))

(defun create-o-numbox (parent binding min max &key (precision 2) css)
  (let* ((var (b-ref binding))
         (attr (b-attr binding))
         (element (create-child
                   parent
                   (format nil "<o-numbox min=\"~a\" max=\"~a\" value=\"~a\" precision=\"~a\" ~@[~a~]>"
                           min max (get-val (b-ref binding)) precision
                           (format-style css))))
         ) ;;; the get-val automagically registers the ref
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data ;;; react to changes in the browser page
     element
     (lambda (obj data)
       (declare (ignore obj))
       (if *debug* (format t "~&~%clog event from ~a: ~a~%" element
                           (or (if (gethash "close" data) "close")
                               (gethash attr data))))
       (if (gethash "close" data)
           (progn
;;;             (format t "closing numbox~%")
             (setf (b-elist binding) (remove element (b-elist binding)))) ;;; cleanup: unregister elem.
           (let ((*refs-seen* (list (list element attr))))
;;;             (format t "~&numbox recv value: ~a, ~a~%" (float (gethash attr data) 1.0) *refs-seen*)
             (%set-val var (float (gethash attr data) 1.0))
             ))))
    element))

;;; (setf *refs-seen* nil)

(defmacro option-main (option)
  `(if (listp ,option)
       (first ,option)
       ,option))

(defmacro option-second (option)
  `(if (listp ,option)
       (or (second ,option) (first ,option))
       ,option))

(defun opt-format-attr (attr val)
  (when val (format nil "~a='~(~a~)'" attr val)))

(defun create-o-bang (parent binding &key label (background '("transparent" "orange")) color flash-time css flash)
  (let ((var (b-ref binding))
        (attr (b-attr binding))
        (element (create-child
                  parent
                  (format nil "<o-bang ~{~@[~a ~]~}~@[~a~]>~@[~a~]</o-bang>"
                          (list
                           (opt-format-attr "label-off" (option-main label))
                           (opt-format-attr "label-on" (option-second label))
                           (opt-format-attr "background-off" (option-main background))
                           (opt-format-attr "background-on" (option-second background))
                           (opt-format-attr "color-off" (option-main color))
                           (opt-format-attr "color-on" (option-second color))
                           (opt-format-attr "flash-time" flash-time)
                           (opt-format-attr "flash" flash))
                          (if css (format-style css))
                          (or (option-main label) "")))))
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data element ;;; react to changes in the browser page
                 (lambda (obj data)
                   ;; (incudine.util:msg :info "~&~%clog event from ~a: ~a~%" element
                   ;;                    (or (if (gethash "close" data) "close")
                   ;;                        (gethash attr data)))
                   (cond ((gethash "close" data)
                          (progn
;;;                              (format t "closing bang~%")
                            (setf (b-elist binding) (remove element (b-elist binding))))) ;;; cleanup: unregister elem.
                         (t (let ((*refs-seen* (list (list obj "bang"))))
                              ;; (incudine.util:msg :info "~&triggering: ~a~%" var
                              ;;                    (or (if (gethash "close" data) "close")
                              ;;                        (gethash attr data)))
                              
                              (%trigger var))))))
    element))

(defun array->attr (arr)
  (format nil "[~{~a~^, ~}]" (coerce arr 'list)))

(defun create-o-toggle (parent binding &key label (background '("transparent" "orange")) color flash-time values css)
  (let* ((var (b-ref binding))
         (attr (b-attr binding))
         (element (create-child
                   parent
                   (format nil "<o-toggle ~{~@[~a ~]~}~@[~a~]>~@[~a~]</o-toggle>"
                           (list
                            (opt-format-attr "value" (get-val var))
                            (opt-format-attr "label-off" (option-main label))
                            (opt-format-attr "label-on" (option-second label))
                            (opt-format-attr "background-off" (option-main background))
                            (opt-format-attr "background-on" (option-second background))
                            (opt-format-attr "color-off" (option-main color))
                            (opt-format-attr "color-on" (option-second color))
                            (opt-format-attr "flash-time" flash-time)
                            (opt-format-attr "value-off" (or (first values) 0))
                            (opt-format-attr "value-on" (or (second values) 1)))
                           (format-style css)
                           (or (option-main label) "")))))
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data element ;;; react to changes in the browser page
                 (lambda (obj data)
                   (declare (ignore obj))
                   (let ((*refs-seen* (list (list element attr))))
                     (if *debug* (format t "~&~%clog event from ~a: ~a~%" element
                                         (or (if (gethash "close" data) "close")
                                             (gethash attr data))))
                     (cond ((gethash "close" data)
                            (progn
;;;                              (format t "closing toggle~%")
                              (setf (b-elist binding) (remove element (b-elist binding)))))
                           (t (%set-val var (read-from-string (gethash attr data))))
                           ))))
    element))

(defun create-o-radio (parent binding &key labels label (background '("transparent" "orange"))
                                        color flash-time values (num 8) (direction :right))
  (declare (type (member :up :right :down :left) direction))
  (let* ((var (b-ref binding))
         (attr (b-attr binding)) ;;; format nil "~{~a~^,~}"
         (element (create-child
                   parent
                   (format nil "<o-radio ~{~@[~a ~]~}>~@[~a~]</o-radio>"
                           (list
                            (opt-format-attr "value" (round (get-val var)))
                            (opt-format-attr "label-off" (if (option-main labels) (format nil "~{~a~^,~}" (option-main labels))))
                            (opt-format-attr "label-on" (if (option-second labels) (format nil "~{~a~^,~}" (option-second labels))))
                            (opt-format-attr "background-off" (if (option-main background) (format nil "~{~a~^,~}" (option-main background))))
                            (opt-format-attr "background-on" (if (option-second background) (format nil "~{~a~^,~}" (option-second background))))
                            (opt-format-attr "color-off" (if (option-main color) (format nil "~{~a~^,~}" (option-main color))))
                            (opt-format-attr "color-on" (if (option-second color) (format nil "~{~a~^,~}" (option-second color))))
                            (opt-format-attr "flash-time" flash-time)
                            (opt-format-attr "value-off" (or (first values) 0))
                            (opt-format-attr "value-on" (or (second values) 1))
                            (opt-format-attr "data-num" (or num 8))
                            (opt-format-attr "direction" direction))
                           (or (option-main label) "")))))
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data element ;;; react to changes in the browser page
                 (lambda (obj data)
                   (declare (ignore obj))
                   (let ((*refs-seen* (list (list element attr))))
                     (if *debug* (format t "~&~%clog event from ~a: ~a~%" element
                                         (or (if (gethash "close" data) "close")
                                             (gethash attr data))))
                     (cond ((gethash "close" data)
                            (progn
;;;                              (format t "closing radio~%")
                              (setf (b-elist binding) (remove element (b-elist binding)))))
                           (t (%set-val var (gethash attr data)))))))
    element))

(defun format-style (css)
  (format nil "style=\"~@[~{~(~A~): ~(~a~);~}~]\"" css))

(defun create-o-slider (parent binding &key (direction :up) (min 0) (max 1)
                                         label background thumb-color bar-color
                                         (mapping :lin) (clip-zero nil)
                                         (width "1em") (height "8em") padding css)
  (declare (type (member :lin :log) mapping)
           (type (member :up :right :down :left) direction))
  (let* ((var (b-ref binding))
         (attr (b-attr binding)) ;;; format nil "~{~a~^,~}"
         (element (create-child
                   parent
                   (format nil "<o-slider ~{~@[~a ~]~}>~@[~a~]</o-slider>"
                           (list
                            (format-style (append `(:width ,width :height ,height :padding ,padding) css))
                            (opt-format-attr "direction" direction)
                            (opt-format-attr "value" (float (get-val var) 1.0))
                            (opt-format-attr "min" min)
                            (opt-format-attr "max" max)
                            (opt-format-attr "label" label)
                            (opt-format-attr "background" (or background "white"))
                            (opt-format-attr "thumb-color" (or thumb-color "black"))
                            (opt-format-attr "bar-color" (or bar-color "transparent") )
                            (opt-format-attr "mapping" mapping )
                            (opt-format-attr "clip-zero" clip-zero ))
                           (or (option-main label) "")))))
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data element ;;; react to changes in the browser page
                 (lambda (obj data)
                   (declare (ignore obj))
                   (let ((*refs-seen* (list (list element attr)))) ;;; set context for %set-val below
                     (if *debug* (format t "~&~%clog event from ~a: ~a~%" element
                                         (or (if (gethash "close" data) "close")
                                             (gethash attr data))))
                     (cond ((gethash "close" data)
                            (progn
;;;                              (format t "closing slider~%")
                              (setf (b-elist binding) (remove element (b-elist binding)))))
                           (t (%set-val var (gethash attr data)))))))
    element))

;;; min, max, mapping, clip-zero, thumb-color, bar-color

(defun create-o-multislider (parent binding-array
                             &key (direction :up) (value 0) (min 0) (max 1)
                               label background colors (thumb-color "transparent")
                               (mapping :lin) (clip-zero nil))
  (declare (type (member :lin :log) mapping)
           (type (member :up :right :down :left) direction))
  (let* ((num-sliders (length binding-array))
         (element (create-child
                      parent
                      (format nil "<o-multislider ~{~@[~a ~]~}>~@[~a~]</o-multislider>"
                              (list
                               (opt-format-attr "num-sliders" num-sliders)
                               (opt-format-attr "direction" direction)
                               (opt-format-attr "value" value)
                               (opt-format-attr "min" min)
                               (opt-format-attr "max" max)
                               (opt-format-attr "label" label)
                               (opt-format-attr "background" (or background "white"))
                               (opt-format-attr "colors" (if colors (format nil "~{~a~^,~}" colors)))
                               (opt-format-attr "mapping" mapping )
                               (opt-format-attr "clip-zero" clip-zero ))
                              (or (option-main label) "")))))
    (loop for binding across binding-array
          collect (create-o-slider element binding
                                   :thumb-color (or thumb-color "transparent")
                                   :direction direction))
    (execute element (format nil "initSliders(~a)" num-sliders) )
    element))

(defun create-o-vumeter (parent binding &key (direction :up)
                                (type :led) (mapping :db-lin)
                                          (width "1em") (height "8em") padding css)
  (declare (type (member :up :right :down :left) direction)
           (type (member :led :bar) type)
           (type (member :pd :db-lin) mapping))
  (let* ((var (b-ref binding))
         (attr (b-attr binding)) ;;; format nil "~{~a~^,~}"
         (element (create-child
                   parent
                   (format nil "<o-vumeter ~{~@[~a ~]~}></o-slider>"
                           (list
                            (format-style (append `(:width ,width :height ,height :padding ,padding) css))
                            (opt-format-attr "led-mapping" mapping)
                            (opt-format-attr "direction" direction)
                            (opt-format-attr "db-value" (float (get-val var) 1.0))

                            (opt-format-attr "type" type))))))
    (push element (b-elist binding)) ;;; register the browser page's html elem for value updates.
    (set-on-data element ;;; react to changes in the browser page
                 (lambda (obj data)
                   (declare (ignore obj))
                   (let ((*refs-seen* (list (list element attr)))) ;;; set context for %set-val below
                     (if *debug* (format t "~&~%clog event from ~a: ~a~%" element
                                         (or (if (gethash "close" data) "close")
                                             (gethash attr data))))
                     (cond ((gethash "close" data)
                            (progn
;;;                              (format t "closing vumeter~%")
                              (setf (b-elist binding) (remove element (b-elist binding)))))))))
    element))

(defun create-o-svg (parent svg &key padding css (translate 0) (background "#fff"))
  (let* ((svg-container (create-div parent :style "display:flex;align-items: stretch;position: relative"))
         (svg (create-child
               svg-container
               (format nil "<object ~{~@[~a ~]~}></object>"
                       (list
                        (format-style (append
                                       `(:padding ,padding
                                         :transform ,(format nil "translate(~apx)" translate)
                                         :background ,background)
                                       css))
                        (opt-format-attr "class" "svg")
                        (opt-format-attr "data" svg)
                        (opt-format-attr "cursor-pos" 0.0)
                        "type=\"image/svg+xml\"")))))
    (create-div svg-container :class "cursor")
    svg))

(defun create-o-svg (parent svg &key padding css (background "#fff"))
  (let* ((element (create-child
                   parent
                   (format nil "<o-svg ~{~@[~a ~]~}></object>"
                           (list
                            (opt-format-attr "data" svg)
                            (opt-format-attr "cursor-pos" 0.0)
                            (format-style (append
                                           `(:padding ,padding
                                             :background ,background)
                                           css)))))))
    element))





(defun create-hide-button (parent element-to-hide
                           &key label (background '("transparent" "orange"))
                             color flash-time values css (val 1) auto-place)
  (let* ((button (create-child
                   parent
                   (format nil "<o-toggle ~{~@[~a ~]~}~@[~a~]>~@[~a~]</o-toggle>"
                           (list
                            (opt-format-attr "value" val)
                            (opt-format-attr "label-off" (option-main label))
                            (opt-format-attr "label-on" (option-second label))
                            (opt-format-attr "background-off" (option-main background))
                            (opt-format-attr "background-on" (option-second background))
                            (opt-format-attr "color-off" (option-main color))
                            (opt-format-attr "color-on" (option-second color))
                            (opt-format-attr "flash-time" flash-time)
                            (opt-format-attr "value-off" (or (first values) 0))
                            (opt-format-attr "value-on" (or (second values) 1)))
                           (format-style css)
                           (or (option-main label) ""))
                   :auto-place auto-place)))
    (set-on-data button ;;; react to changes in the browser page
                 (lambda (obj data)
                   (declare (ignore obj))
                   (let ((*refs-seen* (list button)))
                     (if *debug* (format t "~&~%clog event from ~a: ~a~%" button
                                         (or (if (gethash "close" data) "close")
                                             (gethash "value" data))))
                     (cond ((gethash "close" data)
                            (progn
;;;                              (format t "closing hide button~%")
                              ))
                           (t (setf (hiddenp element-to-hide)
                                    (zerop (read-from-string
                                            (gethash "value" data)))))))))
    button))






;; array as attribute: <div id="demo" data-stuff='["some", "string", "here"]'></div>
;;
;; <div id="storageElement" data-storeIt="stuff,more stuff"></div> and use string.split.
;;
;; this is just how I would structure such a dynamic website. With a
;; 12 column layout with collection of input elements

(defun create-collection (parent width)
  (create-child parent (format nil "<div data-width='~a' class='collection'></div>" width)))

(defun create-grid (parent class width)
  (create-child parent (format nil "<div data-width='~a' class='~a'></div>" width class)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; utils from clog-dsp-widgets (will be replaced soon)
;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defgeneric flash (clog-obj)
  (:method ((obj clog-obj))
    (execute obj "bang()"))
  (:documentation "call the bang() function of clog-obj without triggering the bang
event."))

(defgeneric pulse-on (clog-obj &optional freq)
  (:method ((obj clog-obj) &optional (freq 2))
    (execute obj (format nil "pulseOn(~A)" (round (/ 1000 freq 2.0)))))
  (:documentation "call the pulseOn() function of clog-obj."))

(defgeneric pulse-off (clog-obj)
  (:method ((obj clog-obj))
    (execute obj "pulseOff()"))
  (:documentation "call the pulseOff() function of clog-obj."))

(defgeneric highlight (clog-element value)
  (:documentation "Highlight element (0 unhighlights, all other values highlight)."))

(defmethod highlight ((obj clog-element) value)
  (execute obj (format nil "highlight(~A)" value))  
  value)


;;; We don't want to restart the server everytime when the new-window
;;; fun is canged thats why this proxy gets defined
(defun on-new-window (body)
  (new-window body))

;; Initialize the CLOG system with a boot file which contains the
;; static js files. For customized uses copy the "www" subdirectory of
;; the repository to your local project and adjust :static-root
;; accordingly

(defun new-window (body)
  "On-new-window handler."
  (setf (title (html-document body)) "Clog Test")
  (add-class body "w3-blue-grey"))

(defun start (&key (port 8080))
  (clear-bindings) ;;; start from scratch
  (initialize #'on-new-window
              :port port
              :static-root (merge-pathnames "www/" (asdf:system-source-directory :clog-dsp-widgets))
              :boot-file "/start.html")
  ;; Open a browser to http://127.0.0.1:8080 - the default for CLOG apps
  (open-browser))

;;; (start) should start a webserver
