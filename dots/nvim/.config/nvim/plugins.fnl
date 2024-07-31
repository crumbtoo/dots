(require-macros :hibiscus.vim)
(require-macros :hibiscus.core)

(macro sparse [...]
  (let [args [...]
        t {}]
    (var j 0)
    (each [i x (ipairs args) :until (= x '&)]
      (set j i)
      (table.insert t x))
    (for [i (+ j 2) (length args) 2]
      (tset t (. args i) (. args (+ i 1))))
    t))

(macro opts [subject ...]
  `(sparse ,subject & ,...))

(macro with-plug [[binder plugin] & body]
   `(fn []
      (let [,binder (require ,plugin)]
        ,(unpack body))))

[ :udayvir-singh/tangerine.nvim ; fennel
  (opts :udayvir-singh/hibiscus.nvim
        ; until `(setlocal! ...)` is added upstream
        :dev true)

  ;;; themes / ui
  :rebelot/kanagawa.nvim
  (opts :nvim-lualine/lualine.nvim
        :config (require :plugins.lualine))
  (opts :startup-nvim/startup.nvim
        :priority 100
        :config (require :plugins.startup-nvim)
        :dependencies [:nvim-telescope/telescope.nvim
                       :nvim-lua/plenary.nvim])
  :https://gitlab.com/yorickpeterse/nvim-window.git
  (opts :akinsho/toggleterm.nvim
        :config (require :plugins.toggleterm))
  (opts :nvim-tree/nvim-tree.lua
        :config #(require :plugins.nvim-tree))
  (opts :lukas-reineke/indent-blankline.nvim
        :main :ibl
        :opts {:scope {:enabled false}})
  (opts :nvim-telescope/telescope.nvim
        :main :telescope)
  :liuchengxu/vim-which-key
  ; (opts :crumbtoo/ft-equiv
  ;       :dev true
  ;       :main :ft-equiv
  ;       :opts {})
  ; (opts :crumbtoo/nvim-window-mode
  ;       :dev true
  ;       :main :nfnl-plugin-example
  ;       :opts {})
  ; :mbbill/undotree
  ; (opts :chrishrb/gx.nvim
  ;       :config #(require :plugins/gx)
  ;       :init #(g! netrw_nogx 1)
  ;       :dependencies [:nvim-lua/plenary.nvim])

  ;;; language tools
  :sbdchd/neoformat
  (opts :nvim-treesitter/nvim-treesitter
        :config #(require :plugins.treesitter))
  :nvim-treesitter/playground
  (opts :jaawerth/fennel.vim
        :lazy true
        :ft :fennel)
  (opts :Vigemus/iron.nvim
        :config #(require :plugins.iron))
  (opts :sudormrfbin/cheatsheet.nvim
        :main :cheatsheet
        :opts (require :plugins.cheatsheet))
  (opts :junegunn/vim-easy-align
        :config #(require :plugins.easy-align))
  (opts :lervag/vimtex
        :lazy true
        :ft [:tex :latex]
        :config #(require :plugins.vimtex))
  (opts :nvim-treesitter/nvim-treesitter-textobjects
        :dependencies [ :nvim-treesitter/nvim-treesitter])
  (opts :crumbtoo/diagflow.nvim ; :dgagn/diagflow.nvim
        :event :LspAttach
        :opts (require :plugins.diagflow))
  ;; dale
  ; (opts :crumbtoo/dale.vim
  ;       :dev true)
  ;; mercury
  (opts :Mercury-Language/mercury
        :dir :/Users/crumble/git/mercury-srcdist-22.01.8/vim
        :ft :mercury)
  ;; typst
  (opts :kaarmu/typst.vim
        :lazy true
        :ft :typst
        :config #(do (g! typst_conceal 1)
                     (g! typst_conceal_math 1)
                     (g! typst_conceal_emoji 1)
                     (g! typst_auto_close_toc 1)
                     (g! typst_embedded_languages [:haskell :scheme])
                     (g! typst_pdf_viewer :sioyek)
                     ; use treesitter
                     (g! typst_syntax_highlight 1)))
  ;; haskell
  (opts :luc-tielen/telescope_hoogle
        :dependencies [ :nvim-telescope/telescope.nvim ]
        :config #((. (require :telescope) :load_extension) :hoogle))
  (opts :MrcJkb/haskell-tools.nvim
        :config #(require :haskell-tools))
  :mrcjkb/haskell-snippets.nvim
  :itchyny/vim-haskell-indent
  ;; lisp
  (opts :clojure-vim/vim-jack-in
        :ft :clojure)
  (opts :radenling/vim-dispatch-neovim
        :ft :clojure)
  ; (opts :eraserhd/parinfer-rust
  ;       :build "cargo build --release")
  (opts :guns/vim-sexp
        ; load after treesitter
        :priority 40
        :init #(g! sexp_filetypes "")
        :config #(require :plugins.vim-sexp))
  (opts :Olical/conjure
        :init (fn []
                (g! conjure#mapping#prefix "'")
                ; (g! conjure#filetype#haskell :conjure.client.haskell.stdio)
                (g! conjure#client#clojure#nrepl#connection#port_files
                    [".shadow-cljs/nrepl.port" ".nrepl-port"])
                (g! conjure#filetype#scheme "conjure.client.guile.socket")
                (g! conjure#client#guile#socket#pipename
                    "/tmp/guile-repl.socket")))
  (opts :Olical/nfnl
        :ft :fennel)
  :aznhe21/actions-preview.nvim
  (opts :neovim/nvim-lspconfig
        :config #(require :plugins.lspconfig))
  ;; agda
  (opts :Julian/lean.nvim
        :event ["BufReadPre *.lean" "BufNewFile *.lean"]
        :dependencies [:neovim/nvim-lspconfig
                       :nvim-lua/plenary.nvim]
        :opts {:lsp {}
               :mappings true})
  (opts :isovector/cornelis
        :dependencies [:kana/vim-textobj-user
                       :neovimhaskell/nvim-hs.vim]
        :ft :agda
        :build "stack build"
        :config #(require :plugins.cornelis))
  ;; idris 2
  (opts :SlayerOfTheBad/idris2-nvim ; why am i using this fork???
        :dependencies [:neovim/nvim-lspconfig
                       :MunifTanjim/nui.nvim]
        :dev true
        ; :lazy true
        ; :ft [:idris2 :ipkg]
        :main :idris2
        :opts {:code_action_post_hook #(exec! [silent write])}
        :config true)
  (opts :crumbtoo/idris2-snippets.nvim
        :dev true)

  ;;; vim-fu
  (opts :windwp/nvim-autopairs
        :config #(require :plugins.autopairs))
  (opts :nvim-orgmode/orgmode
        :config #(require :plugins.orgmode)
        :dependencies [:nvim-treesitter/nvim-treesitter])
  :andymass/vim-matchup
  (opts :ggandor/leap-spooky.nvim
        :main :leap-spooky
        :config true
        :opts {:extra_text_objects [:if :af]})
  (opts :ggandor/leap.nvim
        :config #(require :plugins.leap))
  (opts :kylechui/nvim-surround
        :config true)
  :tpope/vim-commentary
  (opts :L3MON4D3/LuaSnip
        ; :build "make install_jsregexp"
        :opts {:link_roots false
               :keep_roots false}
        :version :v2.2
        :config
          (fn []
            (let [ls (require :luasnip.loaders.from_lua)
                  data (.. (vim.fn.stdpath :data) :/luatarget/snippets)]
              (ls.load {:paths data}))))
  ;;; misc
  :dbakker/vim-paragraph-motion ; paragraph motion includes lines of whitespace
  :tpope/vim-repeat
  :tpope/vim-fugitive ; mergetool
  "https://git.sr.ht/~vigoux/architext.nvim"
]

