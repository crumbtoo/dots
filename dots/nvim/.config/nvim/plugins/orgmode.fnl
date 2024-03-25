(local org (require :orgmode))
(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(org.setup_ts_grammar)

(org.setup
  {:org_agenda_files "~/orgfiles/**/*"
   :org_default_notes_file "~/orgfiles/refile.org"
   :org_custom_exports {:f {:label "Export to HTML (Solarized Light)"
                            :action (fn [exp]
                                      )}}})

; (map! [n] :<Leader><CR>
;       #(org.action :org_mappings.meta_return)
;       "org meta return")

; (map! [n] :<Leader>oe
;       #(org.action :org_mappings.org_export)
;       "org export")

