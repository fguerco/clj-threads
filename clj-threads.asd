(asdf:defsystem #:clj-threads
  :name "Port of Clojure thread macros to Common Lisp"
  :version "1.0.0"
  :author "Felipe Guerço Oliveira <felipeguerco@gmail.com>"
  :depends-on (#:clj-threads/src
               #:clj-threads/test)
  :in-order-to ((test-op (test-op #:clj-threads/test))))

(asdf:defsystem #:clj-threads/src
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "clojure-threads")))))

(asdf:defsystem #:clj-threads/test
  :depends-on (#:clj-threads/src #:fiveam)
  :components ((:module "test"
                :serial t
                :components ((:file "package")
                             (:file "clojure-threads-test"))))
  :perform (test-op (op c)
                    (funcall (read-from-string "5am:run-all-tests"))))
