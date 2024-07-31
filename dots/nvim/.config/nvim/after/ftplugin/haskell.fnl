(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(set vim.b.rulestring
     "--------------------------------------------------------------------------------")

(set vim.b.get-project ":HsPackageCabal")

; (fn get-haskell-indent []
;   10)

; (set _G.GetHaskellIndent get-haskell-indent)

; (set! indentexpr "v:lua.GetHaskellIndent()")

(local ht (require :haskell-tools))

(map! [n :buffer] :<leader>e
      vim.diagnostic.open_float
      "open diagnostic in float")

;;; whitespace
(set! tabstop 2)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! expandtab)

