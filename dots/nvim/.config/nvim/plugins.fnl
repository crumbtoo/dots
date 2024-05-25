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
        :dev true)

  ;;; themes / ui
  :rebelot/kanagawa.nvim
  (opts :nvim-lualine/lualine.nvim
        :config (require :plugins.lualine))
  (opts :startup-nvim/startup.nvim
        :priority 100
        :config (require :plugins.startup-nvim)
        :dependencies [ :nvim-telescope/telescope.nvim
                        :nvim-lua/plenary.nvim ])
  :https://gitlab.com/yorickpeterse/nvim-window.git
  (opts :akinsho/toggleterm.nvim
        :config (require :plugins.toggleterm))
  (opts :nvim-tree/nvim-tree.lua
        :config #(require :plugins.nvim-tree))
  (opts :lukas-reineke/indent-blankline.nvim
        :main :ibl
        :opts { :scope {:enabled false}})
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
  (opts :nvim-treesitter/nvim-treesitter
        :config #(require :plugins.treesitter))
  :nvim-treesitter/playground
  (opts :jaawerth/fennel.vim)
  (opts :Vigemus/iron.nvim
        :config #(require :plugins.iron))
  (opts :sudormrfbin/cheatsheet.nvim
        :main :cheatsheet
        :opts (require :plugins.cheatsheet))
  (opts :junegunn/vim-easy-align
        :config #(require :plugins.easy-align))
  (opts :lervag/vimtex
        :config #(require :plugins.vimtex))
  (opts :nvim-treesitter/nvim-treesitter-textobjects
        :dependencies [ :nvim-treesitter/nvim-treesitter])
  (opts :crumbtoo/diagflow.nvim ; :dgagn/diagflow.nvim
        :event :LspAttach
        :opts (require :plugins.diagflow))
  ;; typst
  (opts :kaarmu/typst.vim
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
  ;; lisp
  (opts :clojure-vim/vim-jack-in
        :filetype :clojure)
  (opts :radenling/vim-dispatch-neovim
        :filetype :clojure)
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
                (g! conjure#client#scheme#stdio#command "csi -quiet -:c")
                (g! conjure#client#scheme#stdio#prompt_pattern "\n-#;%d-> ")))
  (opts :kovisoft/slimv
        :config #(require :plugins.slimv)
        :lazy false
        ; load before nvim-autopairs
        :priority 60)
  (opts :Olical/nfnl
        :ft :fennel)
  (opts :michaelb/sniprun
        :build "sh install.sh")
  :aznhe21/actions-preview.nvim
  :neovim/nvim-lspconfig
  ;; agda
  (opts :isovector/cornelis
        :dependencies [:kana/vim-textobj-user
                       :neovimhaskell/nvim-hs.vim]
        :filetype :agda
        :build "stack build"
        :config #(require :plugins.cornelis))
  ;; idris 2
  (opts :SlayerOfTheBad/idris2-nvim
        :filetype :idris2
        :dependencies [:neovim/nvim-lspconfig
                       :MunifTanjim/nui.nvim]
        :main :idris2
        :opts {:code_action_post_hook #(exec! [silent write])}
        :config true)
  ;; markdown
  ; (opts :iamcco/markdown-preview.nvim
  ;       :cmd [:MarkdownPreviewToggle :MarkdownPreview :MarkdownPreviewStop]
  ;       :ft [:markdown]
  ;       :build #((. vim.fn :mkdp#util#install))
  ;       :init (fn []
  ;               (g! mkdp_refresh_slow 1)))

  ;;; vim-fu
  (opts :windwp/nvim-autopairs
        :config #(require :plugins.autopairs))
  (opts :nvim-orgmode/orgmode
        :config #(require :plugins.orgmode)
        :dependencies [:nvim-treesitter/nvim-treesitter])
  ;; re-enable once the TS fix is merged
  ; :andymass/vim-matchup
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
              (ls.load { :paths data}))))
  ;;; misc
  :tpope/vim-fugitive
  :dbakker/vim-paragraph-motion
  :tpope/vim-repeat
  (opts :vhyrro/luarocks.nvim
        :priority 1000
        :config true
        :opts {:rocks [:luautf8 ; required for nvim-agda
                      ]
              })
]


