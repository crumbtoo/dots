(local tsc (require :nvim-treesitter.configs))

(tsc.setup
  {:ensure_installed []
   :highlight {:enable true}
   :textobjects
   {:select
    {:enable true
     :lookahead true
     :keymaps {:ad "@function.outer"
               :id "@function.inner"}}
    :move
    {:enable true
     :goto_next_start {"]]" "@function.outer"}
     :goto_previous_start {"[[" "@function.outer"}}}})

