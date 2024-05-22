;; inherits: agda
;; extends

((qid) @hole
 (#eq? @hole "?"))

; (atom
;  "{" "}") @hole

(atom
 "{"
 (expr (atom) @_bang1 (atom) @_bang2
       (#eq? @_bang1 @_bang2 "!"))
 "}") @hole

