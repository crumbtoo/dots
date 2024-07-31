(local lspc (require :lspconfig))

(fn server [name cfg]
  ((. lspc name :setup) (or cfg {})))

(server :agda_ls)
(server :ocamllsp)
(server :fennel_ls)

