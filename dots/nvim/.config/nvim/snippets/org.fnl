(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)
(local ls (require :luasnip))
(local t ls.text_node)
(local i ls.insert_node)
(local d ls.dynamic_node)
(local fmta (. (require :luasnip.extras.fmt) :fmta))
(import-macros {: s : s*} :lib.snippet-macros)

[(s :src
    "#+begin_src"
    (fmta "#+begin_src <>\n<>\n#+end_src"
          [(i 1) (i 2)]))
 (s* :beg
     "#+begin_.."
     (concat! "\n"
              "#+begin_$1"
              "$2"
              "#+end_$1"))
 ]

