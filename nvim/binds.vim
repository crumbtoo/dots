let g:mapleader = " "

nmap <silent> <space> :nohl<CR>

" toggle term
nnoremap <silent> <leader>t <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent> <leader>G :lua _lazygit_toggle()<CR>
nmap <silent> <leader>rr :lua _ghci_toggle()<CR>


" telescope hoogle
nmap <silent> !h :Telescope hoogle<CR>

" gif (fugitive)
nmap <leader>gs :Git<CR>

" nvim-tree
nmap <silent> <leader>n :NvimTreeToggle<CR>

" insert rule
nmap <silent> <C-i> o80i-0

" nvim-window
map <silent> <leader>w :lua require('nvim-window').pick()<CR>

" easyescape
inoremap jk <Esc>
inoremap kj <Esc>

augroup termescape
	autocmd TermOpen term://* tnoremap <buffer> jk <C-\><C-n>
	autocmd TermOpen term://* tnoremap <buffer> kj <C-\><C-n>
augroup END

cnoremap jk <Esc>
cnoremap kj <Esc>

