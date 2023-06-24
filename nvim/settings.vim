syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab		" use \t to tab

set number          " show line numbers
set relativenumber  " show line numbers relative to cursor

set splitright      " open split on right

set timeoutlen=500

" set expandtab for files that don't play nice with tabs
autocmd BufEnter *.{hs,fnl,lhs,purs,cabal,y,elm} set expandtab

try
	colorscheme nordic
catch
	try
		colorscheme catppuccin-mocha
	catch
	endtry
endtry

