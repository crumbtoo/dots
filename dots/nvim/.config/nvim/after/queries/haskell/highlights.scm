;; inherits: haskell
;; extends

("forall" @keyword.repeat
 (#set! conceal "∀")) @_forall

("\\" @operator
 (#set! conceal "λ")) @_lambda

((operator) @_op
 (#eq? @_op "||")
 (#set! conceal "∨")) @_or

((operator) @_op
 (#eq? @_op "&&")
 (#set! conceal "∧")) @_and

; ((name) @_name
;  (#eq? @_name "𝔹")) @_Bool

; ((name) @_name
;  (#eq? @_name "ℤ")) @_Int

