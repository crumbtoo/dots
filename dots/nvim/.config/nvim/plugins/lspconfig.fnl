(let [lspc (require :lspconfig)]
  ((. lspc :agda_ls :setup) {})
  ((. lspc :ocamllsp :setup) {}))

