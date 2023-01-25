lua require('kwould.plugins')
lua require('kwould.mappings')
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

function! OpenInSourceGraph()
    let prefix = "https://sourcegraph.twitter.biz/"
    let full_filepath = expand('%:p')
    let repo = split(full_filepath, "/")[3]
    if repo == "config"
      let giturl = "config-git.twitter.biz/"
    else
      let giturl = "git.twitter.biz/"
    endif
    let filename = full_filepath[32:]
    let lineNumber = "\\#L" . line(".")
    let filler="/-/blob/"
    let url = prefix . giturl . repo . filler . filename . lineNumber
    silent exec "!open '" . url . "'"
endfunction

nnoremap <Leader>sgh :call OpenInSourceGraph()<CR>

lua require('dap-python').setup('/Users/kevincasado/personal/.venv/bin/activate')
autocmd FileType *.py set shiftwidth=2
