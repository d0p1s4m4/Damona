(defsystem "damona"
  :version "0.1.0"
  :author "d0p1"
  :license ""
  :depends-on ("usocket")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "damona/tests"))))

(defsystem "damona/tests"
  :author "d0p1"
  :license ""
  :depends-on ("damona"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for damona"
  :perform (test-op (op c) (symbol-call :rove :run c)))
