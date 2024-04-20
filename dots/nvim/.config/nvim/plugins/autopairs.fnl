(local npairs (require :nvim-autopairs))
(local rule (require :nvim-autopairs.rule))
(local ts-conds (require :nvim-autopairs.ts-conds))
(local utils (require :lib.utils))

(npairs.setup
  { :check_ts true
    :enable_check_bracket_line false
    :map_cr true
    :enable_bracket_in_quote true
    :enable_afterquote true
    :disable_in_macro false
  })

(macro ft-rules [fts ...]
  `(->> ,fts ,...))

(local lisps [:fennel :lisp :clojure :scheme])
(local ml-ish [:agda :haskell])

; remove '`' rule on lisp
(-?> (npairs.get_rules "'")
     (tset 1 :not_filetypes (utils.concat lisps ml-ish)))
(-?> (npairs.get_rules "`")
     (tset 1 :not_filetypes (utils.concat lisps ml-ish)))

(npairs.add_rules
  [ (ft-rules [:tex :plaintex]
      (rule :$ :$))
  ])

