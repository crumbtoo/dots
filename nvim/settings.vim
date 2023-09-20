syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab		" use \t to tab

set number          " show line numbers
set relativenumber  " show line numbers relative to cursor

set splitright      " open split on right

set timeoutlen=500

set textwidth=80

set formatoptions=jcrqlt " see: fo-table
au Filetype * set formatoptions=jcrqlt " override ftplugins

" prevents lsp from shifting screen
set signcolumn=yes

" override ftplugins for Hare
au Filetype *.ha set tabstop=4
au Filetype *.ha set et shiftwidth=4
au Filetype *.ha set et softtabstop=4
au Filetype *.ha set et noexpandtab

" set expandtab for more 'alignable' languages
autocmd BufEnter *.{hs,fnl,lhs,purs,cabal,y,elm} set expandtab

try
	colorscheme nordic
catch
	try
		colorscheme catppuccin-mocha
	catch
	endtry
endtry

