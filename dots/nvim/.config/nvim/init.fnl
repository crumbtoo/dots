(let [lazy (require :lazy)
      target (.. (vim.fn.stdpath :data) :/luatarget)
      target/after (.. target :/after)]
  (lazy.setup
    (require :plugins)
    {:performance {:reset_packpath false}
     :rtp {:paths [target target/after]}
     :dev {:path "~/git"
           :patterns []
           :fallback true}
     :git {:timeout math.huge}}))

;; TODO: include seems to slow down opening nvim, but avoids the issues with
;; require
; (include :binds)
; (include :settings)
(require :binds)
(require :settings)

(comment (let [p (require :nvim-treesitter.configs)]
  (p.setup
    {:ensure_installed [(comment :haskell :fennel)]
     :highlight {:enable true}})))

