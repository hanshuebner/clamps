(in-package :big-orchestra)

(progn
(digest-bo-preset
0
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (or (getf args :dtimefn) (lambda (x) (n-exp x 0.05 0.2))) x)
:bufferfn (r-elt (getf args :g1))
:ampfn (funcall
        (or (getf args :ampfn)
            (lambda (x) x (+ (or (getf args :amp 0)) (random 12) -6)))
        x)
:transpfn (funcall
           (getf args :transpfn
                 (lambda (x) (r-lin (n-lin x -30 40) (n-lin x -30 80))))
           x)
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
1
(:p1 16
:p2 (+ 1 (random p1))
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn (lambda (x) (n-exp x 0.01 0.5))) x)
:bufferfn (r-elt (getf args :g1))
:ampfn (funcall (getf args :g2) x)
:transpfn (funcall (getf args :g3) x)
:startfn 0
:endfn (r-exp 0.1 0.14)
:stretchfn (r-exp 10 10)
:wwidthfn (/ (r-exp 40.0 42) (expt p2 0.99))
:attackfn 0
:releasefn (funcall (getf args :ampfn (lambda (x) x 0.1)) x)
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
2
(:p1 16
:p2 (+ 1 (random p1))
:p3 0
:p4 0
:dtimefn (r-exp 0.01 0.02)
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ (r-lin -14 -14))
:transpfn (r-lin -20.0 0)
:startfn 0
:endfn (r-exp 0.1 0.14)
:stretchfn (r-exp 2 3)
:wwidthfn 123
:attackfn 0
:releasefn 0.1
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
3
(:p1 32
:p2 (+ 1 (random p1))
:p3 0
:p4 0
:dtimefn (r-exp 0.01 0.03)
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ (r-lin -50 -50) (* 1 (- p1 p2)))
:transpfn (r-lin -20 -20)
:startfn 0.05
:endfn (r-exp 0.07 0.074)
:stretchfn (r-exp 60 60)
:wwidthfn (/ (r-exp 10.0 11) (expt p2 0.99))
:attackfn 0.1
:releasefn 0.1
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
4
(:p1 16
:p2 (+ 1 (random p1))
:p3 0
:p4 0
:dtimefn (r-exp 0.01 10)
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ (r-lin -44 -44) (* 3 (- p1 p2)))
:transpfn (r-lin -20 -20)
:startfn 0.006
:endfn (r-exp 0.01 0.014)
:stretchfn (r-exp 600 600)
:wwidthfn (/ (r-exp 40.0 42) (expt p2 0.96))
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
5
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.1 dur) x))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (n-exp 0 1 2)
:transpfn (r-exp 1 2)
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
6
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (* (/ dur 3) (expt (/ 0.1 dur) x))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ -12 (expt 12 x))
:transpfn (r-exp 1 2)
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
7
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.1 dur) x))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ -12 (expt 12 x))
:transpfn (+ (expt 24 x) (r-lin -11.0 -10))
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
8
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.1 dur) x))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ -12 (expt 12 x))
:transpfn (+ (expt 24 x) (r-lin -11.0 -10))
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
9
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.05 dur) (- 1 x)))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ 0 (* -12 x))
:transpfn (+ (expt 24 (- 1 x)) (r-lin -11.0 -10))
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
10
(:p1 (interp x 0 0 0.5 1 1 0)
:p2 0
:p3 0
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.05 dur) p1))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ 0 (* -12 p1))
:transpfn (+ (expt 24 (- 1 p1)) (r-lin -11.0 -10))
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
11
(:p1 (interp x 0 0 0.4 1 1 0)
:p2 (random 48)
:p3 (+ 0.1 (random 0.9))
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.05 dur) p1))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ 0 (* -12 p1))
:transpfn (+ (expt p2 (- 1 p1)) (r-lin (- 1 (/ p2 2)) (- (/ p2 2))))
:startfn 0
:endfn 0.1
:stretchfn (expt p3 x)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
12
(:p1 (interp x 0 1 0.5 0 1 1)
:p2 (random 48)
:p3 (+ 0.1 (random 0.9))
:p4 0
:dtimefn (* (/ dur 5) (expt (/ 0.05 dur) p1))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (+ 0 (* -12 p1))
:transpfn (+ (expt p2 (- 1 p1)) (r-lin (- 1 (/ p2 2)) (- (/ p2 2))))
:startfn 0
:endfn 0.1
:stretchfn (expt p3 x)
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
13
(:p1 (interp x 0 0.3 0.2 0 1 1)
:p2 0
:p3 0
:p4 0
:dtimefn (n-exp p1 0.1 1)
:bufferfn (funcall (getf args :bufferfn (lambda () (r-elt *buffers*))))
:ampfn (n-lin x 0 -24)
:transpfn -10
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn (r-exp 123 123)
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
14
(:p1 (1+ (random 16))
:p2 0
:p3 0
:p4 0
:dtimefn (r-exp 0.01 0.02)
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn (r-lin -12 0)
:transpfn (r-exp 1 1)
:startfn 0
:endfn (r-exp 0.11 0.121)
:stretchfn (r-exp 100 100)
:wwidthfn (* (- 16 p1) 5)
:attackfn 1
:releasefn 1
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
15
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn (valuefn 0.5)) x)
:bufferfn (funcall (getf args :bufferfn (lambda (x) x (r-elt *buffers*))) x)
:ampfn (funcall (getf args :ampfn (valuefn 0)) x)
:transpfn (funcall (getf args :transpfn (valuefn 0)) x)
:startfn (funcall (getf args :startfn (valuefn 0)) x)
:endfn (funcall (getf args :endfn (valuefn 0)) x)
:stretchfn (funcall (getf args :stretchfn (valuefn 1)) x)
:wwidthfn (funcall (getf args :wwidthfn (valuefn 123)) x)
:attackfn (funcall (getf args :attackfn (valuefn 0)) x)
:releasefn (funcall (getf args :release (valuefn 0.01)) x)
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
16
(:p1 (1+ (+ 4 (random 8)))
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn (valuefn 0.5)) x)
:bufferfn (funcall (getf args :bufferfn (lambda (x) x (r-elt *buffers*))) x)
:ampfn (+ (* -1 p1) (funcall (getf args :ampfn (valuefn 0)) x))
:transpfn (funcall (getf args :transpfn (valuefn 0)) x)
:startfn (funcall (getf args :startfn (valuefn 0)) x)
:endfn (funcall (getf args :endfn (valuefn 0)) x)
:stretchfn (funcall (getf args :stretchfn (valuefn 1)) x)
:wwidthfn (/ (getf args :bw 40) (expt p1 (getf args :ps 1.1)))
:attackfn (funcall (getf args :attackfn (valuefn 0)) x)
:releasefn (funcall (getf args :release (valuefn 0.01)) x)
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
17
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
18
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
19
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
20
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
21
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
22
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
23
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
24
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
25
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
26
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
27
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
28
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
29
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
30
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
31
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
32
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
33
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
34
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
35
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
36
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
37
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
38
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
39
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
40
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
41
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
42
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
43
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
44
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
45
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
46
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
47
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
48
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
49
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
50
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
51
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
52
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
53
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
54
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
55
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
56
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
57
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
58
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
59
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
60
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
61
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
62
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
63
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
64
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
65
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
66
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
67
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
68
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
69
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
70
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
71
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
72
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
73
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
74
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
75
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
76
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
77
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
78
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
79
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
80
(:p1 16
:p2 (+ 1 (random p1))
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn (lambda (x) (n-exp x 0.03 0.5))) x)
:bufferfn (r-elt (getf args :g1))
:ampfn (funcall (getf args :g2) x)
:transpfn (funcall (getf args :g3) x)
:startfn 0
:endfn 0
:stretchfn (r-exp 1 1)
:wwidthfn (/ (r-exp 40.0 42) (expt p2 0.99))
:attackfn 0
:releasefn 0.1
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
81
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
82
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
83
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
84
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
85
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
86
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
87
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
88
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
89
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
90
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
91
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
92
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
93
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
94
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
95
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
96
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
97
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (funcall (getf args :dtimefn 0.5))
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
98
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (getf args :dtimefn 0.1)
:bufferfn (funcall (getf args :bufferfn))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
(digest-bo-preset
99
(:p1 0
:p2 0
:p3 0
:p4 0
:dtimefn (getf args :dtimefn 0.1)
:bufferfn (getf args :bufferfn (r-elt *buffers*))
:ampfn 0
:transpfn 0
:startfn 0
:endfn 0
:stretchfn 1
:wwidthfn 123
:attackfn 0
:releasefn 0.01
:outfn (funcall (getf args :outfn #'stereo-out) x)))
)
