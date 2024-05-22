(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

(vim.cmd "setl lispwords+=def,defn,fn,comment")

