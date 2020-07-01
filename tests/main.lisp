(defpackage cl-oxr/tests/main
  (:use :cl
        :cl-oxr
        :rove))
(in-package :cl-oxr/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-oxr)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
