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
               :is "@signature.inner"
               :ik "@kv_pair.outer"}}
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
                           "<leader>o" "@pat"
                           "[k" "@kv_pair.outer"}}
    :swap
    {:enable true
     :swap_next {:>d "@toplevel"
                 :>k "@kv_pair.outer"}
     :swap_previous {:<d "@toplevel"
                     :<k "@kv_pair.outer"}}}})

