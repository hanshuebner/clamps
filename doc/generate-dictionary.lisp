;;; 
;;; generate-dictionary.lisp
;;;
;;; Code to generate clamps-dictionary.org. Inspired by and code in
;;; many parts taken from fill-dict.lisp of incudine by Tito Latini.
;;;
;;; The build process of the clamps-dictionary is done in two stages:
;;;
;;; 1. This file generates the org-mode source file
;;;    clamps-dictionary.org using all exported symbols of clamps.
;;;
;;; 2. The org-mode file gets exported to multipage-html using the
;;;    multipage-html org-export module of emacs.
;;;
;;;
;;; **********************************************************************
;;; Copyright (c) 2024 Orm Finnendahl <orm.finnendahl@selma.hfmdk-frankfurt.de>
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

(require :slynk)
(require :cffi)
(require :sb-introspect)
(ql:quickload :clamps)

(defpackage :clamps.doc
  (:use :cl)
  (:import-from #:sb-ext #:defined-type-name-p)
  (:import-from #:sb-introspect #:function-lambda-list)
  (:export #:write-clamps-version #:write-doc #:write-undocumented-symbols))

(in-package :clamps.doc)

(defparameter *clamps-packages*
  '("CLAMPS"
    "CUDA-USOCKET-OSC"
    "ATS-CUDA-DISPLAY"
    "FUDI"
    "OF-INCUDINE-DSPS"
    "INCUDINE-BUFS"
    "ORM-UTILS"
    "CL-PLOT"
    "INCUDINE-PLOT"
    "CL-REFS"
    "CL-SFZ"
    "CL-POOLPLAYER"
    "SVG-IMPORT-EXPORT"
    "CLOG-DSP-WIDGETS"
    "CL-MIDICTL"
    "CLOG-MIDI-CONTROLLER"
    ))

(defvar *forced-symbol-packages* nil)

(defun check-symbol-package (sym pkg type)
  (let ((forced (cdr (assoc sym (cdr (assoc type *forced-symbol-packages*))))))
    (or (null forced)
        (eq (find-package forced) pkg))))

(defparameter *org-mode-dict-file-header*
  "#+TITLE: Clamps Dictionary
#+AUTHOR: Orm Finnendahl
#+LANGUAGE: en
#+startup: entitiespretty
#+OPTIONS: html5-fancy:t
#+OPTIONS: num:nil
#+OPTIONS: toc:2 h:3 html-multipage-join-empty-bodies:t
#+OPTIONS: html-multipage-split:2
#+OPTIONS: html-multipage-toc-to-top:t
#+OPTIONS: html-multipage-export-directory:html/clamps-doc/clamps-dict
#+OPTIONS: html-multipage-open:nil
#+OPTIONS: html-multipage-numbered-filenames:nil
#+OPTIONS: html-preamble:\"<a class=\\\"top-menu\\\" href=\\\"../overview/index.html\\\">Overview</a>\\n<a class=\\\"top-menu\\\" href=\\\"../clamps/index.html\\\">Clamps Packages</a>\\n<a class=\\\"top-menu\\\" href=\\\"../cm-dict/index.html\\\">CM Dictionary</a>\\n<a class=\\\"top-menu top-menu-active\\\" href=\\\"./index.html\\\">Clamps Dictionary</a>\\n<a class=\\\"top-menu\\\" href=\\\"../fomus/index.html\\\">Fomus</a>\\n\"
#+OPTIONS: html-toc-title:\"Index\"
#+OPTIONS: html-multipage-include-default-style:nil
#+HTML_DOCTYPE: xhtml5
#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/clamps-dictionary.css\" />
#+HTML_HEAD: <link rel=\"stylesheet\" type=\"text/css\" href=\"./css/htmlize.css\" />
#+HTML_HEAD: <link href=\"./pagefind/pagefind-ui.css\" rel=\"stylesheet\">
#+HTML_HEAD: <script src=\"./pagefind/pagefind-ui.js\"></script>
# #+SETUPFILE: clamps-dict.setup
#+BEGIN_SRC emacs-lisp :exports results :results: none
  (load (format \"%s%s\" (file-name-directory (buffer-file-name))
                    \"../extra/elisp/clamps-lookup.el\"))
  (load (format \"%s%s\" (file-name-directory (buffer-file-name))
                    \"../extra/elisp/clamps-overview-lookup.el\"))
  (defun extract-link (string)
  (if (= (aref (string-trim string) 0) 42)
      (replace-regexp-in-string \"\\\\*​\\\\(.+\\\\)​\\\\*\" \"#\\\\1\" string)
      string))
  (defun export-dict-to-clamps (s backend info)
    (let ((filename (buffer-file-name)))
      (with-temp-buffer
        (insert
         (format \"(load \\\"%s%s\\\")\\n\" (file-name-directory filename)
                 \"../extra/elisp/cm-dict.el\"))
        (insert \"(mapcar
   (lambda (entry)
     (let ((symbol (intern (car entry)
  			 ,*common-music-symbols*)))
       (if (boundp symbol)
  	 (push (cadr entry) (symbol-value symbol))
         (set symbol (cdr entry)))))
   '(\\n\")
        (mapcar
         (lambda (entry)
           (insert
            (format \"   (\\\"%s\\\" \\\"clamps-dict/%s\\\")\\n\"
                    (extract-link (org-html-element-title (car entry)))
                    (plist-get (cdr entry) :href))))
         (cl-remove-if
          (lambda (x) (= 1 (plist-get (cdr x) :relative-level)))
          (plist-get info :multipage-toc-lookup)))
        (insert \"))\\n\")
        (write-region (point-min) (point-max) \"../extra/elisp/clamps-dict.el\"))
      (load (format \"%s%s\" (file-name-directory (buffer-file-name))
                    \"../extra/elisp/clamps-dict.el\"))
      s))
  (setq gc-cons-threshold 102400000)
  (setq max-lisp-eval-depth 10000)
#+END_SRC
#+BIND: org-export-filter-multipage-functions (export-dict-to-clamps)
#+BIND: org-html-htmlize-output-type 'css
# \\[\\[\\([^\\[]+\\)\\]\\] → [[\\1][\\1]]
# C-x 8 RET 200b RET C-x 8 0

* Overview
** Notation and Usage
   The Clamps Dictionary has been inspired by the [[../cm-dict/index.html][CM Dictionary]], which
   was an original part of Common Music 2. Rather than interfering
   with the original, the additions of the Clamps package have been
   separated into this [[./index.html][Clamps Dictionary]]. Both dictionaries are
   accessed by the same keyboard shortcut /<C-c C-d c>/, automatically
   integrated into the Clamps system using the standard [[overview:Installation][Installation]].

   The Notation of the Clamps Dictionary is simpler than the Notation
   used in the CM Dictionary. Function and Macro definitions use the
   definition syntax of the function or macro with the initial /defun/
   or /defmacro/ removed.

   Names of argumens in the /Arguments/ section of entries are printed
   in =red= and emphasized words appear in /green/.
")

(defparameter *clamps-extra-symbols*
  '(cm:sfz cl-refs:ref-object
    clamps:reset-logger-stream clamps:set-bpm))

(defparameter *clamps-extra-doc*
  '((cm:sfz (standard-class
             (new sfz &key (keynum 60) (amplitude 0) (duration 1) (preset :flute-nv) (play-fn nil) (pan 0.5) (startpos 0) (chan 100))

             "    Generates sfz Events.

   sfz accepts the following keywords:

   =:time= The output time in seconds, initially unbound.

   =:keynum= Keynum in Midicents

   =:amplitude= Amplitude in dB. /0/ corresponds to a scaling factor of /1/, /-100/ to a scaling factor of /0/.

   =:duration= Duration in seconds.

   =:preset= Keyword or symbol of a registered preset name.

   =:play-fn= The play function to be used for sample playback.

   =:pan= Number in the range /[0..1]/ defining equal power
   panning between the two outputs of the dsp on playback.

   =:startpos= The startposition in the sample in seconds.

   =:chan= The channel (layer) used in svg output.
   
@Examples
  (new sfz)
  ;; => #i(sfz keynum 60 amplitude 1 duration 1 preset :flute-nv
  ;;           play-fn nil pan 0.5 startpos 0 chan 100)

  ;; the following code should send 1 second of a flute middle C sound
  ;; to the first two oulets of incudine:

  (output (new sfz)) ; => ; No value

  ;; => loading :flute-nv from ~/quicklisp/local-projects/clamps/extra/snd/sfz/Flute-nv/000_Flute-nv.sfz
  ;; ; No values

  (loop
    for idx below 200
    for x = (/ idx 199)
    for time = 0 then (+ time (n-exp (interp x 0 0  0.3 1  1 0) 0.01 0.1))
    do (sprout
        (new sfz
          :time time
          :keynum (+ 65.5 (random (n-lin (interp x 0 0 1 1) 1 5)))
          :duration (+ 0.5 (random 2.0))
          :amplitude (n-lin (interp x 0 0 0.8 0 1 1) -12 -24))))

  ;; => nil
"))
    (cl-refs:ref-object
     (standard-class
      nil
      "    A /ref-object/ is a special class used in the /cl-refs/
   package. Its slots shouldn't be accessed or manipulated directly,
   but rather using the public functions of the cl-refs package listed
   below. For information how to use ref-objects refer to
   <<clamps:cl-refs>> in the Clamps Packages documentation.

@See-also
get-val
make-computed
make-ref
set-val
watch
"
      ))
    (clamps:set-bpm
     (function
      (bpm)
  "Set the tempo in beats per minute for both, CM and Incudine.

@Arguments
bpm - Number of beats per minute.

@See-also
set-tempo
"))
    ))

(defun all-clamps-symbols ()
  (let ((acc nil))
    (dolist (pkg *clamps-packages* (cons 'cl-user:clamps (nreverse acc)))
      (do-external-symbols (sym pkg)
        (let ((pkg-name (package-name (symbol-package sym))))
          (when (member pkg-name *clamps-packages* :test #'string=)
            (pushnew sym acc)))))))

(defun strip-package-names (list)
  "Return a copy of list with package names removed."
  (cond
    ((null list) nil)
    ((consp (first list))
     (cons (strip-package-names (first list))
           (strip-package-names (rest list))))
    ((and (symbolp (first list)) (symbol-package (first list)))
     (cons (intern (symbol-name (first list)))
           (strip-package-names (rest list))))
    (t
     (cons (first list)
           (strip-package-names (rest list))))))

(defparameter *all-clamps-syms*
  (let ((syms (all-clamps-symbols)))
    (mapcar #'cons (strip-package-names syms) syms)))

(defparameter *clamps-symbols-to-ignore*
  '(svg-import-export:add-svg-attr-props-to-quote
    clog-dsp-widgets:amp-node
    cl-poolplayer:args ats-cuda-display:ats-amod ats-cuda-display:ats-bw
    ats-cuda-display:ats-crosshairs ats-cuda-display:ats-data
    ats-cuda-display:ats-display ats-cuda-display:ats-display-init
    ats-cuda-display:ats-fmod ats-cuda-display:ats-idx
    ats-cuda-display:ats-mousepos ats-cuda-display:ats-play
    ats-cuda-display:ats-player-node-id ats-cuda-display:ats-res-balance
    ats-cuda-display:ats-scale ats-cuda-display:ats-shift-x
    ats-cuda-display:ats-sound ats-cuda-display:ats-width ats-cuda-display:ats-x
    svg-import-export:attributes clog-dsp-widgets:b-attr clog-dsp-widgets:b-elist
    clog-dsp-widgets:b-map clog-dsp-widgets:b-ref clog-dsp-widgets:b-unregister
    clog-dsp-widgets:b-unwatch cl-midictl:bank-buttons clog-dsp-widgets:binding
    clog-dsp-widgets:binding-name cl-poolplayer:buf-idx cl-midictl:button-labels cl-midictl:cc-fns
    cl-midictl:cc-map cl-midictl:cc-nums cl-midictl:cc-state
    clog-dsp-widgets:channel-offs cl-poolplayer:*circle-cw*
    cl-poolplayer:cm-collect cl-poolplayer:cm-collect-song
    cl-poolplayer:collecting-cm cl-midictl:cp-src
    clog-midi-controller:ctl-panel-vis cl-midictl:curr-bank cl-midictl:curr-player
    cl-midictl:*curr-preset* svg-import-export:cx svg-import-export:cy
    cl-midictl:cycle svg-import-export:d ats-cuda-display:data-watch
    orm-utils:default orm-utils:defconst cl-midictl:digest-nanoktl2-presets
    cl-poolplayer:digest-poolplayer-preset cl-poolplayer:distributed-play
    cl-poolplayer:dtime cl-poolplayer:dtime-dev cl-midictl:echo
    svg-import-export:elements cl-poolplayer:eventplayer
    cl-poolplayer:eventplotter cl-poolplayer:expand-arg-forms
    cl-midictl:faderfox-midi-f.orm cl-poolplayer:fig12-out
    svg-import-export:fill-color svg-import-export:fill-opacity
    svg-import-export:fill-rule cl-poolplayer:fn-digest-poolplayer-preset
    svg-import-export:fname svg-import-export:font-family
    svg-import-export:font-size svg-import-export:font-style
    svg-import-export:font-weight clog-dsp-widgets:format-style
    orm-utils:format-time cl-poolplayer:g1 cl-poolplayer:g2 cl-poolplayer:g3
    cl-poolplayer:g4 cl-midictl:get-active-players
    svg-import-export:get-tick-lines svg-import-export:gridtype
    clog-midi-controller:gui-container clog-midi-controller:gui-ctl-panel
    clog-midi-controller:gui-cycle clog-midi-controller:gui-fader
    clog-midi-controller:gui-ffwd clog-midi-controller:gui-m-buttons
    clog-midi-controller:gui-marker-left clog-midi-controller:gui-marker-right
    clog-midi-controller:gui-parent clog-midi-controller:gui-play
    clog-midi-controller:gui-r-buttons clog-midi-controller:gui-rec
    clog-midi-controller:gui-rewind clog-midi-controller:gui-s-buttons
    clog-midi-controller:gui-set-marker clog-midi-controller:gui-stop
    clog-midi-controller:gui-track-left clog-midi-controller:gui-track-right
    cl-midictl:gui-update-off cl-midictl:handle-player-button-press
    cl-midictl:handle-player-switch cl-midictl:handle-preset-bank-button-press
    cl-midictl:handle-preset-button-press cl-midictl:handle-store-button-press
    svg-import-export:header svg-import-export:height cl-midictl:hide-fader
    svg-import-export:href cl-midictl:init-nk2 cl-poolplayer:init-poolplayer
    cuda-usocket-osc:input-stream svg-import-export:insensitive orm-utils:insert
    orm-utils:integrate svg-import-export:inverse svg-import-export:label
    svg-import-export:last-id orm-utils:last-n cl-midictl:last-note-on
    cl-poolplayer:load-poolplayer-presets cl-poolplayer:load-poolplayer-sounds
    cl-midictl:load-presets of-incudine-dsps:lsample-amp
    of-incudine-dsps:lsample-buffer of-incudine-dsps:lsample-filename
    of-incudine-dsps:lsample-keynum of-incudine-dsps:lsample-loopend
    of-incudine-dsps:lsample-loopstart of-incudine-dsps:lsample-play-fn
    cl-midictl:m-buttons cl-poolplayer:make-p-song
    svg-import-export:make-piano-roll svg-import-export:make-staff-system
    svg-import-export:make-svg-cm-line svg-import-export:marker-end
    cl-midictl:marker-left cl-midictl:marker-right orm-utils:n
    svg-import-export:name cl-midictl:*nanoktl2-presets-file*
    cl-poolplayer:next-poolplayer-preset cl-midictl:nk-cycle
    cl-midictl:nk2-fader-last-cc cl-midictl:nk2-fader-modes
    cl-midictl:nk2-fader-update-fns cl-midictl:nk2-faders cl-midictl:nk2-last-cc
    cl-midictl:note-fns cl-midictl:note-state cl-poolplayer:npreset-play
    clog-dsp-widgets:num-channels clog-dsp-widgets:num-meters cl-plot:o
    svg-import-export:opacity clog-dsp-widgets:opt-format-attr
    cl-poolplayer:*outseq13* cl-poolplayer:*outseq8* cl-poolplayer:*outseq9*
    cl-poolplayer:p-song-afterfn cl-poolplayer:p-song-beforefn
    cl-poolplayer:p-song-durfn cl-poolplayer:p-song-name
    cl-poolplayer:p-song-playfn cl-poolplayer:p1 cl-poolplayer:p2 cl-poolplayer:p3
    cl-poolplayer:p4 svg-import-export:pd-color->svg-color cl-poolplayer:perform
    cl-poolplayer:play-song ats-cuda-display:play-watch cl-poolplayer:*pool-hash*
    cl-poolplayer:*poolplayer-events* cl-poolplayer:*poolplayer-presets-file*
    ats-cuda-display:pos-watch cl-midictl:preset-buttons cl-poolplayer:preset-play
    cl-midictl:preset-state cl-midictl:presets
    cl-poolplayer:previous-poolplayer-preset
    svg-import-export:print-head-to-stream svg-import-export:print-tail-to-stream
    svg-import-export:print-to-stream cl-midictl:r-buttons cl-refs:ref-id
    cl-refs:ref-listeners cl-refs:ref-object cl-refs:ref-object-super
    clog-dsp-widgets:refs cl-refs:*refs-seen* svg-import-export:renew-svg
    svg-import-export:rx svg-import-export:ry cl-midictl:s-buttons
    cl-poolplayer:save-poolplayer-presets cl-midictl:save-presets
    cuda-usocket-osc:send cl-poolplayer:serialize-score
    cl-midictl:set-player-buttons cl-poolplayer:set-poolplayer-preset-form
    cl-refs:%set-val cl-poolplayer:show-poolplayer-preset
    svg-import-export:showgrid cl-poolplayer:stereo-out
    svg-import-export:stroke-color svg-import-export:stroke-dasharray
    svg-import-export:stroke-linecap svg-import-export:stroke-linejoin
    svg-import-export:stroke-miterlimit svg-import-export:stroke-miterlimit1
    svg-import-export:stroke-opacity svg-import-export:stroke-width
    svg-import-export:svg-barlines svg-import-export:svg-cm-line-attribute
    svg-import-export:svg-cm-line-color svg-import-export:svg-cm-line-opacity
    svg-import-export:svg-cm-line-x1 svg-import-export:svg-cm-line-x2
    svg-import-export:svg-cm-line-y1 svg-import-export:svg-cm-line-y2
    svg-import-export:svg-color->pd-color svg-import-export:svg-piano-roll
    svg-import-export:svg-staff-system svg-import-export:svg-zeitachse
    cl-midictl:tr-ffwd cl-midictl:tr-play cl-midictl:tr-rec cl-midictl:tr-rewind
    cl-midictl:tr-stop cl-midictl:track-left cl-midictl:track-right
    cl-refs:%trigger svg-import-export:visible svg-import-export:w-height
    svg-import-export:w-width svg-import-export:w-x svg-import-export:w-y
    orm-utils:with-output-to-file orm-utils:with-shadowed-variable
    orm-utils:with-stream-to-string cl-refs:with-updating-deps cl-poolplayer:x
    svg-import-export:width
    svg-import-export:x svg-import-export:x1 svg-import-export:x2
    svg-import-export:xscale-lines svg-import-export:xscale-points
    svg-import-export:y svg-import-export:y1 svg-import-export:y2))

(defun ignore-clamps-symbol-p (sym)
  (and (member sym *clamps-symbols-to-ignore*) t))

(defparameter *clamps-symbols-to-export*
  (remove-if
   #'ignore-clamps-symbol-p
   (mapcar #'cdr *all-clamps-syms*)))

(defparameter *link-regexps*
  '(("<<\\*([^>]+)\\*>>" "[[#\\1][*​\\1​*]]")
    ("\\*([^* ]+)\\*" "*​\\1​*")
    ("#'<<([^>]+)>>" "[[\\1][#'\\1]]")
    ("<<#'([^>]+)>>" "[[\\1][#'\\1]]")
    ("<<dict:([^>]+)>>" "[[dict:\\1][\\1]]")
    ("<<clamps:([^>]+)>>" "[[clamps:\\1][\\1]]")
    ("<<overview:([^>]+)>>" "[[overview:\\1][\\1]]")
    ("<<([^>]+)><([^>]+)>>" "[[\\1][\\2]]")
    ("<<([^>]+)>>" "[[\\1][\\1]]")))

(defun recurse-apply (fn seq init)
  "similar to reduce but accepting strings as initial values."
  (if seq
      (recurse-apply
       fn (rest seq)
       (funcall fn (first seq) init))
      init))

(defun reformat-links (string)
  "Reformat <<...>> docstring links to org-mode dictionary links."
  (recurse-apply
   (lambda (replacement string)
     (cl-ppcre:regex-replace-all
      (first replacement)
      string
      (second replacement)))
   *link-regexps*
   string))

(defun remove-empty-strings (list)
  "Remove empty strings from list."
  (remove-if (lambda (string)
	       (string= (string-trim '(#\SPACE #\TAB) string) ""))
             list))

(defun trim-list-start (list)
  "Remove empty strings from start of list."
  (if (equal (string-trim #(#\SPACE #\TAB) (first list)) "")
      (trim-list-start (cdr list))
      list))

(defun trim-list (list)
  "Remove empty strings from start and end of list."
  (reverse (trim-list-start (reverse (trim-list-start list)))))

(defun reformat-arg (string)
  "Reformat single argument documentation for org-mode file."
  (cl-ppcre:regex-replace-all
   "^ *([^ ]+) +- +(.+)$"
   (reformat-links string)
   "    =\\1= -- \\2"))

(defun reformat-see-also (string)
  "Reformat single see also documentation for org-mode file."
  (reformat-links (format nil "    - <<~a>>" string)))

(defun clampsdoc-transcode-general (strings)
  "Reformat a line of the first section of docstring for org-mode file."
  (format nil "~{   ~a~%~}" (mapcar #'reformat-links (trim-list strings))))

(defun fill-string (string &key (margin 72) (left 0))
  "Wrap a long line at margin characters with optional left-margin of
/left/ #\Space characters inserted before all lines. Return wrapped
result."
  (format
   nil
   (if (zerop left)
       "~{~a~^~%~}"
       (format nil "~~{~va~~a~~^~~%~~}" left " "))
   (sb-unicode:lines string :margin margin)))

(defun reformat-arg-line (string)
  "reformat a line of an @Arguments entry."
  (if (cl-ppcre:scan "^ *- " string)
      (fill-string
       (cl-ppcre:regex-replace
	"^ *- +([^ ]+)"
	(reformat-links string)
	"- \\1")
       :left 4 :margin 69)
      (format nil "~a~%"
              (fill-string
               (cl-ppcre:regex-replace
		"^ *([^ ]+) - "
		(reformat-links string)
		"=\\1= -- ")
               :left 4 :margin 69))))

(defun get-arg-entries (arglist)
  (unless (cl-ppcre:scan "^[^ ]+ +- " (first arglist))
    (error "arglist not properly formatted: ~a" arglist))
  (let (acc
        (curr (first arglist)))
    (dolist (line (cdr arglist)
	     (nreverse
	      (push (reformat-arg-line curr) acc)))
      (if (or (cl-ppcre:scan "^[^ ]+ +- " line)
              (cl-ppcre:scan "^ *- " line))
          (progn
            (push (reformat-arg-line curr) acc)
            (setf curr line))
          (setf curr (concatenate 'string curr " " line)) ))))

(defun clampsdoc-transcode-arguments (arglist)
  "Reformat @Arguments section of docstring for org-mode file."
 (format nil "*** Arguments~%~{~a~^~%~}~%"
         (mapcar #'reformat-arg
                 (get-arg-entries (trim-list arglist)))))

(defun clampsdoc-transcode-examples (strings)
  "Reformat @Examples section of docstring for org-mode file."
  (format nil "*** Examples~%    #+BEGIN_SRC lisp
~{      ~a~^~%~}
    #+END_SRC~%"
          (trim-list strings)))

(defun clampsdoc-transcode-see-also (strings)
  "Reformat @See-also section of docstring for org-mode file."
  (format nil "*** See also~%~{~a~^~%~}~%"
          (mapcar #'reformat-see-also (remove-empty-strings strings))))

(defun clampsdoc-transcode-note (strings)
  "Reformat @Note section of docstring for org-mode file."
 (format nil "*** Note~%    ~{~a~^~%    ~}~%"
         (mapcar #'reformat-links strings)))

(defun clampsdoc-transcode-important-note (strings)
  "Reformat @Important-Note section of docstring for org-mode file."
 (format nil "*** Important Note~%    ~{~a~^~%    ~}~%"
         (mapcar #'reformat-links strings)))

(defparameter *docstring-fn-lookup*
  `(("@General" . ,#'clampsdoc-transcode-general)
    ("@Arguments" . ,#'clampsdoc-transcode-arguments)
    ("@Examples" . ,#'clampsdoc-transcode-examples)
    ("@See-also" . ,#'clampsdoc-transcode-see-also)
    ("@Note" . ,#'clampsdoc-transcode-note)
    ("@Important-Note" . ,#'clampsdoc-transcode-important-note)))

#|
(defun transcode-docstring (docstring)
  "Parse and transcode the complete docstring into org-mode file format."
  (format nil "~{~a~}"
          (mapcar
           (lambda (docpart)
             (funcall
              (cdr (assoc (first docpart) *docstring-fn-lookup* :test #'equal))
              (cdr docpart)))
           (with-input-from-string (in docstring)
             (loop
               for line = (read-line in nil nil)
               with result = '()
               with curr = '("@General")
               while line
               do (if (and (string/= line "") (char= (aref line 0) #\@))
                      (progn
                        (push (reverse curr) result)
                        (setf curr (list (string-trim '(#\SPACE #\TAB) line))))
                      (push (string-trim '(#\SPACE #\TAB) line) curr))
               finally (return (reverse (push (reverse curr) result))))))))
|#

(defun transcode-docstring (docstring)
  "Parse and transcode the complete docstring into org-mode file format."
  (format nil "~{~a~}"
          (mapcar
           (lambda (docpart)
             (funcall
              (cdr (assoc (first docpart) *docstring-fn-lookup* :test #'equal))
              (cdr docpart)))
           (with-input-from-string (in docstring)
             (let (result (curr '("@General")))
               (do ((line (read-line in nil nil) (read-line in nil nil)))
                   ((not line) (reverse (push (reverse curr) result)))
                 (if (and (string/= line "") (char= (aref line 0) #\@))
                     (progn
                       (push (reverse curr) result)
                       (setf curr (list (string-trim '(#\SPACE #\TAB) line))))
                     (push (string-trim '(#\SPACE #\TAB) line) curr))))))))

(defun format-function-entry (name args docstring stream type)
  "Format a function/macro, etc. entry for org-mode file."
  (format stream "** ~(~a~)~%   ~a~%   #+BEGIN_SRC lisp~%     ~(~a~)~%   #+END_SRC~%~a"
          (cl-ppcre:regex-replace "^\\*​*([^​]+)​*\\*$" name "*​\\1​*") type args docstring))

(defun format-variable-entry (name docstring stream type)
  "Format a Variable entry for org-mode file."
  (format stream "** ~(~a~)~%   ~a~%~a"
          (cl-ppcre:regex-replace "^\\*​*([^​]+)​*\\*$" name "*​\\1​*") type docstring))

(defun format-class-entry (name args docstring stream type)
  "Format a Class/Struct entry for org-mode file."
  (format stream "** ~(~a~)~%   ~a~%   #+BEGIN_SRC lisp~%     ~(~a~)~%   #+END_SRC~%~a"
          (cl-ppcre:regex-replace "^\\*​*([^​]+)​*\\*$" name "*​\\1​*") type args docstring))

(defun format-entry (name args type docstring stream)
  "Format a complete entry for org-mode file to stream."
  (let ((docstring (or docstring "")))
    (case type
      ((compiled-function function)
       (format-function-entry name args docstring stream "Function"))
      ((standard-generic-function macro)
       (format-function-entry
        name args docstring stream
        (cdr (assoc type
                    '((macro . "Macro")
                      (standard-generic-function . "Generic Function"))))))
      ((structure-class standard-class)
       (format-class-entry name args docstring stream
                           (if (eq type 'standard-class)
                               "Class"
                               "Structure")))
      ((condition type variable constant)
       (format-variable-entry name docstring stream
                              (format nil "~@(~A~)" type))))))

(defun write-clamps-entry (symbol format-entry-function stream)
  "write transcoded doc entry for symbol to stream."
  (let ((extra-doc (cadr (assoc symbol *clamps-extra-doc*))))
    (if extra-doc
        (let* ((name (symbol-name symbol))
               (*print-pretty* nil))
          (destructuring-bind (type lambda-list docstring) extra-doc
            (funcall format-entry-function name
                     lambda-list
                     type
                     (transcode-docstring docstring)
                     stream)))
        (let* ((name (symbol-name symbol))
               (package (package-name (symbol-package symbol)))
               (*print-pretty* nil))
          (when (boundp symbol)
            (let ((doc (documentation symbol 'variable)))
              (funcall format-entry-function name nil
                       (if (constantp symbol) 'constant 'variable)
                       (and doc (transcode-docstring doc))
                       stream)))
          (when (and (defined-type-name-p symbol)
                     (check-symbol-package symbol package 'type))
            (let* ((doc (documentation symbol 'type))
                   (class (find-class symbol nil))
                   (type (if class
                             (if (subtypep class 'condition)
                                 'condition
                                 (type-of class))
                             'type)))
              (funcall format-entry-function name nil type
                       (and doc (transcode-docstring doc))
                       stream)))
          (when (and (fboundp symbol)
                     (check-symbol-package symbol package 'function))
            (let ((doc (documentation symbol 'function))
                  (lambda-list (function-lambda-list symbol)))
              (funcall format-entry-function name
                       (cl-ppcre:regex-replace-all
                        "\\(function ([^)]+)\\)"
                        (cl-ppcre:regex-replace-all
                         "\\(quote nil\\)"
                         (format nil "~a"
                                 (cons (string-downcase name)
                                       (strip-package-names lambda-list)))
                         "'()")
                        "#'\\1")
                       (cond
                         ((macro-function symbol) 'macro)
                         (t (type-of (symbol-function symbol))))
                       (and doc (transcode-docstring doc))
                       stream)))))))

(cl-ppcre:regex-replace "\\(function ([^)]+)\\)"
                        "(function +)"
                        "#'\\1")

(defun split-letters (sym-list)
  "split the list into sublists with unique first letter."
  (let*
      (acc
       curr-list
       (curr #\a))
    (dolist (entry sym-list (reverse (if curr-list (push (list curr curr-list) acc) acc)))
      (if (char= curr (aref (second entry) 0))
          (progn
            (push entry curr-list)
            (format t "~a~%" curr-list))          
          (let ((tmp (list curr (reverse curr-list))))
            (format t "tmp: ~a~%" tmp)
            (push tmp acc)
            (setf curr-list (list entry))
            (setf curr (aref (second entry) 0)))))))

(defun format-level-1-header (curr next)
  "format the level-1 header given the curr and next enries in the
split-letter-list. The first element of its entries is the first
letter of all syms in the second element."
  (let ((curr-letter (char-code (first curr)))
        (next-letter (char-code (or (first next) #\{))))
    (if (= (- next-letter curr-letter) 1)
        (format nil "* ~a" (code-char (- curr-letter 32)))
        (format nil "* ~a-~a"
                (code-char (- curr-letter 32))
                (code-char (- next-letter 33))))))

(defun add-level-1-idx-names (split-letter-syms)
  (loop for (curr next) on split-letter-syms
        while curr
        collect (list (format-level-1-header curr next) (mapcar #'first (second curr)))))

;;; (get-clamps-dict-parts)

(defun get-clamps-dict-parts (symbols-to-export)
  (add-level-1-idx-names
   (split-letters
    (sort (mapcar #'list
                  symbols-to-export
                  (mapcar
                   (lambda (sym)
                     (string-trim
                      '(#\* #\%)
                      (format nil "~(~s~)" sym)))
                   (strip-package-names symbols-to-export)))
          #'string< :key #'second))))

(defun write-dict (outfile &key (if-exists :supersede))
  "Write all exported symbols of clamps and its subpackages to org-mode
file."
      (with-open-file (out outfile :direction :output :if-exists if-exists
                                   :if-does-not-exist :create)
        (format out *org-mode-dict-file-header*)
        (dolist (letter-entry (get-clamps-dict-parts
                               (append
                                *clamps-extra-symbols*
                                (remove-if
                                 #'ignore-clamps-symbol-p
                                 (all-clamps-symbols)))))
          (format out "~a~%" (first letter-entry))
          (dolist (symbol (second letter-entry))
            (write-clamps-entry symbol #'format-entry out)))
        outfile))
(format t "loaded config~%")

(write-dict "/home/orm/work/programmieren/lisp/clamps/doc/clamps-dictionary.org")
;; (sb-ext:quit)


