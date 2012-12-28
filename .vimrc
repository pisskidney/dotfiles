" Author - Peter Horvath
" https://github.com/pisskidney/dotfiles
" Dependencies - pep8, pyflakes, tagbar, nerd-tree
set tags=~/tags

set nocompatible              " Don't be compatible with vi
let mapleader=","             " Change the leader to be a comma vs slash

" Reload .vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 " Show hidden files
let g:NERDTreeWinSize=20 " NerdTree width

" Open Tagbar
map <leader>t :TagbarToggle<CR>
let g:tagbar_width=20 " Tagbar width

" Toggle paste mode
map <leader>p :set paste!<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" Save on <leader>w or :W
nnoremap <leader>w :w<CR>
command! W :w

" Correct my typos
command! Q :q
command! Wq :wq
command! WQ :wq

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Load pathogen with docs for all plugins
filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#infect()
call pathogen#helptags()

" Basic settings
syntax on                     " Syntax highlighing
filetype on                   " Try to detect filetypes
filetype plugin indent on     " Enable loading indent file for filetype
set t_Co=256                  " Support for 256 color terminal
set number                    " Display line numbers
set numberwidth=1             " Using only 1 column (and 1 space) if possible
set background=dark           " We are using dark background
set title                     " Show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc,*swp,eggs/**,*.egg-info/**,*.un~

" Insert completion - don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=6             " Keep a small completion window

" Moving Around/Editing
set encoding=utf-8          " Set encoding to UTF-8
set cursorline              " Have a line indicate the cursor location
set ruler                   " Show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set nowrap                  " Don't wrap text
set linebreak               " Don't wrap textin the middle of a word
set autoindent              " Always set autoindenting on
set smartindent             " Use smart indent if there is no indent file
set tabstop=8               " <Tab> inserts 4 spaces
set shiftwidth=4            " Indent level is 4 spaces wide
set softtabstop=4           " <BS> over an autoindent deletes both spaces
set smarttab                " Handle tabs more intelligently
set expandtab               " Use spaces, not tabs, for autoindent/tab key
set shiftround              " Rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " Show matching <> (html mainly) as well
set foldmethod=indent       " Allow us to fold on indents
set foldlevel=99            " Don't fold by default
set colorcolumn=79          " Color column to mark the end 80 char limit

" Creates undo files (*.un~) for undoes after close/open file (vim 7.3)
"set undofile

" Reading/Writing
set noautowrite             " Never write a file unless I request it
set noautowriteall          " NEVER
set noautoread              " Don't automatically re-read changed files
set nomodeline              " Disallow vim options to be embedded in files
set modelines=0             " Same as above
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings

" Messages, Info, Status
set ls=2                    " Allways show status line
set noerrorbells
set novisualbell
set vb t_vb=                " Disable all bells, blinks and whatnot
set confirm                 " Y-N-C prompt if closing with unsaved changes
set showcmd                 " Show incomplete normal mode commands as I type
set report=0                " : commands always print changed line count
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written
set ruler                   " Show some info, even without statuslines
set laststatus=2            " Always show statusline, even if only 1 window
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" Displays tabs with :set list & displays when a line runs off-screen
"set listchars=tab:>-,eol:‖,trail:»,precedes:<,extends:>
"set list

" Searching and Patterns
nnoremap / /\v
vnoremap / /\v
set ignorecase              " Default to using case insensitive searches,
set smartcase               " Unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set showmatch               " Briefly jump to a paren once it's balanced
set incsearch               " Incrementally search while typing a /regex
set gdefault                " Applies substitutions globally on lines

" Hide matches on <leader>space
nnoremap <leader><space> :noh<CR>
nnoremap <tab> %
vnoremap <tab> %


" Python
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" Run pep8
let g:pep8_map='<leader>8'

" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Display
if has("gui_running")
    " Remove menu bar
    set guioptions-=m
    " Remove toolbar
    set guioptions-=T
endif

colorscheme molokai
