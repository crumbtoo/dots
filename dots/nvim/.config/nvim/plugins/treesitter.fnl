(local tsc (require :nvim-treesitter.configs))

(tsc.setup
  {:ensure_installed []
   :highlight {:enable true}
   :textobjects
   {:select
    {:enable true
     :lookahead true
     :keymaps {:ad "@decl.outer"
               :id "@decl.inner"
               :ir "@assignment.rhs"
               :il "@assignment.lhs"
               :as "@signature.outer"
               :is "@signature.inner"}}
    :move
    {:enable true
     :goto_next_start {"]]" "@decl.outer"
                       "]s" "@signature.outer"
                       "]f" "@function.outer"
                       "]n" "@hole"
                       "<leader>p" "@pat"}
     :goto_previous_start {"[[" "@decl.outer"
                           "[s" "@signature.outer"
                           "[f" "@function.outer"
                           "[n" "@hole"
                           "<leader>o" "@pat"}}
    :swap
    {:enable true
     :swap_next {:>d "@toplevel"}
     :swap_previous {:<d "@toplevel"}}}})

