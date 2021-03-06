" Indentation
filetype plugin indent on
set autoindent
set ts=2
set shiftwidth=2
set expandtab

" allow changing buffers without saving
set confirm

" Max Width
set textwidth=0

" No wrapping except onmarkdown and html
set nowrap
autocmd FileType markdown setlocal wrap
autocmd FileType html setlocal wrap

" Make backspace usable
set backspace=indent,eol,start

" Show matching brackets
set showmatch

" Searching
set ignorecase
set hlsearch
set incsearch

" Smartcaps
set smartcase

" Statusbar
set ruler
set laststatus=2
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]

" autoread
set autoread
au CursorHold * checktime

" Scrolling
set scrolloff=2
set mouse=a

" No Backup
set nobackup
set nowb
set noswapfile

" Line numbers
set number

" Persistent undo
set undodir=$HOME/.vim/undo
set undofile

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Always use vertical diffs
set diffopt+=vertical

" Italics support
set t_ZH=^[[3m
set t_ZR=^[[23m

" Command livepreview for nvim
if has('nvim')
  set inccommand=nosplit
endif

