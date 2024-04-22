(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(local gx (require :gx))

(local open-cmd
  (case (. (vim.loop.os_uname) :sysname)
    "Darwin" "open"
    "Linux"  "xdg-open"
    _        (error "aaah!")))

(gx.setup
  {:handler_options {:search_engine "duckduckgo"
                     :select_for_search false}
   :handlers {:brewfile true
              :github true
              :package_json true
              :plugin true
              :search true}
   :open_browser_app open-cmd})

(map! [nx] :gx
      "<cmd>Browse<cr>"
      "open url")

