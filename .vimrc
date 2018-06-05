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

" We could also add repositories with a ".git" extension
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Python import sorter
Plug 'fisadev/vim-isort'

" Go plugins
Plug 'fatih/vim-go'
Plug 'neomake/neomake'

" C++ highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Rust plugin
Plug 'rust-lang/rust.vim'

" Fuzzy file finder (like Ctrl+K in other apps)
Plug 'junegunn/fzf'

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

" Emmet for vim
Plug 'mattn/emmet-vim'

" Language packs for vim
Plug 'sheerun/vim-polyglot'

Plug 'editorconfig/editorconfig-vim'

" Allow plugins to define their own operator
Plug 'kana/vim-operator-user'

" Vim indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Syntastic
Plug 'vim-syntastic/syntastic'

" Vim indent guide
Plug 'airblade/vim-gitgutter'

" clang-format plugin
Plug 'rhysd/vim-clang-format'

" Plugin which allows me to press a button to toggle between header and source
" file. Currently bound to LEADER+H
Plug 'ericcurtin/CurtineIncSw.vim'

" Completes ( with )
Plug 'jiangmiao/auto-pairs'

" Code completer
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --go-completer --js-completer --rust-completer' }

Plug 'https://github.com/miconda/lucariox.vim.git'

call plug#end()

" Enable indentation rules that are file-type specific.
" set filetype indent on

set background=dark

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
" Enable line numbers
set number" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif


" Enable mouse in all modes
set mouse=a
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undos
set undofile

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
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
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

let g:auto_save = 1

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_cpp_checker = 0
let g:syntastic_cpp_checkers=['']

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
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" YouCompleteMe
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1