lua require('kwould')
lua require('kwould.autocmd')
lua require("kwould.plugins")
lua require('kwould.lsp')
lua require('kwould.treesitter')
lua require('kwould.telescope')
let mapleader = " "
" Buffers
set hidden
set autoread
set noswapfile

" Search
set ignorecase
set smartcase
set showmatch
set hlsearch

" Windows
set colorcolumn=100
set scrolloff=5
set sidescrolloff=3
set diffopt+=vertical

" Tabs and whitespace
" set textwidth=80
set list
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Mouse
set mouse=a  " mouse support in terminals

" Lines
set relativenumber

" Colorscheme options.
set bg=dark
colorscheme gruvbox
set completeopt=menu,menuone,noselect

" remaps for moving across windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

nnoremap <Leader>sv :source $MYVIMRC<CR>
" lua require('dap-python').setup('$HOME/workspace/.venv/bin/activate')
autocmd FileType *.py set shiftwidth=2
