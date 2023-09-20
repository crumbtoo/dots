let g:mapleader = " "
let g:maplocalleader = "  "

nmap <silent> <space> :nohl<CR>

" toggle term
nnoremap <silent> <leader>t <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent> <leader>G :lua _lazygit_toggle()<CR>
nnoremap <silent> <leader>rr :lua _ghci_toggle()<CR>
nnoremap <silent> <leader>R :lua _ghci_reload()<CR>

" telescope hoogle
nnoremap <silent> !h :Telescope hoogle<CR>

" gif (fugitive)
nnoremap <leader>gs :Git<CR>

" nvim-tree
nnoremap <silent> <leader>n :NvimTreeToggle<CR>

" insert rule
nnoremap <silent> <C-i> o80i-0

" nvim-window
nnoremap <silent> <leader>w :lua require('nvim-window').pick()<CR>

" easyescape
inoremap jk <Esc>
inoremap kj <Esc>

augroup termescape
	autocmd TermOpen term://* tnoremap <buffer> jk <C-\><C-n>
	autocmd TermOpen term://* tnoremap <buffer> kj <C-\><C-n>
augroup END

cnoremap jk <Esc>
cnoremap kj <Esc>

