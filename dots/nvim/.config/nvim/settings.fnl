(require-macros :hibiscus.core)
(require-macros :hibiscus.vim)

;------------------------------------------------------------------------------;
; ui

;; when tab-completing, first complete the longest common match, then list other
;; matches before cycling through them.
(set! wildmode "longest,list,full")

(set! splitright)

;; disable netrw in favour of nvim-tree
(set vim.g.loaded_netrw 1)
(set vim.g.loaded_netrwPlugin 1)

;; search case-insensitive, unless any capital letters are in the search
;; pattern. remember that patterns may use \c and \C to match case-sensitive or
;; case-insensitive, respectively.
(set! smartcase)
(set! ignorecase)

;; line numbers
(set! number)
(set! relativenumber)
(set! signcolumn :yes)

;; enable text concealing
(set! conceallevel 1)
;; conceal text even when the cursor is over its line
(set! concealcursor "nc")

;; colours
(color! :kanagawa)

;; allow the cursor to move one character past EOL. useful for commands
;; including `b` or `B`.
(set! virtualedit :onemore)

;------------------------------------------------------------------------------;
; formatting

;; indentation
(set! autoindent)
(set! smartindent)

;; whitespace
(set! tabstop 4)
(set! shiftwidth 4)
(set! softtabstop 4)
(set! expandtab)

;; formatting
(set! textwidth 80)
(set! formatoptions :jcrqlt) ; see: :h fo-table
(augroup! :ftpluginsFormatOverride
  [[Filetype] * "set formatoptions=jcrqlt"])

;------------------------------------------------------------------------------;

;; filetype
(exec!
  [filetype on]
  [filetype plugin indent on]
  [syntax on]
  [syntax enable])

;------------------------------------------------------------------------------;
; control
(set! timeoutlen 500) ; timeout multi-key commands after 500ms

;------------------------------------------------------------------------------;
; abbreviations

(exec!
  ; open help windows in a vertical split
  [cabbrev h vert bo h])

(command! [:range true] :CopyAsCodeBlock
  (fn [opts]
    (let [lines (table.concat
                  (vim.api.nvim_buf_get_lines
                    0 (- opts.line1 1) opts.line2 false)
                  "\n")]
      (print opts.reg)
      (vim.fn.setreg "+"
                     (.. "```" (or vim.o.filetype "") "\n"
                         lines
                         "\n```")))))

(fn edit-and-cd [file]
  (exec! [edit `file]
         [lcd `(vim.fs.dirname file)]))

(command! [:nargs 1] :EditAndCD
  (fn [o]
    (edit-and-cd (. o.fargs 1))))

(command! [] :EditVimrc
  (fn [_]
    (edit-and-cd "~/.config/nvim/init.fnl")))

;------------------------------------------------------------------------------;
; filetypes

;; TODO: pr to (neo)vim for this
(vim.filetype.add
  {:extension {:wat "wat"
               ;; prefer typst over sql
               :typ "typst"}})

;; i'd prefer this to be in after/ftplugin/agda.fnl, but for
;; unknown reasons, it does not work there. :D
(augroup! :agda-refine-lagda
  [[BufRead BufNewFile] *.lagda.org `(setlocal! ft "agda.org")])

;; ditto.
(vim.treesitter.language.register :org :agda.org)

