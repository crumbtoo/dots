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
  :udayvir-singh/hibiscus.nvim

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
        :config (require :plugins.nvim-tree))
  (opts :lukas-reineke/indent-blankline.nvim
        :main :ibl
        :opts { :scope {:enabled false}})
  (opts :nvim-telescope/telescope.nvim
        :main :telescope)
  :liuchengxu/vim-which-key
  ; (opts :crumbtoo/nvim-window-mode
  ;       :dev true
  ;       :main :nfnl-plugin-example
  ;       :opts {})
  ; :mbbill/undotree

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
  ;; haskell
  (opts :luc-tielen/telescope_hoogle
        :dependencies [ :nvim-telescope/telescope.nvim ]
        :config #((. (require :telescope) :load_extension) :hoogle))
  (opts :MrcJkb/haskell-tools.nvim)
  ;; lisp
  (opts :clojure-vim/vim-jack-in
        :filetype :clojure)
  (opts :radenling/vim-dispatch-neovim
        :filetype :clojure)
  ; (opts :eraserhd/parinfer-rust
  ;       :build "cargo build --release")
  (opts :guns/vim-sexp
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
  :Olical/nfnl
  (opts :michaelb/sniprun
        :build "sh install.sh")
  ;; agda
  (opts :isovector/cornelis
        :dependencies [:kana/vim-textobj-user
                       :neovimhaskell/nvim-hs.vim]
        :filetype :agda
        :build "stack build"
        :config #(require :plugins.cornelis))
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
        :opts
          { :link_roots false
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


