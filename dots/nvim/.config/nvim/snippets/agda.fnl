(local ls (require :luasnip))
(local t ls.text_node)
(local i ls.insert_node)
(local d ls.dynamic_node)
(local fmta (. (require :luasnip.extras.fmt) :fmta))
(import-macros {: s : s*} :lib.snippet-macros)

[(s :/step
    "  ≡⟨ ... ⟩"
    (fmta "  ≡⟨ <> ⟩\n?"
          [(i 1)]))
 (s :/begin
    "begin ≡⟨ ... ⟩"
    (fmta "begin\n  ?\n    ≡⟨ <> ⟩\n  ?\n  ∎"
          [(i 1)]))]

