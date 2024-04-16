(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(local leap (require :leap))

(set leap.opts.equivalence_classes
     [" \t\r\n"
      "≡≣≟≐≔"
      "<⟨"
      ">⟩"
      "[⟦"
      "]⟧"
      "Nℕ"
      "Zℤ"
      "-∸"
      ".∙"
      "x×"
      "1₁¹"
      "2₂²"
      "3₃³"
      "4₄⁴"
      "5₅⁵"
      "6₆⁶"
      "7₇⁷"
      "8₈⁸"
      "9₉⁹"
      "0₀⁰"
      "=≡≣≟≐≔"])

