(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

; (vim.cmd "setl lispwords+=def,defn,fn,comment,match")
(setlocal+ lispwords "def,defn,fn,comment,match")

