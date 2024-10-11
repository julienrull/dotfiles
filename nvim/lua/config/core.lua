-- Set leader key
vim.cmd("let mapleader = \" \"")
-- enable color themes
vim.cmd("set t_Co=256")
-- Vim colorscheme
vim.o.background = "dark" -- or "light" for light mode
-- enable true colors support
vim.cmd("set termguicolors")
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


-- Plugin settings 
-- vim airline
--vim.cmd("let g:airline_theme='simple'")
-- Buffers
vim.cmd("map <leader>n :bnext<cr>")
vim.cmd("map <leader>p :bprevious<cr>")
vim.cmd("map <leader>d :bdelete<cr>")
-- Telescope
vim.cmd("nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>")
vim.cmd("nnoremap <leader>fg <cmd>Telescope live_grep<cr>")
vim.cmd("nnoremap <leader>fb <cmd>Telescope buffers<cr>")
vim.cmd("nnoremap <leader>fh <cmd>Telescope help_tags<cr>")
-- CONFIG BASE
-- enable mouse support
vim.cmd("set mouse=a")

-- set cursor as block
vim.cmd("set guicursor=n-v-c:block-Cursor")

-- enable syntax
vim.cmd("syntax on")

-- enable line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

-- highlight current line
vim.cmd("set cursorline") 
vim.cmd(":highlight Cursorline cterm=bold ctermbg=black")

-- enable highlight search pattern
vim.cmd("set hlsearch")

-- enable smartcase search sensitivity
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

-- Indentation using spaces 
-- tabstop:	width of tab character
-- softtabstop:	fine tunes the amount of whitespace to be added
-- shiftwidth:	determines the amount of whitespace to add in normal mode
-- expandtab:	when on use space instead of tab
-- textwidth:	text wrap width
-- autoindent:	autoindent in new line
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set textwidth=79")
vim.cmd("set expandtab")
vim.cmd("set autoindent")

-- show the matching part of pairs [] {} and () "
vim.cmd("set showmatch")
