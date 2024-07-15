(macro make-rulestring [n]
  (.. "(" (string.rep "*" (- n 2)) ")"))

(set vim.b.rulestring
  (make-rulestring 80))

