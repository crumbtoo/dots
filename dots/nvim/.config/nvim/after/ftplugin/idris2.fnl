(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(local idris2 (require :idris2))
(local ca (require :idris2.code_action))
(local repl (require :idris2.repl))
(local mv (require :idris2.metavars))
(local sem (require :lib.semantic-binds))

(set vim.b.rulestring
     "--------------------------------------------------------------------------------")

;; hacky workaround to fix the lsp not starting when idris2.nvim is lazy-loaded.
(exec! [LspStart])

;; idris2.nvim sets this to "--%s", without a space.
(setlocal! commentstring "-- %s")

(map! [n] :<Leader>d
      #(ca.case_split)
      "idris2: split case")

(map! [n] :<Leader>re
      #(ca.refine_hole)
      "idris2: refine hole")

(map! [n] :<leader>mc
      #(ca.make_case)
      "idris2: make case")

(map! [n] :<leader>ml
      #(ca.make_lemma)
      "idris2: make lemma")

(map! [n] :<leader>mw
      #(ca.make_with)
      "idris2: make with")

(map! [n] :<leader>ac
      #(ca.add_clause)
      "idris2: add clause")

(map! [n] sem.evaluate-prompt
      #(repl.evaluate)
      "idris2: evaluate")

(map! [n] sem.infer-type-prompt
      #(do (repl.evaluate)
           (vim.api.nvim_feedkeys ":t " "n" true))
      "idris2: evaluate")

(map! [n] "[n"
      #(mv.goto_prev)
      "idris2: goto prev metavar")
(map! [n] "]n"
      #(mv.goto_next)
      "idris2: goto next metavar")

(set! tabstop 2)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! expandtab)

