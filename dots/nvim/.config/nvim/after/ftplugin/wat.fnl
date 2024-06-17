(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

; (setlocal! commentstring ";; %s")
(vim.cmd "setlocal commentstring=;;\\ %s")

; do
;   local lisp = require("lib.lisp-family")
;   lisp["set-whitespace"]()
;   lisp["set-rulestring"]()
; end
; vim.opt_local["commentstring"] = ";; %s"
; return print("hi")
