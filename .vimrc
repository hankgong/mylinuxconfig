"Manage Vim 'runtimepath' with ease. Much easier to install plugins and
"runtime files in their own private directories
"Start to use pathogen plugin
call pathogen#infect()
set hidden

"lists of all installed packages
"--ack.vim: ack-grep, a powerful searching tool to replace grep. 
"|---F3 is bound to search with ack-grep
"--a.vim: used to search between source code and header file
"--bufkill: delete a buffer, don't know why vim doesn't provide this
"--ctrlp.vim: powerful tool that can list buffers, recent files and search directories
"--c.vim: main c plugin for c programming
"


"For now, I'm just using the 
"colorscheme ir_black
"colorscheme molokai
"let g:molokai_original = 1

"color customized settings
hi PmenuSel ctermbg=darkcyan
" with highlight current line in different modes
highlight OverLength ctermbg=darkblue ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

hi CursorLine   cterm=NONE ctermbg=black  guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=black  guibg=darkred guifg=white

"autocmd InsertEnter,InsertLeave * set cul!
autocmd InsertEnter * set cul
autocmd InsertLeave * set cul!


"supertab settisfds; wondering why the default key mapping is reversed
"let g:SuperTabMappingForward = '<s-tab>'
"let g:SuperTabMappingBackward = '<tab>'
"let g:SuperTabMappingLiteral = '<c-t>'


"ctrlp.vim settings 
let g:ctrlp_show_hidden = 1

"vim-autocomplpop settings
"let g:acp_mappingDriven = 0
let g:acp_behaviorKeywordLength = 4
"let g:acp_completeoptPreview = 1

"Font setting
set gfn=Monospace\ 9
"autocmd BufEnter * :syntax sync fromstart

"Ctags configuration
set tags=tags;
set autochdir

"indent setting
set autoindent		"inherit the indent of previous line
set smartindent	
set cindent			"use c-style indent

set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmode
set confirm			"prompt message when processing unsaved or readonly file

"turn off backup
set nobackup
set nowb
set noswapfile

"Set the tagbar width
let g:tagbar_width = 22

"Settings and bindings for CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so     " Linux/MacOSX

"remap HJKL to make it more intuitively
noremap i k
noremap k j
noremap j h
noremap h i

" Map alt+ikjl as up/down/left/right for insert and normal mode
inoremap <silent> <A-i> <UP>
nnoremap <silent> <A-i> <UP>
inoremap <silent> <A-k> <DOWN>
nnoremap <silent> <A-k> <DOWN>
inoremap <silent> <A-j> <LEFT>
nnoremap <silent> <A-j> <LEFT>
inoremap <silent> <A-l> <RIGHT>
nnoremap <silent> <A-l> <RIGHT>

" delete current line
nnoremap <silent> <C-d> dd
inoremap <silent> <C-d> <C-O>dd
vnoremap <silent> <C-d> dd

"map end of line, beginning of line
nnoremap <silent> <C-j> 0
inoremap <silent> <C-j> <C-O>0
vnoremap <silent> <C-j> 0

nnoremap <silent> <C-l> $
inoremap <silent> <C-l> <C-\><C-O>$
vnoremap <silent> <C-l> $

"customized page up and down
"nnoremap <silent> <C-I> <C-U><C-U>
"vnoremap <silent> <C-I> <C-U><C-U>
"inoremap <silent> <C-I> <C-\><C-O><C-U><C-\><C-O><C-U>

"nnoremap <silent> <C-K> <C-D><C-D>
"vnoremap <silent> <C-K> <C-D><C-D>
"inoremap <silent> <C-K> <C-\><C-O><C-D><C-\><C-O><C-D>

"search use ack-grep
nnoremap <f3> :Ack<SPACE>
inoremap <f3> <C-O>:Ack<SPACE>
vnoremap <f3> <C-C>:Ack<SPACE>

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

set nocompatible
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


"enable the alt key mapping in normal terminal found this at 
"http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim"
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

"Enable windows copy/cut/paste and selection
"source $VIMRUNTIME/mswin.vim
"behave mswin
" Use CTRL-S for saving, also in Insert mode
noremap <C-S>		:update<CR>
vnoremap <C-S>		<C-C>:update<CR>
inoremap <C-S>		<C-O>:update<CR>

"CTRL-W is close current buffer
noremap <C-w>		:bd<CR>
vnoremap <C-w>		<C-C>:bd<CR>
inoremap <C-w>		<C-O>:bd<CR>

"Ctrl-q to quite vim
noremap <C-q>		:q!<CR>
vnoremap <C-q>		<C-C>:q!<CR>
inoremap <C-q>		<C-O>:q!<CR>

"CTRL-Z is Undo; not in cmdline though
noremap <C-Z> u
inoremap <C-Z> <C-O>u

"CTRL-Y is Redo (although not repeat); not in cmdline though
noremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"CTRL-V and SHIFT-Insert are Paste
noremap <C-V>		"+gP
inoremap <C-V>		<C-O>"+gp
vnoremap <C-V>		"+gp

"CTRL-C and SHIFT-Insert are Paste
noremap <C-C>		"+y
inoremap <C-C>		<C-O>"+y
vnoremap <C-C>		"+y

"CTRL-F4 is Close window
noremap <C-F4> <C-W>c
inoremap <C-F4> <C-O><C-W>c
cnoremap <C-F4> <C-C><C-W>c
onoremap <C-F4> <C-C><C-W>c


"configure the ctrlp plugin
let g:ctrlp_map = '<f8>'
"Set Alt-R as open recent edited files
nnoremap <silent> <A-r> :CtrlPMRU<CR>
inoremap <silent> <A-r> <C-O>:CtrlPMRU<CR>
vnoremap <silent> <A-r> <C-C>:CtrlPMRU<CR>

"Set Alt-D as showing all opened buffers
nnoremap <silent> <A-d> :CtrlPBuffer<CR>
inoremap <silent> <A-d> <C-O>:CtrlPBuffer<CR>
vnoremap <silent> <A-d> <C-C>:CtrlPBuffer<CR>

"Set Alt-O as open recent edited files
nnoremap <silent> <A-o> :FufFile<CR>
inoremap <silent> <A-o> <ESC>:FufFile<CR>
vnoremap <silent> <A-o> <C-C>:FufFile<CR>


let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"nnoremap <tab> %
"vnoremap <tab> %

"minibuffer handling
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplMapWindowNavArrows = 1

"Customized hotkey setup
nnoremap <silent> <F12> :A<CR>

" Rectags...
nnoremap <silent> <C-\> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
inoremap <silent> <C-\> <C-O>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
vnoremap <silent> <C-\> <C-C>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 

" CPP library
set tags+=~/Programs/library/cpp

" compile current project
"nnoremap <silent> <f5> :cd ../build<CR>:make<CR> 
"inoremap <silent> <f5> <ESC>:cd ../build<CR>:make<CR>a
"vnoremap <silent> <f5> <C-C>:cd ../build<CR>:make<CR>

" set f4 as close quickfix window
nnoremap <silent> <f4> :cclose<CR> 
inoremap <silent> <f4> <C-O>:cclose<CR>
vnoremap <silent> <f4> <C-C>:cclose<CR>

autocmd! bufwritepost .vimrc source %



"Error handling
nnoremap <silent> <A-u> :cn<CR>
inoremap <silent> <A-u> <C-O>:cn<CR>
nnoremap <silent> <A-y> :cp<CR>
inoremap <silent> <A-y> <C-O>:cp<CR>


let g:ctrlp_open_new_file = 't'
let g:ctrlp_open_multi = '1t'


