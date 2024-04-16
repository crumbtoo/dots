(local tsc (require :nvim-treesitter.configs))

(tsc.setup
  {:ensure_installed []
   :highlight {:enable true}
   :textobjects
   {:select
    {:enable true
     :lookahead true
     :keymaps {:ad "@function.outer"
               :id "@function.inner"}}}})

