(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(map! [i :buffer] :<C-\>
      #(vim.fn.cornelis#prompt_input)
      "agda prompt input")

(map! [n :buffer] :<leader>R
      ":CornelisLoad<CR>"
      "agda reload")

(set vim.b.rulestring
     "{- -------------------------------------------------------------------------- -}")

;;; whitespace
(set! tabstop 2)
(set! shiftwidth 2)
(set! softtabstop 2)
(set! expandtab)

;;; agda-mode binds

(map! [n :buffer] :<leader>re ::CornelisRefine<CR>
      "agda refine")
(map! [n :buffer] :<leader>d ::CornelisMakeCase<CR>
      "agda make case")
(map! [n :buffer] :K ::CornelisTypeContextInfer<CR>)
(map! [n :buffer] :<leader>e ::CornelisNormalize<CR>)
(map! [n :buffer] :<leader>aa ::CornelisAuto<CR>)
(map! [n :buffer] :<leader>as ::CornelisSolve<CR>)
(map! [n :buffer] :<leader>q  ::CornelisQuestionToMeta<CR>)
(map! [n :buffer] :<leader>ti ::CornelisTypeInfer<CR>)
(map! [n :buffer] :gd        ::CornelisGoToDefinition<CR>)
(map! [n :buffer] "[n"       ::CornelisPrevGoal<CR>)
(map! [n :buffer] "]n"       ::CornelisNextGoal<CR>)
(map! [n :buffer] :<C-A>     ::CornelisInc<CR>)
(map! [n :buffer] :<C-X>     ::CornelisDec<CR>)

(g! cornelis_agda_prefix "\\")

(do (let [bind vim.fn.cornelis#bind_input]
      (bind :0 "₀")
      (bind :1 "₁")
      (bind :2 "₂")
      (bind :3 "₃")
      (bind :4 "₄")
      (bind :5 "₅")
      (bind :6 "₆")
      (bind :7 "₇")
      (bind :8 "₈")
      (bind :9 "₉")
      (bind :l "λ")))

(augroup! :agda-write-load
  [[BufWritePost] *.agda `(vim.cmd ":CornelisLoad")])

