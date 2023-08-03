# clj-threads - Clojure threads in Common Lisp

This is my attempt to reproduce Clojure's arrow macros (`->`, `-->`
and `as->`) in Common Lisp.

## Why?

It is a way for me to learn and have fun writing CL code

## Loading

```lisp
(asdf:load-system "clj-threads")
```

## Running tests

```lisp
(asdf:test-system "clj-threads")
```

## Examples

### Thread-first `->`
```lisp
(-> "ab cd ef gh"
  (string-capitalize :start 5)
  (reverse))
```
Returns
```lisp
"hG fE dc ba"
```

### Thread-last `->>`
```lisp
(->> '(1 2 3 4 5)
  (remove-if #'evenp)
  (mapcar #'/))
```
Returns
```lisp
(1 1/3 1/5)
```

### Thread-as `as->`
```lisp
(as-> ($ "12345")
  (map 'list #'digit-char-p $)
  (sort $ #'>)
  (remove-if #'evenp $)
  (mapcar #'/ $))
```
Returns
```lisp
(1/5 1/3 1)
```

```lisp
(as-> (n 0)
  (1+ n)
  (1+ n))
```
Returns
```lisp
2
```
