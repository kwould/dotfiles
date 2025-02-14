vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt_global.shortmess:remove("F")
require("kwould.autocmd")
require("kwould.lazy")
require("kwould.treesitter")
require("kwould.telescope")
vim.g.mapleader = " "
-- " Buffers
vim.g.autoread = true
vim.g.hidden = true
vim.g.no_swapfile = true

-- " Search
-- set ignorecase
-- set smartcase
-- set showmatch
-- set hlsearch
vim.g.ignorecase = true
vim.g.smartcase = true
vim.g.showmatch = true
vim.g.hlsearch = true
-- " Windows
-- set colorcolumn=100
-- set scrolloff=5
-- set sidescrolloff=3
-- set diffopt+=vertical
vim.g.colorcolumn = 100
vim.g.scrolloff = 5
vim.g.sidescrolloff = 3
-- vim.g.diffopt = vim.g.diffopt .. ",vertical"
-- " Tabs and whitespace
-- " set textwidth=80
-- set list
-- set tabstop=2
-- set softtabstop=2
-- set shiftwidth=2
-- set expandtab

vim.g.setlist = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- " Mouse
-- set mouse=a  " mouse support in terminals
vim.g.mouse = "a"
-- " Lines
-- set relativenumber
vim.opt.relativenumber = true
-- " Colorscheme options.
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])
-- set bg=dark
-- colorscheme gruvbox
-- set completeopt=menu,menuone,noselect
vim.g.completeopt = "menu,menuone,noselect"

-- " remaps for moving across windows
-- nnoremap <leader>h <C-w>h
-- nnoremap <leader>j <C-w>j
-- nnoremap <leader>k <C-w>k
-- nnoremap <leader>l <C-w>l
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
-- nnoremap <Leader>sv :source $MYVIMRC<CR>
vim.keymap.set("n", "<leader>sv", ":source $MYVIMRC<CR>")
-- lua require('dap-python').setup('$HOME/workspace/.venv/bin/activate')
-- autocmd FileType *.py set shiftwidth=2
