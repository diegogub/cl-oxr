(defsystem "cl-oxr"
  :version "0.1.0"
  :author "Diego Guraieb"
  :license ""
  :depends-on ( "dexador" "cl-json")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "OXR API."
  :in-order-to ((test-op (test-op "cl-oxr/tests"))))

(defsystem "cl-oxr/tests"
  :author "Diego Guraieb"
  :license ""
  :depends-on ("cl-oxr"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-oxr"
  :perform (test-op (op c) (symbol-call :rove :run c)))
