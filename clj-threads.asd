(defsystem :clj-threads
  :name "Port of Clojure thread macros to Common Lisp"
  :version "1.0.0"
  :author "Felipe Guerço Oliveira <felipeguerco@gmail.com>"
  :license "MIT"
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "clojure-threads"))))

  :in-order-to ((test-op (test-op :clj-threads/test))))

(defsystem :clj-threads/test
  :depends-on (:clj-threads :parachute)
  :components ((:module "test"
                :serial t
                :components ((:file "package")
                             (:file "clojure-threads-test"))))
  :perform (test-op (op c)
                    (symbol-call :parachute :test :clj-threads-test)))
