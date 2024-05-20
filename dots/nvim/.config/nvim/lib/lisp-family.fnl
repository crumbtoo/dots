(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(local M {})

(fn M.set-whitespace []
  ;;; whitespace
  (setlocal! tabstop 2)
  (setlocal! shiftwidth 2)
  (setlocal! softtabstop 2)
  (setlocal! expandtab))

(fn M.set-rulestring []
  ; TODO: use (b! ...)
  (set vim.b.rulestring
  ";------------------------------------------------------------------------------;"))

M

