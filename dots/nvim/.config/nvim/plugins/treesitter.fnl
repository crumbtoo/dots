(local tsc (require :nvim-treesitter.configs))

(tsc.setup
  {:ensure_installed []
   :highlight {:enable true}
   :textobjects
   {:select
    {:enable true
     :lookahead true
     :keymaps {:ad "@decl"
               :id "@decl"
               :ac "@class.outer"
               :ic "@class.inner"
               :as "@signature.outer"
               :is "@signature.inner"}}
    :move
    {:enable true
     :goto_next_start {"]]" "@decl"
                       "]s" "@signature.outer"
                       "]f" "@function.outer"
                       "]n" "@hole"}
     :goto_previous_start {"[[" "@decl"
                           "[s" "@signature.outer"
                           "[f" "@function.outer"
                           "[n" "@hole"}}}})

