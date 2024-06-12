(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

(let [no-lw [:do :if]]
  (rem! lispwords no-lw)
  (g! fennel_fuzzy_indent_blacklist no-lw))

; (let [lw-patterns ["^accumulate$" "^each$" "^fn$" "^for$" "^faccumulate$"
;                    "^fcollect$" "^i\\?collect$" "^global$" "^let" "^lambda$"
;                    "^local$" "^macro" "^match$" "^match-try$" "^while"
;                    "^with-open$" "^var$" "^λ$" "^def"]]
;   (g! fennel_fuzzy_indent_patterns lw-patterns))

