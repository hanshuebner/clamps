
(defvar *clamps-overview-symbols*)
(setq *clamps-overview-symbols* (make-vector 63 0))
(mapcar
     (lambda (entry)
       (let ((symbol (intern (car entry)
    			 *clamps-overview-symbols*)))
         (if (boundp symbol)
    	 (push (cadr entry) (symbol-value symbol))
           (set symbol (cdr entry)))))
     '(
   ("What is Clamps?" "overview/01_00_introduction.html")
   ("Why Clamps?" "overview/01_02_why-clamps.html")
   ("External components of Clamps" "overview/01_03_external-components-of-clamps.html")
   ("Internal Components of Clamps" "overview/01_04_internal-components-of-clamps.html")
   ("clamps-install" "overview/02_00_installation.html")
   ("Online Help System" "overview/04_00_tools.html")
   ("Context Help" "overview/04_02_context-help.html")
   ("Finding Source Definitions" "overview/04_03_finding-source-definitions.html")
   ("Code Inspection" "overview/04_04_code-inspection.html")
   ("Debugging Tools" "overview/04_05_debugging-tools.html")
))
