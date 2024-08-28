(load "/home/orm/work/programmieren/lisp/clamps/doc/../extra/elisp/cm-dict.el")
(mapcar
 (lambda (entry)
   (let ((symbol (intern (car entry)
			 *common-music-symbols*)))
     (if (boundp symbol)
	 (push (cadr entry) (symbol-value symbol))
       (set symbol (cdr entry)))))
 '(
   ("Notation and Usage" "clamps-dict/overview.html")
   ("abs-path" "clamps-dict/abs-path.html")
   ("add-buffer" "clamps-dict/add-buffer.html")
   ("add-dsp" "clamps-dict/add-dsp.html")
   ("add-elements" "clamps-dict/add-elements.html")
   ("add-midi-controller" "clamps-dict/add-midi-controller.html")
   ("add-sfz-preset" "clamps-dict/add-sfz-preset.html")
   ("add-svg-attr-props-to-quote" "clamps-dict/add-svg-attr-props-to-quote.html")
   ("all-permutations" "clamps-dict/all-permutations.html")
   ("amp->db" "clamps-dict/amp->db.html")
   ("amp->db-slider" "clamps-dict/amp->db-slider.html")
   ("amp-node" "clamps-dict/amp-node.html")
   ("args" "clamps-dict/args.html")
   ("array-slice" "clamps-dict/array-slice.html")
   ("ats->browser" "clamps-dict/ats->browser.html")
   ("ats-amod" "clamps-dict/ats-amod.html")
   ("ats-bw" "clamps-dict/ats-bw.html")
   ("ats-crosshairs" "clamps-dict/ats-crosshairs.html")
   ("ats-data" "clamps-dict/ats-data.html")
   ("ats-display" "clamps-dict/ats-display.html")
   ("ats-display-init" "clamps-dict/ats-display-init.html")
   ("ats-fmod" "clamps-dict/ats-fmod.html")
   ("ats-idx" "clamps-dict/ats-idx.html")
   ("ats-mousepos" "clamps-dict/ats-mousepos.html")
   ("ats-play" "clamps-dict/ats-play.html")
   ("ats-player-node-id" "clamps-dict/ats-player-node-id.html")
   ("ats-res-balance" "clamps-dict/ats-res-balance.html")
   ("ats-scale" "clamps-dict/ats-scale.html")
   ("ats-shift-x" "clamps-dict/ats-shift-x.html")
   ("ats-sound" "clamps-dict/ats-sound.html")
   ("ats-width" "clamps-dict/ats-width.html")
   ("ats-x" "clamps-dict/ats-x.html")
   ("attributes" "clamps-dict/attributes.html")
   ("audio-bus" "clamps-dict/audio-bus.html")
   ("b-attr" "clamps-dict/b.html")
   ("b-elist" "clamps-dict/b-elist.html")
   ("b-map" "clamps-dict/b-map.html")
   ("b-ref" "clamps-dict/b-ref.html")
   ("b-unregister" "clamps-dict/b-unregister.html")
   ("b-unwatch" "clamps-dict/b-unwatch.html")
   ("bang-object" "clamps-dict/bang-object.html")
   ("bank-buttons" "clamps-dict/bank-buttons.html")
   ("bind-ref-to-attr" "clamps-dict/bind-ref-to-attr.html")
   ("bind-refs-to-attrs" "clamps-dict/bind-refs-to-attrs.html")
   ("binding" "clamps-dict/binding.html")
   ("binding-name" "clamps-dict/binding-name.html")
   ("#bindings" "clamps-dict/​bindings​.html")
   ("buchla-scale" "clamps-dict/buchla-scale.html")
   ("buf-idx" "clamps-dict/buf-idx.html")
   ("buffer-id" "clamps-dict/buffer-id.html")
   ("buffer-loop-play*" "clamps-dict/buffer-loop-play.html")
   ("buffer-stretch-play" "clamps-dict/buffer-stretch-play.html")
   ("bus-name" "clamps-dict/bus-name.html")
   ("button-labels" "clamps-dict/button-labels.html")
   ("calcsndbytes" "clamps-dict/c.html")
   ("call/collecting" "clamps-dict/call-collecting.html")
   ("case-ext" "clamps-dict/case-ext.html")
   ("cc-fns" "clamps-dict/cc-fns.html")
   ("cc-map" "clamps-dict/cc-map.html")
   ("cc-nums" "clamps-dict/cc-nums.html")
   ("cc-state" "clamps-dict/cc-state.html")
   ("ccin" "clamps-dict/ccin.html")
   ("cd" "clamps-dict/cd.html")
   ("channel-offs" "clamps-dict/channel-offs.html")
   ("#circle-cw" "clamps-dict/​circle-cw​.html")
   ("clamps" "clamps-dict/clamps.html")
   ("clamps-base-url" "clamps-dict/clamps-base-url.html")
   ("clamps-gui-root" "clamps-dict/clamps-gui-root.html")
   ("clamps-restart-gui" "clamps-dict/clamps-restart-gui.html")
   ("clamps-start" "clamps-dict/clamps-start.html")
   ("clear-bindings" "clamps-dict/clear-bindings.html")
   ("clear-dependencies" "clamps-dict/clear-dependencies.html")
   ("clip" "clamps-dict/clip.html")
   ("cm-collect-song" "clamps-dict/cm-collect-song.html")
   ("collect-pool" "clamps-dict/collect-pool.html")
   ("collecting-cm" "clamps-dict/collecting-cm.html")
   ("combinations" "clamps-dict/combinations.html")
   ("construct-plot-command" "clamps-dict/construct-plot-command.html")
   ("copy-instance" "clamps-dict/copy-instance.html")
   ("copy-ref" "clamps-dict/copy-ref.html")
   ("count-elements" "clamps-dict/count-elements.html")
   ("cp-src" "clamps-dict/cp-src.html")
   ("create-collection" "clamps-dict/create-collection.html")
   ("create-grid" "clamps-dict/create-grid.html")
   ("create-hide-button" "clamps-dict/create-hide-button.html")
   ("create-o-bang" "clamps-dict/create-o-bang.html")
   ("create-o-knob" "clamps-dict/create-o-knob.html")
   ("create-o-multislider" "clamps-dict/create-o-multislider.html")
   ("create-o-numbox" "clamps-dict/create-o-numbox.html")
   ("create-o-radio" "clamps-dict/create-o-radio.html")
   ("create-o-scope" "clamps-dict/create-o-scope.html")
   ("create-o-slider" "clamps-dict/create-o-slider.html")
   ("create-o-svg" "clamps-dict/create-o-svg.html")
   ("create-o-toggle" "clamps-dict/create-o-toggle.html")
   ("create-o-vumeter" "clamps-dict/create-o-vumeter.html")
   ("ct->fv" "clamps-dict/ct->fv.html")
   ("cuda-dsp" "clamps-dict/cuda-dsp.html")
   ("curr-bank" "clamps-dict/curr-bank.html")
   ("#curr-preset" "clamps-dict/​curr-preset​.html")
   ("cx" "clamps-dict/cx.html")
   ("cy" "clamps-dict/cy.html")
   ("d" "clamps-dict/d.html")
   ("data-watch" "clamps-dict/data-watch.html")
   ("date-string" "clamps-dict/date-string.html")
   ("db->amp" "clamps-dict/db->amp.html")
   ("db->db-slider" "clamps-dict/db->db-slider.html")
   ("db-slider->amp" "clamps-dict/db-slider->amp.html")
   ("db-slider->db" "clamps-dict/db-slider->db.html")
   ("def-params" "clamps-dict/def-params.html")
   ("default" "clamps-dict/default.html")
   ("defconst" "clamps-dict/defconst.html")
   ("define-watch" "clamps-dict/define-watch.html")
   ("defparameter*" "clamps-dict/defparameter.html")
   ("defvar*" "clamps-dict/defvar.html")
   ("delete-props" "clamps-dict/delete-props.html")
   ("differentiate" "clamps-dict/differentiate.html")
   ("digest-nanoktl2-presets" "clamps-dict/digest-nanoktl2-presets.html")
   ("digest-poolplayer-preset" "clamps-dict/digest-poolplayer-preset.html")
   ("distributed-play" "clamps-dict/distributed-play.html")
   ("do-proplist" "clamps-dict/do-proplist.html")
   ("do-repeated" "clamps-dict/do-repeated.html")
   ("dround" "clamps-dict/dround.html")
   ("dsp-id" "clamps-dict/dsp-id.html")
   ("dsp-nodes" "clamps-dict/dsp-nodes.html")
   ("echo" "clamps-dict/e.html")
   ("elements" "clamps-dict/elements.html")
   ("ensure-buffer" "clamps-dict/ensure-buffer.html")
   ("ensure-prop" "clamps-dict/ensure-prop.html")
   ("ensure-sfz-preset" "clamps-dict/ensure-sfz-preset.html")
   ("#env1" "clamps-dict/​env1​.html")
   ("envelope*" "clamps-dict/envelope.html")
   ("eventplayer" "clamps-dict/eventplayer.html")
   ("eventplotter" "clamps-dict/eventplotter.html")
   ("every-nth" "clamps-dict/every-nth.html")
   ("exp-n" "clamps-dict/exp-n.html")
   ("expand-arg-forms" "clamps-dict/expand-arg-forms.html")
   ("export-svg" "clamps-dict/export-svg.html")
   ("export-svg-file" "clamps-dict/export-svg-file.html")
   ("faderfox-gui" "clamps-dict/f.html")
   ("faderfox-midi" "clamps-dict/faderfox-midi.html")
   ("fibonacci" "clamps-dict/fibonacci.html")
   ("fig12-out" "clamps-dict/fig12-out.html")
   ("file-string" "clamps-dict/file-string.html")
   ("fill-color" "clamps-dict/fill-color.html")
   ("fill-opacity" "clamps-dict/fill-opacity.html")
   ("fill-rule" "clamps-dict/fill-rule.html")
   ("filter" "clamps-dict/filter.html")
   ("find-buffer" "clamps-dict/find-buffer.html")
   ("find-controller" "clamps-dict/find-controller.html")
   ("find-dsp" "clamps-dict/find-dsp.html")
   ("firstn" "clamps-dict/firstn.html")
   ("flash" "clamps-dict/flash.html")
   ("flatten" "clamps-dict/flatten.html")
   ("flatten-fn" "clamps-dict/flatten-fn.html")
   ("fn-digest-poolplayer-preset" "clamps-dict/fn-digest-poolplayer-preset.html")
   ("fname" "clamps-dict/fname.html")
   ("font-family" "clamps-dict/font-family.html")
   ("font-size" "clamps-dict/font-size.html")
   ("font-style" "clamps-dict/font-style.html")
   ("font-weight" "clamps-dict/font-weight.html")
   ("format-style" "clamps-dict/format-style.html")
   ("format-time" "clamps-dict/format-time.html")
   ("format-with-slots" "clamps-dict/format-with-slots.html")
   ("ftom" "clamps-dict/ftom.html")
   ("fv->ct" "clamps-dict/fv->ct.html")
   ("get-active-players" "clamps-dict/g.html")
   ("get-buffer" "clamps-dict/get-buffer.html")
   ("get-dtime-fn" "clamps-dict/get-dtime-fn.html")
   ("get-dtime-fn-no-x" "clamps-dict/get-dtime-fn-no-x.html")
   ("get-duplicates" "clamps-dict/get-duplicates.html")
   ("get-keynum" "clamps-dict/get-keynum.html")
   ("get-prop" "clamps-dict/get-prop.html")
   ("get-props-list" "clamps-dict/get-props-list.html")
   ("get-ref" "clamps-dict/get-ref.html")
   ("get-sfz-preset" "clamps-dict/get-sfz-preset.html")
   ("get-sndfile-path" "clamps-dict/get-sndfile-path.html")
   ("get-tick-lines" "clamps-dict/get-tick-lines.html")
   ("get-time" "clamps-dict/get-time.html")
   ("get-val" "clamps-dict/get-val.html")
   ("#gnuplot-header" "clamps-dict/​gnuplot-header​.html")
   ("#gnuplot-options" "clamps-dict/​gnuplot-options​.html")
   ("#gnuplot-program" "clamps-dict/​gnuplot-program​.html")
   ("gridtype" "clamps-dict/gridtype.html")
   ("group" "clamps-dict/group.html")
   ("group-by" "clamps-dict/group-by.html")
   ("group-by-key" "clamps-dict/group-by-key.html")
   ("gui" "clamps-dict/gui.html")
   ("gui-update-off" "clamps-dict/gui-update-off.html")
   ("handle-midi-in" "clamps-dict/h.html")
   ("handle-player-button-press" "clamps-dict/handle-player-button-press.html")
   ("handle-preset-bank-button-press" "clamps-dict/handle-preset-bank-button-press.html")
   ("handle-preset-button-press" "clamps-dict/handle-preset-button-press.html")
   ("handle-store-button-press" "clamps-dict/handle-store-button-press.html")
   ("#hanning1024" "clamps-dict/​hanning1024​.html")
   ("header" "clamps-dict/header.html")
   ("height" "clamps-dict/height.html")
   ("hide-fader" "clamps-dict/hide-fader.html")
   ("highlight" "clamps-dict/highlight.html")
   ("href" "clamps-dict/href.html")
   ("id" "clamps-dict/i-k.html")
   ("id-hash" "clamps-dict/id-hash.html")
   ("idump" "clamps-dict/idump.html")
   ("#in-refs" "clamps-dict/​in-refs​.html")
   ("index-seq" "clamps-dict/index-seq.html")
   ("init-nk2" "clamps-dict/init-nk2.html")
   ("insensitive" "clamps-dict/insensitive.html")
   ("insert" "clamps-dict/insert.html")
   ("integrate" "clamps-dict/integrate.html")
   ("inverse" "clamps-dict/inverse.html")
   ("ip-exp" "clamps-dict/ip-exp.html")
   ("ip-lin" "clamps-dict/ip-lin.html")
   ("ip-log" "clamps-dict/ip-log.html")
   ("label" "clamps-dict/l.html")
   ("last-id" "clamps-dict/last-id.html")
   ("last-n" "clamps-dict/last-n.html")
   ("last-note-on" "clamps-dict/last-note-on.html")
   ("let-default" "clamps-dict/let-default.html")
   ("levelmeter" "clamps-dict/levelmeter.html")
   ("levelmeter-full-gui" "clamps-dict/levelmeter-full-gui.html")
   ("levelmeter-gui" "clamps-dict/levelmeter-gui.html")
   ("lin-n" "clamps-dict/lin-n.html")
   ("line*" "clamps-dict/line.html")
   ("lines->svg" "clamps-dict/lines->svg.html")
   ("list-dsps" "clamps-dict/list-dsps.html")
   ("list-sfz-presets" "clamps-dict/list-sfz-presets.html")
   ("load-poolplayer-presets" "clamps-dict/load-poolplayer-presets.html")
   ("load-poolplayer-sounds" "clamps-dict/load-poolplayer-sounds.html")
   ("load-presets" "clamps-dict/load-presets.html")
   ("load-sfz-preset" "clamps-dict/load-sfz-preset.html")
   ("lsample" "clamps-dict/lsample.html")
   ("lsample-amp" "clamps-dict/lsample-amp.html")
   ("lsample-buffer" "clamps-dict/lsample-buffer.html")
   ("lsample-filename" "clamps-dict/lsample-filename.html")
   ("lsample-keynum" "clamps-dict/lsample-keynum.html")
   ("lsample-loopend" "clamps-dict/lsample-loopend.html")
   ("lsample-loopstart" "clamps-dict/lsample-loopstart.html")
   ("lsample-play-fn" "clamps-dict/lsample-play-fn.html")
   ("m-buttons" "clamps-dict/m.html")
   ("m-exp" "clamps-dict/m-exp.html")
   ("m-exp-dev" "clamps-dict/m-exp-dev.html")
   ("m-exp-fn" "clamps-dict/m-exp-fn.html")
   ("m-exp-rd-fn" "clamps-dict/m-exp-rd-fn.html")
   ("m-exp-rd-rev-fn" "clamps-dict/m-exp-rd-rev-fn.html")
   ("m-exp-rev-fn" "clamps-dict/m-exp-rev-fn.html")
   ("m-exp-zero" "clamps-dict/m-exp-zero.html")
   ("m-exp-zero-fn" "clamps-dict/m-exp-zero-fn.html")
   ("m-exp-zero-rev-fn" "clamps-dict/m-exp-zero-rev-fn.html")
   ("m-lin" "clamps-dict/m-lin.html")
   ("m-lin-dev" "clamps-dict/m-lin-dev.html")
   ("m-lin-fn" "clamps-dict/m-lin-fn.html")
   ("m-lin-rd-fn" "clamps-dict/m-lin-rd-fn.html")
   ("m-lin-rd-rev-fn" "clamps-dict/m-lin-rd-rev-fn.html")
   ("m-lin-rev-fn" "clamps-dict/m-lin-rev-fn.html")
   ("make-adjustable-string" "clamps-dict/make-adjustable-string.html")
   ("make-bang" "clamps-dict/make-bang.html")
   ("make-cm-line" "clamps-dict/make-cm-line.html")
   ("make-computed" "clamps-dict/make-computed.html")
   ("make-keyword" "clamps-dict/make-keyword.html")
   ("make-lsample" "clamps-dict/make-lsample.html")
   ("make-oasr" "clamps-dict/make-oasr.html")
   ("make-p-song" "clamps-dict/make-p-song.html")
   ("make-quantlist" "clamps-dict/make-quantlist.html")
   ("make-ref" "clamps-dict/make-ref.html")
   ("map-all-pairs" "clamps-dict/map-all-pairs.html")
   ("map-indexed" "clamps-dict/map-indexed.html")
   ("map-params" "clamps-dict/map-params.html")
   ("map-proplist" "clamps-dict/map-proplist.html")
   ("map-tree" "clamps-dict/map-tree.html")
   ("mappend" "clamps-dict/mappend.html")
   ("mapply" "clamps-dict/mapply.html")
   ("marker-end" "clamps-dict/marker-end.html")
   ("marker-left" "clamps-dict/marker-left.html")
   ("marker-right" "clamps-dict/marker-right.html")
   ("master-amp-bus-levelmeter-gui" "clamps-dict/master-amp-bus-levelmeter-gui.html")
   ("master-amp-meter-bus" "clamps-dict/master-amp-meter-bus.html")
   ("master-amp-out-levelmeter-gui" "clamps-dict/master-amp-out-levelmeter-gui.html")
   ("master-bus-levelmeter-gui" "clamps-dict/master-bus-levelmeter-gui.html")
   ("memorize-random-state" "clamps-dict/memorize-random-state.html")
   ("meters" "clamps-dict/meters.html")
   ("#midi-cc-fns" "clamps-dict/​midi-cc-fns​.html")
   ("#midi-cc-state" "clamps-dict/​midi-cc-state​.html")
   ("midi-controller" "clamps-dict/midi-controller.html")
   ("midi-controller" "clamps-dict/midi-controller-1.html")
   ("#midi-debug" "clamps-dict/​midi-debug​.html")
   ("midi-input" "clamps-dict/midi-input.html")
   ("midi-output" "clamps-dict/midi-output.html")
   ("mtof" "clamps-dict/mtof.html")
   ("mton" "clamps-dict/mton.html")
   ("multf" "clamps-dict/multf.html")
   ("mysubseq" "clamps-dict/mysubseq.html")
   ("n-apply" "clamps-dict/n.html")
   ("n-exp" "clamps-dict/n-exp.html")
   ("n-exp-dev" "clamps-dict/n-exp-dev.html")
   ("n-exp-fn" "clamps-dict/n-exp-fn.html")
   ("n-exp-rev-fn" "clamps-dict/n-exp-rev-fn.html")
   ("n-exp-zero" "clamps-dict/n-exp-zero.html")
   ("n-lin" "clamps-dict/n-lin.html")
   ("n-lin-dev" "clamps-dict/n-lin-dev.html")
   ("n-lin-fn" "clamps-dict/n-lin-fn.html")
   ("n-lin-rev-fn" "clamps-dict/n-lin-rev-fn.html")
   ("name" "clamps-dict/name.html")
   ("named-amp-bus" "clamps-dict/named-amp-bus.html")
   ("named-bus" "clamps-dict/named-bus.html")
   ("nanoktl2-midi" "clamps-dict/nanoktl2-midi.html")
   ("nanoktl2-preset-gui" "clamps-dict/nanoktl2-preset-gui.html")
   ("nanoktl2-preset-midi" "clamps-dict/nanoktl2-preset-midi.html")
   ("#nanoktl2-presets-file" "clamps-dict/​nanoktl2-presets-file​.html")
   ("new-id" "clamps-dict/new-id.html")
   ("next-poolplayer-preset" "clamps-dict/next-poolplayer-preset.html")
   ("nk-cycle" "clamps-dict/nk-cycle.html")
   ("nk2-fader-last-cc" "clamps-dict/nk2-fader-last-cc.html")
   ("nk2-fader-modes" "clamps-dict/nk2-fader-modes.html")
   ("nk2-fader-update-fns" "clamps-dict/nk2-fader-update-fns.html")
   ("nk2-faders" "clamps-dict/nk2-faders.html")
   ("node-group" "clamps-dict/node-group.html")
   ("note-fns" "clamps-dict/note-fns.html")
   ("note-state" "clamps-dict/note-state.html")
   ("npreset-play" "clamps-dict/npreset-play.html")
   ("ntom" "clamps-dict/ntom.html")
   ("num-channels" "clamps-dict/num-channels.html")
   ("num-meters" "clamps-dict/num-meters.html")
   ("of-buffer-load" "clamps-dict/o.html")
   ("on-deps-update" "clamps-dict/on-deps-update.html")
   ("opacity" "clamps-dict/opacity.html")
   ("opt-format-attr" "clamps-dict/opt-format-attr.html")
   ("osc-midi-write-short" "clamps-dict/osc-midi-write-short.html")
   ("#out-refs" "clamps-dict/​out-refs​.html")
   ("out-stream-open?" "clamps-dict/out-stream-open.html")
   ("#outseq13" "clamps-dict/​outseq13​.html")
   ("#outseq8" "clamps-dict/​outseq8​.html")
   ("#outseq9" "clamps-dict/​outseq9​.html")
   ("p-song-afterfn" "clamps-dict/p.html")
   ("p-song-beforefn" "clamps-dict/p-song-beforefn.html")
   ("p-song-durfn" "clamps-dict/p-song-durfn.html")
   ("p-song-name" "clamps-dict/p-song-name.html")
   ("p-song-playfn" "clamps-dict/p-song-playfn.html")
   ("param-exp-func" "clamps-dict/param-exp-func.html")
   ("partition-seq" "clamps-dict/partition-seq.html")
   ("path-find-file" "clamps-dict/path-find-file.html")
   ("pd-color->svg-color" "clamps-dict/pd-color->svg-color.html")
   ("perform" "clamps-dict/perform.html")
   ("permute" "clamps-dict/permute.html")
   ("phasor*" "clamps-dict/phasor.html")
   ("phasor-loop*" "clamps-dict/phasor-loop.html")
   ("play-buffer*" "clamps-dict/play-buffer.html")
   ("play-buffer-stretch*" "clamps-dict/play-buffer-stretch.html")
   ("play-buffer-stretch" "clamps-dict/play-buffer-stretch-1.html")
   ("play-buffer-stretch-env-out" "clamps-dict/play-buffer-stretch-env-out.html")
   ("play-buffer-stretch-env-pan-out" "clamps-dict/play-buffer-stretch-env-pan-out.html")
   ("play-buffer-stretch-env-pan-out*" "clamps-dict/play-buffer-stretch-env-pan-out-1.html")
   ("play-buffer-stretch-out" "clamps-dict/play-buffer-stretch-out.html")
   ("play-lsample" "clamps-dict/play-lsample.html")
   ("play-lsample*" "clamps-dict/play-lsample-1.html")
   ("play-sample*" "clamps-dict/play-sample.html")
   ("play-sample" "clamps-dict/play-sample-1.html")
   ("play-sfz" "clamps-dict/play-sfz.html")
   ("play-sfz-loop" "clamps-dict/play-sfz-loop.html")
   ("play-sfz-one-shot" "clamps-dict/play-sfz-one-shot.html")
   ("play-song" "clamps-dict/play-song.html")
   ("play-watch" "clamps-dict/play-watch.html")
   ("plot" "clamps-dict/plot.html")
   ("plot-2d" "clamps-dict/plot-2d.html")
   ("points->svg" "clamps-dict/points->svg.html")
   ("#poolplayer-events" "clamps-dict/​poolplayer-events​.html")
   ("#poolplayer-presets-file" "clamps-dict/​poolplayer-presets-file​.html")
   ("port-available-p" "clamps-dict/port-available-p.html")
   ("pos-watch" "clamps-dict/pos-watch.html")
   ("preset-buttons" "clamps-dict/preset-buttons.html")
   ("preset-play" "clamps-dict/preset-play.html")
   ("preset-state" "clamps-dict/preset-state.html")
   ("presets" "clamps-dict/presets.html")
   ("previous-poolplayer-preset" "clamps-dict/previous-poolplayer-preset.html")
   ("print-head-to-stream" "clamps-dict/print-head-to-stream.html")
   ("print-tail-to-stream" "clamps-dict/print-tail-to-stream.html")
   ("print-to-stream" "clamps-dict/print-to-stream.html")
   ("pulse" "clamps-dict/pulse.html")
   ("pulse-off" "clamps-dict/pulse-off.html")
   ("pulse-on" "clamps-dict/pulse-on.html")
   ("push-if" "clamps-dict/push-if.html")
   ("pwd" "clamps-dict/pwd.html")
   ("quantize-time" "clamps-dict/q.html")
   ("r-buttons" "clamps-dict/r.html")
   ("r-elt" "clamps-dict/r-elt.html")
   ("r-exp" "clamps-dict/r-exp.html")
   ("r-exp-dev" "clamps-dict/r-exp-dev.html")
   ("r-getf" "clamps-dict/r-getf.html")
   ("r-lin" "clamps-dict/r-lin.html")
   ("random-elem" "clamps-dict/random-elem.html")
   ("range" "clamps-dict/range.html")
   ("recall-random-state" "clamps-dict/recall-random-state.html")
   ("reducing" "clamps-dict/reducing.html")
   ("ref-id" "clamps-dict/ref-id.html")
   ("ref-listeners" "clamps-dict/ref-listeners.html")
   ("ref-object" "clamps-dict/ref-object.html")
   ("ref-object-super" "clamps-dict/ref-object-super.html")
   ("refs" "clamps-dict/refs.html")
   ("#refs-seen" "clamps-dict/​refs-seen​.html")
   ("regenerate-points" "clamps-dict/regenerate-points.html")
   ("remove-all-buffers" "clamps-dict/remove-all-buffers.html")
   ("remove-all-dsps" "clamps-dict/remove-all-dsps.html")
   ("remove-all-midi-controllers" "clamps-dict/remove-all-midi-controllers.html")
   ("remove-buffer" "clamps-dict/remove-buffer.html")
   ("remove-dsp" "clamps-dict/remove-dsp.html")
   ("remove-midi-controller" "clamps-dict/remove-midi-controller.html")
   ("remove-sfz-preset" "clamps-dict/remove-sfz-preset.html")
   ("repeat" "clamps-dict/repeat.html")
   ("repeat-format" "clamps-dict/repeat-format.html")
   ("repeated" "clamps-dict/repeated.html")
   ("restore-envs" "clamps-dict/restore-envs.html")
   ("restore-tables" "clamps-dict/restore-tables.html")
   ("reverse-all" "clamps-dict/reverse-all.html")
   ("rfind" "clamps-dict/rfind.html")
   ("rotate" "clamps-dict/rotate.html")
   ("rx" "clamps-dict/rx.html")
   ("ry" "clamps-dict/ry.html")
   ("s-buttons" "clamps-dict/s.html")
   ("save-poolplayer-presets" "clamps-dict/save-poolplayer-presets.html")
   ("save-presets" "clamps-dict/save-presets.html")
   ("send" "clamps-dict/send.html")
   ("serialize-score" "clamps-dict/serialize-score.html")
   ("set-basedir" "clamps-dict/set-basedir.html")
   ("set-marker" "clamps-dict/set-marker.html")
   ("set-on-data" "clamps-dict/set-on-data.html")
   ("set-player-buttons" "clamps-dict/set-player-buttons.html")
   ("set-poolplayer-preset-form" "clamps-dict/set-poolplayer-preset-form.html")
   ("set-tempo" "clamps-dict/set-tempo.html")
   ("%set-val" "clamps-dict/%set-val.html")
   ("set-val" "clamps-dict/set-val.html")
   ("setf-default" "clamps-dict/setf-default.html")
   ("sfz->lsample" "clamps-dict/sfz->lsample.html")
   ("sfz-get-range" "clamps-dict/sfz-get-range.html")
   ("sfz-preset-buffer" "clamps-dict/sfz-preset-buffer.html")
   ("sfz-preset-file" "clamps-dict/sfz-preset-file.html")
   ("sfz-preset-loaded?" "clamps-dict/sfz-preset-loaded.html")
   ("show-poolplayer-preset" "clamps-dict/show-poolplayer-preset.html")
   ("showgrid" "clamps-dict/showgrid.html")
   ("#sine1024" "clamps-dict/​sine1024​.html")
   ("slurp" "clamps-dict/slurp.html")
   ("slurp-string" "clamps-dict/slurp-string.html")
   ("sort-by" "clamps-dict/sort-by.html")
   ("spit" "clamps-dict/spit.html")
   ("splice" "clamps-dict/splice.html")
   ("start-doc-acceptor" "clamps-dict/start-doc-acceptor.html")
   ("start-gui" "clamps-dict/start-gui.html")
   ("start-midi-engine" "clamps-dict/start-midi-engine.html")
   ("start-midi-receive" "clamps-dict/start-midi-receive.html")
   ("start-osc-midi-receive" "clamps-dict/start-osc-midi-receive.html")
   ("stereo-out" "clamps-dict/stereo-out.html")
   ("stop-midi-receive" "clamps-dict/stop-midi-receive.html")
   ("stop-osc-midi-receive" "clamps-dict/stop-osc-midi-receive.html")
   ("str-concat" "clamps-dict/str-concat.html")
   ("stroke-color" "clamps-dict/stroke-color.html")
   ("stroke-dasharray" "clamps-dict/stroke-dasharray.html")
   ("stroke-linecap" "clamps-dict/stroke-linecap.html")
   ("stroke-linejoin" "clamps-dict/stroke-linejoin.html")
   ("stroke-miterlimit" "clamps-dict/stroke-miterlimit.html")
   ("stroke-opacity" "clamps-dict/stroke-opacity.html")
   ("stroke-width" "clamps-dict/stroke-width.html")
   ("svg->lines" "clamps-dict/svg->lines.html")
   ("svg->points" "clamps-dict/svg->points.html")
   ("svg-barlines" "clamps-dict/svg-barlines.html")
   ("svg-class" "clamps-dict/svg-class.html")
   ("svg-clone" "clamps-dict/svg-clone.html")
   ("svg-cm-line" "clamps-dict/svg-cm-line.html")
   ("svg-cm-line-color" "clamps-dict/svg-cm-line-color.html")
   ("svg-cm-line-opacity" "clamps-dict/svg-cm-line-opacity.html")
   ("svg-cm-line-x1" "clamps-dict/svg-cm-line-x1.html")
   ("svg-cm-line-x2" "clamps-dict/svg-cm-line-x2.html")
   ("svg-cm-line-y1" "clamps-dict/svg-cm-line-y1.html")
   ("svg-cm-line-y2" "clamps-dict/svg-cm-line-y2.html")
   ("svg-collect-lines" "clamps-dict/svg-collect-lines.html")
   ("svg-color->pd-color" "clamps-dict/svg-color->pd-color.html")
   ("svg-file" "clamps-dict/svg-file.html")
   ("svg-group" "clamps-dict/svg-group.html")
   ("svg-gui-path" "clamps-dict/svg-gui-path.html")
   ("svg-layer" "clamps-dict/svg-layer.html")
   ("svg-line" "clamps-dict/svg-line.html")
   ("svg-piano-roll" "clamps-dict/svg-piano-roll.html")
   ("svg-point" "clamps-dict/svg-point.html")
   ("svg-rect" "clamps-dict/svg-rect.html")
   ("svg-staff-system" "clamps-dict/svg-staff-system.html")
   ("svg-text" "clamps-dict/svg-text.html")
   ("svg-zeitachse" "clamps-dict/svg-zeitachse.html")
   ("system-version" "clamps-dict/system-version.html")
   ("text-anchor" "clamps-dict/t.html")
   ("toggle-slot" "clamps-dict/toggle-slot.html")
   ("tr-ffwd" "clamps-dict/tr-ffwd.html")
   ("tr-play" "clamps-dict/tr-play.html")
   ("tr-rec" "clamps-dict/tr-rec.html")
   ("tr-rewind" "clamps-dict/tr-rewind.html")
   ("tr-stop" "clamps-dict/tr-stop.html")
   ("track-left" "clamps-dict/track-left.html")
   ("track-right" "clamps-dict/track-right.html")
   ("transform" "clamps-dict/transform.html")
   ("trigger" "clamps-dict/trigger.html")
   ("%trigger" "clamps-dict/%trigger.html")
   ("ucopy" "clamps-dict/u.html")
   ("unwatch" "clamps-dict/unwatch.html")
   ("update-all-controllers" "clamps-dict/update-all-controllers.html")
   ("update-preset-buttons" "clamps-dict/update-preset-buttons.html")
   ("update-state" "clamps-dict/update-state.html")
   ("v-collect" "clamps-dict/v.html")
   ("visible" "clamps-dict/visible.html")
   ("w-height" "clamps-dict/w.html")
   ("w-width" "clamps-dict/w-width.html")
   ("w-x" "clamps-dict/w-x.html")
   ("w-y" "clamps-dict/w-y.html")
   ("watch" "clamps-dict/watch.html")
   ("width" "clamps-dict/width.html")
   ("with-curr-dir" "clamps-dict/with-curr-dir.html")
   ("with-exp-midi-fn" "clamps-dict/with-exp-midi-fn.html")
   ("with-file-stream" "clamps-dict/with-file-stream.html")
   ("with-gnuplot-instance" "clamps-dict/with-gnuplot-instance.html")
   ("with-gui-update-off" "clamps-dict/with-gui-update-off.html")
   ("with-lin-midi-fn" "clamps-dict/with-lin-midi-fn.html")
   ("with-output-to-file" "clamps-dict/with-output-to-file.html")
   ("with-proplist/collecting" "clamps-dict/with-proplist-collecting.html")
   ("with-props" "clamps-dict/with-props.html")
   ("with-shadowed-variable" "clamps-dict/with-shadowed-variable.html")
   ("with-stream-to-string" "clamps-dict/with-stream-to-string.html")
   ("with-svg-file" "clamps-dict/with-svg-file.html")
   ("with-unwatched" "clamps-dict/with-unwatched.html")
   ("with-updating-deps" "clamps-dict/with-updating-deps.html")
   ("x" "clamps-dict/x.html")
   ("x1" "clamps-dict/x1.html")
   ("x2" "clamps-dict/x2.html")
   ("xscale-lines" "clamps-dict/xscale-lines.html")
   ("xscale-points" "clamps-dict/xscale-points.html")
   ("y" "clamps-dict/y.html")
   ("y1" "clamps-dict/y1.html")
   ("y2" "clamps-dict/y2.html")
   ("zoom" "clamps-dict/z.html")
))
