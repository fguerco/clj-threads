(in-package #:clj-threads-test)



(def-suite thread-first
  :description "Tests for the thread-first (->) macro")

(test (thread-first-test :suite thread-first)
  (is (equal '(10 1 2 3 4)
             (-> 10 (list 1 2 3 4))))

  (is (equal "hG fE dc ba"
             (-> "ab cd ef gh"
               (string-capitalize :start 5)
               (reverse)))))



(def-suite thread-last
  :description "Tests for the thread-last (->>) macro")

(test (thread-last-test :suite thread-last)
  (is (equal '(1 2 3 4 10)
             (->> 10 (list 1 2 3 4))))

  (is (equal '(1 1/3 1/5)
             (->> '(1 2 3 4 5)
               (remove-if-not #'oddp)
               (mapcar #'/)))))



(def-suite thread-as
  :description "Tests for the thread-as (as->) macro")

(test (thread-as-test :suite thread-as)
  (is (equal '(1/5 1/3 1)
             (as-> ($ "12345")
               (map 'list #'string $)
               (mapcar #'parse-integer $)
               (sort $ #'>)
               (remove-if-not #'oddp $)
               (mapcar #'/ $))))

  (is (equal '(6 2)
             (as-> (l (list 1 2 3 4))
               (remove-if-not #'oddp l)
               (mapcar (lambda (x) (* x 2)) l)
               (sort l #'>))))
  (is (eq 2
          (as-> (n 0)
            (1+ n)
            (1+ n)))))
