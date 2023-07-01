"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nordic (colourscheme)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("nordic").setup
	{ theme = 'onedark'
	, telescope =
		{ style = 'flat'
		}
	, bold_keywords = false
	, italic_comments = true
	, transparent_bg = true
	, override =
		{ Hardline_mode_insert =
			{ bg = "#81a1c1"
			}
		, NvimTreeNormal =
			{ bg = "#0c1016"
			, fg = "#abb2bf"
			}
		, NvimTreeNormalNC =
			{ fg = "#abb2bf"
			, bg = "#0c1016"
			}
		, Normal =
			{ fg = "#d8dee9"
			}
		, Pmenu =
			{ fg = "#D8DEE9"
			, bg = "#2E3440"
			}
		, VertSplit =
			{ fg = "#2E3440"
			}
		} 
	, cursorline =
		{ bold = false
		, theme = 'light'
		, hide_unfocused = true
		}
	, noice =
		{ style = 'classic'
		}
	}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lualine (status line)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('lualine').setup
	{ options =
		{ icons_enabled = true
		, theme = 'auto'
		, component_separators = { left = '', right = ''}
		, section_separators = { left = '', right = ''}
		, disabled_filetypes =
			{ statusline = {}
			, winbar = {}
			}
		, ignore_focus = {}
		, always_divide_middle = true
		, globalstatus = false
		, refresh =
			{ statusline = 1000
			, tabline = 1000
			, winbar = 1000
			}
		}
	, sections =
		{ lualine_a = {'mode'}
		, lualine_b = {'branch', 'diff', 'diagnostics'}
		, lualine_c = {'filename'}
		, lualine_x = {'encoding', 'fileformat', 'filetype'}
		, lualine_y = {'progress'}
		, lualine_z = {'location'}
		}
	, inactive_sections =
		{ lualine_a = {}
		, lualine_b = {}
		, lualine_c = {'filename'}
		, lualine_x = {'location'}
		, lualine_y = {}
		, lualine_z = {}
		}
	, tabline = {}
	, winbar = {}
	, inactive_winbar = {}
	, extensions = {}
	}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => treesitter (parsers for syntax highlighting etc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require('nvim-treesitter.configs').setup
	{ ensure_installed = { "c", "lua", "haskell", "vim", "vimdoc" }
	, sync_install = true
	, auto_install = true
	, highlight =
		{ enable = true
		, additional_vim_regex_highlighting = false
		}
	}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => treesitter (parsers for syntax highlighting etc)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("nvim-surround").setup
	{
	}
EOF


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => toggleterm (togglable terminal windows)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("toggleterm").setup
	{ size = 10
	, shell = vim.o.shell
	, persist_size = false
	, terminal_mappings = true
	, start_in_insert = true
	}

local Terminal = require("toggleterm.terminal").Terminal

local sh = Terminal:new
	{ cmd = vim.o.shell
	, persist_size = false
	, direction = "horizontal"
	, on_create = bind_easy_escape
	}

local ghci = Terminal:new
	{ cmd = 'if [ -f "*.cabal" ]; then stack repl; else ghci; fi'
	, persist_size = false
	, direction = "horizontal"
	, id = 0
	, terminal_mappings = true
	, hidden = true
	}

local lazygit = Terminal:new
	{ cmd = "lazygit"
	, hidden = true
	, dir = "git_dir"
	, direction = "float"
	, float_opts =
		{ border = "curved"
		}
	-- praying this executes after the TempOpen autocmd event
	, on_create =
		function()
		vim.keymap.del("t", "jk", { buffer = true })
		vim.keymap.del("t", "kj", { buffer = true })
		end
	}

function _ghci_toggle()
	ghci:toggle()
end

function _sh_toggle()
	sh:toggle()
end

function _lazygit_toggle()
	lazygit:toggle()
end
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => startify (fancy start screen)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_lists =
	\ [ { 'type': 'dir',       'header': ['   MRU '. getcwd()] }
	\ , { 'type': 'files',     'header': ['   MRU']            }
	\ , { 'type': 'bookmarks', 'header': ['   Bookmarks']      }
	\ ]

let g:startify_bookmarks =
	\ [ {'v': '~/.config/nvim/init.vim'}
	\ , {'c': '~/.config/'}
	\ , {'s': '~/src/'}
	\ , {'t': '/tmp/'}
	\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => telescope (fuzzy finder)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
local telescope = require('telescope')
telescope.setup
	{
	}
telescope.load_extension('hoogle') -- telescope_hoogle
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => haskell-vim (haskell indentation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:haskell_indent_if = 0
" let g:haskell_indent_case = 4
" let g:haskell_indent_let = 4
" let g:haskell_indent_where = 6
" let g:haskell_indent_before_where = 0
" let g:haskell_indent_after_bare_where = 4
" let g:haskell_indent_in = 0
" let g:haskell_indent_guard = 4
" let g:cabal_indent_section = 4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-headerguard (auto headerguards)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! g:HeaderguardName()
    return toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g'))
endfunction

autocmd BufNewFile *.{h,hpp} :HeaderguardAdd | 3j

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-tree (file explorer)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
-- disable netrw (default file explorer included in vim)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup
	{ sort_by = "case_sensitive"
	, view =
		{ width = 30
		}
	, renderer =
		{ group_empty = true
		}
	, filters =
		{ dotfiles = true
		}
	, update_focused_file =
		{ update_root = true
		}
	, view =
		{ number = true
		, relativenumber = true
		}
	}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent-blankline (show levels of indentation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require("indent_blankline").setup
	{
	}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => leap (clairvoyant navigation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua require('leap').add_default_mappings()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nvim-window (nvim-tree style window navigation)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

