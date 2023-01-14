(defpackage damona/tests/main
  (:use :cl
        :damona
        :rove))
(in-package :damona/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :damona)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
