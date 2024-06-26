(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

(g! mapleader " ")
(g! maplocalleader "  ")

;;; unmaps
(vim.cmd "nunmap <C-w>d")
(vim.cmd "nunmap <C-w><C-D>")

;;; general

(map! [n :verbose] :<C-\> "/\\<\\><Left><Left>"
      "search \\<word\\>")

(map! [n] :<space> ::nohl<CR>
      "hide highlighted text")

;; escape
(map! [ci] :jk :<Esc>
      "escape")
(map! [ci] :kj :<Esc>
      "escape")
(map! [v] :JK :<Esc>
      "escape visual mode")
(map! [v] :KJ :<Esc>
      "escape visual mode")
; can i just use (map! [t] :jk :<C-\><C-n>)?
(augroup! :termesc
  [[TermOpen] term://* "tnoremap <buffer> jk <C-\\><C-n>"]
  [[TermOpen] term://* "tnoremap <buffer> kj <C-\\><C-n>"])

;;; ui

;; tabs
(map! [n] :<C-t>h
      ":tabp<CR>"
      "previous tab")
(map! [n] :<C-t>l
      ":tabn<CR>"
      "next tab")
(map! [n] :<C-t>t
      ":tabnew<CR>"
      "new tab")
(map! [n] :<C-t>x
      ":tabclose<CR>"
      "close tab")

;;; lsp
; (map! [nv :buffer] "<leader>ca"
;       vim.lsp.buf.code_action
;       "lsp code action")

(map! [n] "<leader>rn"
      #(vim.lsp.buf.rename)
      "lsp renamed symbol under cursor")

(map! [nv] "<leader>ca"
      (. (require :actions-preview) :code_actions)
      "lsp code action preview")

;; TODO put these in an LspAttach autocmd

(map! [n] :<leader>E
      vim.diagnostic.open_float
      "open diagnostic in float")
(map! [n] "]e"
      vim.diagnostic.goto_next
      "goto next diagnostic")
(map! [n] "[e"
      vim.diagnostic.goto_prev
      "goto prev diagnostic")

(map! [n] :gd
      #(vim.lsp.buf.definition)
      "go to definition (lsp)")
(map! [n] :gD
      #(vim.lsp.buf.declaration)
      "go to declaration (lsp)")

;; files
(map! [n :silent] :<leader>n
      ":NvimTreeToggle<CR>"
      "toggle nvim-tree")

(map! [n :silent] :<leader>ff
      ":Telescope find_files<CR>"
      "search files by name")

(map! [n] :<leader>lg
      ":Telescope live_grep<CR>"
      "search files by content (requires ripgrep)")

(map! [n] :<leader>?
      ":<C-U>Cheatsheet<CR>"
      "view cheatsheet in telescope")

(map! [n] :<localleader>?
      ":<C-U>Cheatsheet!<CR>"
      "edit cheatsheet")

;; toggleterm
(map! [n :silent] :<leader>t "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>"
      "toggle shell window")

(map! [n :silent] :<leader>G
      (let [term (. (require :toggleterm.terminal) :Terminal)
            lazygit (term:new { :cmd          "lazygit"
                                :hidden       true
                                :dir          :git_dir
                                :direction    :float
                                :float_opts   { :border :curved }
                                :on_create
                                  (fn []
                                    (vim.keymap.del :t :jk {:buffer 0})
                                    (vim.keymap.del :t :kj {:buffer 0}))
                              })]
        (fn [] (lazygit:toggle)))
      "toggle lazygit window")

;; iron.nvim
(map! [n] :<leader>rr
      :<cmd>IronRepl<CR>
      "toggle iron repl")
(map! [n] :<leader>R
      "<cmd>IronSend :r<CR>"
      "reload iron repl")
(map! [n] :<leader>rf
      "<cmd>IronFocus<CR>"
      "focus iron repl")
(map! [v] :<leader>sc
      (fn []
        (let [core (require :iron.core)]
          (do (core.send nil ":{")
              (core.visual_send)
              (core.send nil ":}"))))
      "send visual selection to repl")

;; telescope
(map! [n] :<leader>H
      ":Telescope hoogle<CR>"
      "search hoogle")

;;; language tools
(map! [n] :K
      #(vim.lsp.buf.hover)
      "lsp hover")

(map! [nx] :<leader>ssr
      #((. (require :ssr) :open))
      "open SSR")

;;; vim-fu

(fn with-current-line-num [f]
  (f (vim.fn.line ".")))

(fn with-current-line [f]
  (f (vim.fn.getline (vim.fn.line "."))))

(command! [] :Thing
          #(with-current-line
             (fn [line]
               (let [c (string.char (vim.fn.getchar))]
                 (print line c)))))

(map! [n] :<leader><C-i>
      (fn []
        (with-current-line-num
          (fn [ln]
            (vim.fn.append ln vim.b.rulestring)
            (vim.api.nvim_feedkeys :0j :n true))))
      "insert hrule comment")

(map! [x] :x ":<C-U>call cursor(line(\"'}\") - empty(getline(line(\"'}\"))),col(\"'>\"))<CR>`<1v``"
      "move to paragraph start")

;; nvim-window
(map! [n] :<leader>w
      (fn []
        ((. (require :nvim-window) :pick)))
      "view window options")

;; commentary
(map! [nxo] :#
      :<Plug>Commentary
      "comment <motion>")
(map! [n] :##
      :<Plug>CommentaryLine
      "comment current line")

(map! [nx] :ga
      "<Plug>(EasyAlign)"
      "start easy-align command")

;; vim-matchup
(map! [nxo] ")" "<Plug>(matchup-]%)"
      "move to paired delimiter")
(map! [nxo] "(" "<Plug>(matchup-[%)"
      "move to paired delimiter")

;; luasnip
(let [ls (require :luasnip)
      t  #(vim.api.nvim_feedkeys
            (vim.api.nvim_replace_termcodes $ true true true)
            :n
            false)]
     (map! [i] :<Tab>
           (fn []
             (if (ls.expand_or_locally_jumpable)
                 (ls.expand_or_jump)
                 (t :<Tab>)))
           "expand or jump to snippet")
     (map! [s] :<Tab>
           (fn []
             (if (ls.jumpable 1)
                 (ls.jump 1)
                 (t :<Tab>)))
           "jump to next snippet")
     (map! [si] :<S-Tab>
           (fn []
             (if (ls.jumpable -1)
                 (ls.jump -1)
                 (t :<S-Tab>)))
           "jump to previous snippet")
     (map! [si] :<C-n>
           (fn []
             (if (ls.choice_active)
                 (ls.change_choice 1)
                 (t :<C-n>)))
           "next choice")
     (map! [si :silent] :<C-S-n>
           (fn []
             (if (ls.choice_active)
                 (ls.change_choice -1)
                 (t :<C-S-n>)))
           "previous choice"))

;; leap.nvim
(map! [nx] :s
      "<Plug>(leap-forward)"
      "leap forward")
(map! [nx] :S
      "<Plug>(leap-backward)"
      "leap backward")
(map! [n] :gs
      "<Plug>(leap-from-window)"
      "leap into window")

