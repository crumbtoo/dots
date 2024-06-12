(local ls (require :luasnip))

(let [idr-snippets (. (require :idris2-snippets) :all)]
  (ls.add_snippets :idris2 idr-snippets {:key :idris2}))

