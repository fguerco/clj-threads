(in-package :clj-threads)

(defmacro -> (value &body forms)
  (reduce (lambda (prev it) `(,(car it) ,prev ,@(cdr it)))
          forms :initial-value value))
            
(defmacro ->> (value &body forms)
  (reduce (lambda (prev it) `(,@it ,prev))
          forms :initial-value value))

(defmacro as-> ((var value) &body forms)
  (reduce (lambda (prev it) (subst prev var it))
          forms :initial-value value))

