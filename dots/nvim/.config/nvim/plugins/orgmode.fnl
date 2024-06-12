(local org (require :orgmode))
(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(macro with-source/target [[source target] ...]
  `(let [,source (vim.api.nvim_buf_get_name 0)
         ,target (vim.fn.fnamemodify source ":p:r")]
     ,...))

(fn export-solarized-html [embed-resources?]
  {:label (.. "Export to HTML (Solarized Light)"
              (if embed-resources?
                  " (Embed resources)"
                  ""))
   :action
   (fn [exp]
     (with-source/target [source target]
       (let [target^ (.. target ".html")
             cmd [:pandoc source
                  "--from" "org"
                  "--standalone"
                  "--css" (vim.fn.fnamemodify
                            "~/.config/nvim/lib/solarized-light.css"
                            ":p")
                  "-o" target^]]
         (when embed-resources?
           (table.insert cmd "--embed-resources"))
         (exp cmd target^))))})

(local capture-project-idea
  {:description "Project idea"
   :template "* %^{Title? }"
   :target "~/orgfiles/project-ideas.org"})

(org.setup
  {:org_agenda_files ["~/orgfiles/**/*" "./README.org"]
   :org_default_notes_file "~/orgfiles/todo.org"
   :org_custom_exports {:f (export-solarized-html false)
                        :F (export-solarized-html true)}
   :org_capture_templates {:r capture-project-idea}
   :mappings {:org {:org_previous_visible_heading false
                    :org_next_visible_heading false
                    :org_do_demote false
                    :org_do_promote false}}})

(fn feed-keys [s]
  (vim.api.nvim_feedkeys
    (vim.api.nvim_replace_termcodes s true true true)
    :n
    false))

(fn node-type-at-cursor []
  (: (vim.treesitter.get_node) :type))

;; these binds use org mode's >> when the cursor is over a headline, and the
;; normal >> otherwise

(augroup! "org-mode-binds"
  [[FileType] ["org"]
   `(do (map! [n :buffer] :>>
              #(match (node-type-at-cursor)
                 "stars" (org.action :org_mappings.do_demote)
                 _ (feed-keys ">>"))
              "indent or demote headline")
        (map! [n :buffer] :<<
              #(match (node-type-at-cursor)
                 "stars" (org.action :org_mappings.do_promote)
                 _ (feed-keys "<<"))
              "dedent or promote headline"))])

; (map! [n] :<Leader><CR>
;       #(org.action :org_mappings.meta_return)
;       "org meta return")

; (map! [n] :<Leader>oe
;       #(org.action :org_mappings.org_export)
;       "org export")

