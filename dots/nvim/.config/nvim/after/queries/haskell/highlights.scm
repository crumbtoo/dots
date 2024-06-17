;; inherits: haskell
;; extends

("forall"
 (#set! conceal "∀")) @keyword.repeat

("\\"
 (#set! conceal "λ")) @operator

((operator) @_op
 (#eq? @_op "||")
 (#set! conceal "∨")) @operator

((operator) @_op
 (#eq? @_op "&&")
 (#set! conceal "∧")) @operator

; ((name) @_name
;  (#eq? @_name "𝔹")) @_Bool

; ((name) @_name
;  (#eq? @_name "ℤ")) @_Int

