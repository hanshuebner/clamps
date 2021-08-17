;;;; package.lisp

(defpackage #:cl-sfz
  (:use #:cl #:cl-ppcre #:incudine)
;;;  (:shadowing-import-from #:incudine :sample-play :lsample-play)
  (:export
   #:load-sfz-preset
   #:show-sfz-presets
   #:remove-sfz-preset
   #:sfz-get-range
   #:sf-table-get-range
   #:play-sfz
   #:play-sfz-loop
   #:play-sfz-one-shot))
