(local M {})

(fn M.concat [...]
  (accumulate [acc []
               _ t (ipairs [...])]
    (icollect [_ x (ipairs t) &into acc]
      x)))

M

