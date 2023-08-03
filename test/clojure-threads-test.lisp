(in-package :clj-threads-test)


(define-test thread-first-test
  "Tests for the thread-first (->) macro"

  (is equal '(10 1 2 3 4)
      (-> 10 (list 1 2 3 4)))

  (is equal "hG fE dc ba"
      (-> "ab cd ef gh"
        (string-capitalize :start 5)
        (reverse))))


(define-test thread-last-test
  "Tests for the thread-last (->>) macro"

  (is equal '(1 2 3 4 10)
      (->> 10 (list 1 2 3 4)))

  (is equal '(1 1/3 1/5)
      (->> '(1 2 3 4 5)
        (remove-if #'evenp)
        (mapcar #'/))))


(define-test thread-as-test
  "Tests for the thread-as (as->) macro"
  (is equal '(1/5 1/3 1)
      (as-> ($ "12345")
        (map 'list #'digit-char-p $)
        (sort $ #'>)
        (remove-if #'evenp $)
        (mapcar #'/ $)))

  (is equal '(6 2)
      (as-> (l (list 1 2 3 4))
        (remove-if #'evenp l)
        (mapcar (lambda (x) (* x 2)) l)
        (sort l #'>)))

  (is eq 2
      (as-> (n 0)
        (1+ n)
        (1+ n))))
