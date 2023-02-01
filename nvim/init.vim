lua require('kwould.plugins')
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

function! OpenInGH()
    let prefix = "https://github.com/"
    let full_filepath = expand('%:p')
    let repo = split(full_filepath, "/")[3]
    let filename = join(split(full_filepath, "/")[4:], "/")
    let lineNumber = "\\#L" . line(".")
		let gitBranch = trim(system("git rev-parse --abbrev-ref HEAD"))
    let filler = "/blob/"
		let configurl = $WORK_GH_URL
    let url = prefix . configurl ."/". repo . filler . gitBranch . "/" . filename . lineNumber
		echo url
    silent exec "!open '" . url . "'"
endfunction

nnoremap <Leader>sgh :call OpenInGH()<CR>

lua require('dap-python').setup('$HOME/workspace/.venv/bin/activate')
autocmd FileType *.py set shiftwidth=2
