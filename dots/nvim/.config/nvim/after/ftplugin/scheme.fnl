(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(let [lisp (require :lib.lisp-family)]
  (lisp.set-whitespace)
  (lisp.set-rulestring))

(fn start-guile []
  (let [guile-cmd "guile --listen=/tmp/guile-repl.socket"]
    (vim.cmd (.. "tab ter " guile-cmd))))

(command! [] :StartGuile
  (fn [_]
    (start-guile)))

(setlocal^ lispwords "if")
(setlocal+ lispwords "define-public,match")

