call plug#begin('~/crumb/.config/nvim/plugins')

Plug 'AlexvZyl/nordic.nvim'								        " colourscheme
Plug 'mhinz/vim-startify'									    " start screen
Plug 'tpope/vim-commentary'									    " better commenting
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }   " parsers
Plug 'jiangmiao/auto-pairs'										" auto pair brackets
Plug 'nvim-lualine/lualine.nvim'							    " status line
Plug 'editorconfig/editorconfig-vim'						    " local configs using .editorconfig file
Plug 'kylechui/nvim-surround'								    " add/change/delete surrounding delimiter pairs
Plug 'akinsho/toggleterm.nvim', { 'tag' : '*' }				    " terminal windows
Plug 'tpope/vim-fugitive'									    " git wrapper
Plug 'nvim-lua/plenary.nvim'								    " dep for telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }	    " fuzzy finder; dep for many plugins
Plug 'luc-tielen/telescope_hoogle'							    " hoogle api search
" Plug 'neovimhaskell/haskell-vim'							    " haskell indentation
Plug 'drmikehenry/vim-headerguard'							    " auto add headerguards in C/C++
Plug 'nvim-tree/nvim-tree.lua'								    " file explorer
Plug 'lukas-reineke/indent-blankline.nvim'						" rule lines to show levels of indentation
Plug 'purescript-contrib/purescript-vim'						" purescript highlighting and indentation
Plug 'git@github.com:ggandor/leap.nvim.git'						" clairvoyant navigation
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'			" nvim-tree style window navigation

call plug#end()

filetype on
filetype plugin indent on

runtime plugconfs.vim
runtime settings.vim
runtime binds.vim

