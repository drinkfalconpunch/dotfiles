set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Color themes
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-dark'

" Color brackets"
Plug 'luochen1990/rainbow'
" Plug 'liuchengxu/eleline.vim'
" Plug 'liuchengxu/vim-better-default'


" LaTeX
Plug 'lervag/vimtex'
Plug 'junegunn/fzf'

" We could also add repositories with a ".git" extension
Plug 'scrooloose/nerdtree'

" Code folding
" Plug 'tmhedberg/SimpylFold'
" Plug 'Konfekt/FastFold'

" Python import sorter
Plug 'fisadev/vim-isort'

" Go plugins
Plug 'fatih/vim-go', {'for': ['go', 'markdown']}

" Linting"
" Plug 'neomake/neomake'
Plug 'w0rp/ale'

" C++ highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Rust plugin
Plug 'rust-lang/rust.vim'

" Fuzzy file finder (like Ctrl+K in other apps)
Plug 'junegunn/fzf',    { 'dir': '~/.fzf', 'do': './install --all'  }

" Lightline status bar for the bottom.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Multiple cursors.
Plug 'terryma/vim-multiple-cursors'

" Shell commands in vim
Plug 'tpope/vim-eunuch'

" Surround text with brackets
Plug 'tpope/vim-surround'

" Comment lines
Plug 'tpope/vim-commentary'

" Git commands in vim
Plug 'tpope/vim-fugitive'

" Language packs for vim
Plug 'sheerun/vim-polyglot'

Plug 'editorconfig/editorconfig-vim'

" Allow plugins to define their own operator
Plug 'kana/vim-operator-user'

" Vim indent guides
Plug 'Yggdroot/indentLine'

" Syntastic
" Plug 'vim-syntastic/syntastic'

" Vim indent guide
" Plug 'airblade/vim-gitgutter'

" Targets
" Plug 'wellle/targets.vim'

" Plug 'markonm/traces.vim'

" clang-format plugin
Plug 'rhysd/vim-clang-format'

" Plugin which allows me to press a button to toggle between header and source
" file. Currently bound to LEADER+H
Plug 'ericcurtin/CurtineIncSw.vim'

" Vim easy align
Plug 'junegunn/vim-easy-align'

" Completes ( with )
Plug 'jiangmiao/auto-pairs'

" Code completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --rust-completer' }

Plug 'https://github.com/miconda/lucariox.vim.git'

call plug#end()

" Enable indentation rules that are file-type specific.
" set filetype indent on

syntax on

" New lines inherit the indentation of previous lines.
set autoindent
" Convert tabs to spaces.
set expandtab
" Enable indentation rules that are file-type specific.
set shiftround
" When shifting, indent using four spaces.
set shiftwidth=4
" Insert “tabstop” number of spaces when the “tab” key is pressed.
set smarttab
" Indent using four spaces
set tabstop=4
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI

" set foldmethod=indent
set nofoldenable
" Enable line numbers
set number" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Fixes the HOME and END buttons not working
" set term=xterm-256color
" Enable mouse in all modes
" set ttymouse=xterm2
set mouse=a

" Centralize backups, swapfiles and undo history
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set backupdir=~/.vim/backups
silent !mkdir ~/.vim/swaps > /dev/null 2>&1
set directory=~/.vim/swaps
silent !mkdir ~/.vim/undos > /dev/null 2>&1
set undodir=~/.vim/undos
set undofile
set noswapfile

set undolevels=1000
set undoreload=10000
set wildignore+=*.o
set wildignore+=*/Assets/*.meta
set wildignore+=*/lib/*
set wildignore+=*.pyc
set wildignore+=*/node_modules/*,*/dist/*,*/__pycache__/*
set wildignore+=moc_*.cpp,moc_*.h
set wildignore+=moc_*.cpp,moc_*.h

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
"set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=" "
" Don’t add empty newlines at the end of files
set binary
set noeol


" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Vertical cursor line when in insert mode
" set guicursor=i:ver25-iCursor
" Start scrolling three lines before the horizontal window border
set scrolloff=3
" Go to next/previous line
set whichwrap+=<,>,h,l,[,]


" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Ale settings
let g:ale_lint_on_text_changed = 'never' 
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
nmap <leader>sa :ALEFix<CR>
nmap <leader>ss :ALELint<CR>

let g:auto_save = 1

" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" let g:syntastic_enable_cpp_checker = 0
" let g:syntastic_cpp_checkers=['']

let g:go_fmt_command = "goimports"

autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage)

autocmd FileType cpp nmap <leader>f <Plug>(operator-clang-format)
autocmd FileType cpp nmap <leader>h :call CurtineIncSw()<CR>

autocmd FileType javascript setlocal ts=2 sw=2 sts=2
autocmd FileType html setlocal ts=2 sw=2 sts=2

autocmd BufEnter *.py set ai sw=4 ts=4 sta et fo=croql

" clang-format extension options
autocmd FileType c ClangFormatAutoEnable
autocmd FileType cpp ClangFormatAutoEnable
autocmd FileType javascript ClangFormatAutoDisable

" clang_complete
let g:clang_library_path='/usr/local/lib/libclang.so'
let g:clang_auto_select=1
let g:clang_close_preview=1

" Syntastic setup
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Code folding
" let g:SimpylFold_docstring_preview=1

set rtp+=/usr/local/opt/fzf

" Rainbow brackets
let g:rainbow_active = 1

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
" Close nerdtree if only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Color themes
" color space-vim-dark
"hi Normal ctermbg=NONE guibg=NONE
colorscheme onedark
highlight LineNr ctermfg=yellow 
highlight CursorLineNr ctermfg=white 
" set background=dark