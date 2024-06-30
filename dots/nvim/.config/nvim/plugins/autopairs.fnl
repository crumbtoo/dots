(local npairs (require :nvim-autopairs))
(local rule (require :nvim-autopairs.rule))
(local ts-conds (require :nvim-autopairs.ts-conds))
(local utils (require :lib.utils))
(local families (require :lib.families))

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

; remove '`' rule on lisp
(-?> (npairs.get_rules "'")
     (tset 1 :not_filetypes (utils.concat families.lisps families.mls)))
(-?> (npairs.get_rules "`")
     (tset 1 :not_filetypes (utils.concat families.lisps families.mls)))

(npairs.add_rules
  [ (ft-rules [:tex :plaintex]
      (rule :$ :$))
  ])

