(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

(setlocal! commentstring ";; %s")
(setlocal! lisp)
(setlocal! iskeyword "33,35-39,42-43,45-58,60-90,94,95,97-122,126")

(vim.cmd "
setl lispwords+=module
setl lispwords+=func
setl lispwords+=sub
setl lispwords+=type
")

