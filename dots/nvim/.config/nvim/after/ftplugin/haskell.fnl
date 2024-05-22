(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(set vim.b.rulestring
     "--------------------------------------------------------------------------------")

; (fn get-haskell-indent []
;   10)

; (set _G.GetHaskellIndent get-haskell-indent)

; (set! indentexpr "v:lua.GetHaskellIndent()")

(local ht (require :haskell-tools))

(map! [n :buffer] :<leader>e
      vim.diagnostic.open_float
      "open diagnostic in float")
(map! [n :buffer] "]d"
      vim.diagnostic.goto_next
      "goto next diagnostic")
(map! [n :buffer] "[d"
      vim.diagnostic.goto_prev
      "goto prev diagnostic")

;;; whitespace
(set! tabstop 2)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! expandtab)

;;; concealment
; (let [syn (require :lib.common-syntax)]
;   (syn.forall))

