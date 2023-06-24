let g:mapleader = " "

nmap <silent> <space> :nohl<CR>

" toggle term
nnoremap <silent> <c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
nnoremap <silent> <leader>G :lua _lazygit_toggle()<CR>
nmap <silent> <leader>rr :lua _ghci_toggle()<CR>


" telescope hoogle
nmap <silent> !h :Telescope hoogle<CR>

" gif (fugitive)
nmap <leader>gs :Git<CR>

" nvim-tree
nmap <silent> <C-n> :NvimTreeToggle<CR>

" insert rule
nmap <silent> <C-i> O<ESC>80i-<ESC>

" nvim-window
map <silent> <leader>w :lua require('nvim-window').pick()<CR>

