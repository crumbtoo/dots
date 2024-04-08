(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(g! easy_align_delimiters
    {:| {:pattern "\\(=\\||\\)"}
     :r {:pattern "[≤≡≈∎]" :left_margin 2 :right_margin 0}})

