" Start to use pathogen plugin
call pathogen#infect()
set hidden

set gfn=Monospace\ 9
"autocmd BufEnter * :syntax sync fromstart

"Ctags configuration
set tags=tags;
set autochdir

"Set the tagbar width
let g:tagbar_width = 22

"remap HJKL
noremap i k
noremap k j
noremap j h
noremap h i


"Enable windows copy/cut/paste and selection
"source $VIMRUNTIME/mswin.vim
"behave mswin
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

"CTRL-W is close current buffer
noremap <A-q>		:close<CR>
vnoremap <A-q>		<C-C>:close<CR>
inoremap <A-q>		<C-O>:close<CR>

" CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c

" CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

" CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

" CTRL-V and SHIFT-Insert are Paste
noremap <C-V>		"+gP
inoremap <C-V>		<C-O>"+gp
vnoremap <C-V>		"+gp

" CTRL-A is Select all
noremap <C-A> gggH<C-O>G
inoremap <C-A> <C-O>gg<C-O>gH<C-O>G
cnoremap <C-A> <C-C>gggH<C-O>G
onoremap <C-A> <C-C>gggH<C-O>G
snoremap <C-A> <C-C>gggH<C-O>G
xnoremap <C-A> <C-C>ggVG

""""""""""""""Settings and bindings for CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so     " Linux/MacOSX

"Set Alt-R as open recent edited files
nnoremap <silent> <A-r> :CtrlPMRU<CR>
inoremap <silent> <A-r> <C-O>:CtrlPMRU<CR>
vnoremap <silent> <A-r> <C-C>:CtrlPMRU<CR>

"Set Alt-D as open recent edited files
nnoremap <silent> <A-d> :CtrlPBuffer<CR>
inoremap <silent> <A-d> <C-O>:CtrlPBuffer<CR>
vnoremap <silent> <A-d> <C-C>:CtrlPBuffer<CR>

"Set Alt-O as open recent edited files
nnoremap <silent> <A-o> :FufFile<CR>
inoremap <silent> <A-o> <ESC>:FufFile<CR>
vnoremap <silent> <A-o> <C-C>:FufFile<CR>

" Change the leader key
let mapleader = ","
nnoremap ; :
inoremap jj <ESC>
cnoremap jj <ESC>

" autosave on losing focus
"au FocusLost * :wa

"file handling
filetype on
filetype plugin on
syntax on
syntax enable

set nu
set autoread		"autoload the file when modified
set nobackup	
set wildmenu		"add autocomplete in the cmd mode

"you can use mouse at any place
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"setting about searching
"set showmatch		"highlight the matching parenthesis
set matchtime=5		"parenthesis matching time about 1/10 second
set ignorecase		"ignore up/low case when searching
set smartcase
set showmatch
set incsearch		"highlight incrementally when searching
set ruler			"show the ruler at the right botton corner
set hlsearch		"highlight the search results
nnoremap <leader><space> :noh<CR>

let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"nnoremap <tab> %
"vnoremap <tab> %

"indent setting
set autoindent		"inherit the indent of previous line
set smartindent	
set cindent			"use c-style indent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmode
set confirm			"prompt message when processing unsaved or readonly file

"minibuffer handling
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavArrows = 1

"Customized hotkey setup
nnoremap <silent> <F12> :A<CR>

" Rectags...
nnoremap <silent> <C-\> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
inoremap <silent> <C-\> <C-O>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
vnoremap <silent> <C-\> <C-C>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

" compile current project
nnoremap <silent> <f5> :cd ../build<CR>:make<CR> 
inoremap <silent> <f5> <ESC>:cd ../build<CR>:make<CR>a
vnoremap <silent> <f5> <C-C>:cd ../build<CR>:make<CR>


autocmd! bufwritepost .vimrc source %

"Error handling
nnoremap <silent> <A-DOWN> :cn<CR>
inoremap <silent> <A-DOWN> <C-O>:cn<CR>
nnoremap <silent> <A-UP> :cp<CR>
inoremap <silent> <A-UP> <C-O>:cp<CR>

" Map alt+ikjl as up/down/left/right for insert and normal mode
inoremap <silent> <A-i> <UP>
nnoremap <silent> <A-i> <UP>
inoremap <silent> <A-k> <DOWN>
nnoremap <silent> <A-k> <DOWN>
inoremap <silent> <A-j> <LEFT>
nnoremap <silent> <A-j> <LEFT>
inoremap <silent> <A-l> <RIGHT>
nnoremap <silent> <A-l> <RIGHT>

"map end of line, beginning of line
nnoremap <silent> <C-j> 0 
nnoremap <silent> <C-l> $

let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multi = '1t'


