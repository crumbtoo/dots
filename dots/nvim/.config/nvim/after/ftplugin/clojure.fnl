(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

(g! clojure_fuzzy_indent_patterns ["^with" "^def" "^let" "^match"])
(setlocal+ lispwords "def,defn,fn,comment,match")
(rem! lispwords [:if])
; (vim.cmd "setl lispwords+=def,defn,fn,comment,match")
; (vim.cmd "setl lispwords-=if")

