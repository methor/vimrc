set nocompatible
source $VIMRUNTIME/vimrc_example.vim

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:iswindows = has("win32") || has("win95") || has("win64") || has("win16")
set encoding=utf-8
set fenc=cp936
set fileencodings=ucs-bom,utf-8,cp936
if(g:iswindows==1)
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    set ambiwidth=double
endif
set nobomb

function! OpenFileLocation()  
    if ( expand("%") != "" )  
        execute "!start explorer /select, %"   
    else  
        execute "!start explorer /select, %:p:h"  
    endif  
endfunction


" latex settings
filetype plugin on
set shellslash
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex'
let g:Tex_UsePython=0

" customize vim-latex place-holders
let g:Imap_UsePlaceHolders = 1
let g:Imap_PlaceHolderStart = '<+'
let g:Imap_PlaceHolderEnd = '+>'
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 1

" customize vim-latex compiler options
let g:Tex_CompileRule_pdf = 'xelatex --interaction=nonstopmode $*'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'SumatraPDF'
let g:Tex_SmartKeyDot = 0
let g:Tex_MultipleCompileFormats = 'pdf'


" workaround for e303
set directory=.,$TEMP


" voom settings
map <F11> :Voom<CR>
set fmr={{{,}}}






" Vundle Config {{{1

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-markdown'
Plugin 'VOom'
Plugin 'vim-latex/vim-latex'
Plugin 'Color-Scheme-Explorer'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vimIM'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Txtfmt-The-Vim-Highlighter'
Plugin 'sjl/gundo.vim'
Plugin 'rking/ag.vim'
Plugin 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" filetype plugin indent on    " required, added in 'UI Config' section
" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Colors {{{1

" Colorscheme badwolf is recommended by
" http://dougblack.io/words/a-good-vimrc.html#tmux.
color badwolf

" Enable syntax to allow Vim to show colors. Without this option,
" text will be colorless regardless of colorscheme.
syntax enable


" replace powershell for cmd (Windows Only)
set shell=cmd.exe
set shellpipe=>
set shellcmdflag=/c
set shellquote=
set shellxquote=(
set shellxescape=\"&\|<>()@^
"set shellcmdflag=-c

" Spaces & Tabs {{{1
"
" These options control tab's representation, visualization and the way
" it interacts with keyboard operation.
"
" Set tabstop equal to 4 will make Vim visually show 4 spaces when it reads
" a <TAB> character in a file.
"
" Set 'shiftwidth' to 4 makes autoindent follow traditional C indentation
" rules.
"
" 'softtabstop' controls how many <SPACE>s corresponding to a <TAB> hit. As
" soon as this option is set, <BACKSPACE> will delete the same spaces.
"
" 'expandtab' turns <TAB>s into spaces. So <TAB> just becomes a shortcut for
" 'insert for spaces'.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" set vim font
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
set gfw=свт╡:h10:cGB2312

"-----put backup files in a specific folder
set backupdir=$HOME/vimbackup


" python variable
let $PYTHONHOME="C:\\python27"


" UI Config {{{1
" These are options that change random visuals in Vim.

" Showing line numbers should need no justification.
set number

" 'relativenumber' shows the line number relative to the line with the cursor
" in front of each line.
set relativenumber

" 'showcmd' shows the last command entered in the very bottom right of Vim.
set showcmd

" 'cursorline' draws a horizontal highlight or underline on the line your
" cursor is currently on.
set cursorline

" This both turns on filetype detection and allows loading of language
" specific indentation files based on that detection.
filetype indent on

" When you run ':e ~/_vim<TAB>' Vim autocompletes things like filename.
" Well it provides a graphic menu of all the matches you can cycle through
" when you turn on 'wildmenu'.
set wildmenu

" This tells Vim not to bother redrawing the screen during some senarios like
" in the middle of macros, leading to faster macros.
set lazyredraw

" with 'showmatch', when your cursor moves over a parenthesis-like character,
" the matching one will be highlight as well. 
set showmatch



inoremap <C-BS> <ESC>diwi


" run python script 
nmap <F6> :w<CR>:!python %:p 2>&1 && \| tee .tmp.xyz<CR>:tabnew<CR>:r .tmp.xyz<CR>:silent !rm .tmp.xyz<CR>:redraw!<CR>




" Searching {{{1

" Search as characters are entered.
set incsearch

" Hightlight matches.
set hlsearch

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Vim will keep highlighted matches from searches until you either run a new
" one or manually stop highlighting the old one search with ':nohlsearch'
" which is now mapped to ',<space>'.



" Folding {{{1

set foldenable " enable folding

" 'foldlevelstart' is the starting fold level for opening a new buffer. If it
" is set to 0, all folds will be closed.
" Setting it to 99 would guarantee folds are always open. So setting it to 4
" here ensures that only very nested blocks of code are folded when opening a
" buffer.
set foldlevelstart=4 " open most folds by default

" Folds can be nested. Setting a max on the number of folds guards against too
" many folds.
set foldnestmax=10 " 10 nested fold max

" 'za' opens/closes the fold around the current block. Heard that 'z' in Vim
" represents folding because it looks like a folded piece of paper, nice
" story.:)
nnoremap <space> za

" Tell Vim to fold based on indentation. Other acceptable values are marker,
" manual, expr, syntax, diff.
set foldmethod=indent



" Movement {{{1
" This group of bindings are related to movement commands.

" Move vertically by visual line. If a very long line gets visually wrapped to
" two lines, j won't skip over the 'fake' part of the visual line in favor of
" the next 'real' line.
nnoremap j gj
nnoremap k gk

" Move to beginning/end of line. 'B' and 'E' are originally used to move
" forwards and backwards over visual words.
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>

" highlight last inserted text. It vusual selects the blocks of characters you
" add last time you were in INSERT mode. *NOTICE*: If the current buffer is
" written bofore running this command, the edit info will be lost.
nnoremap gV `[v`]



" Leader ShortCuts {{{1

" Customize <Leader>
let mapleader = ","

" Customize <LocalLeader>
let maplocalleader = "."

" jk is escape. <ESC> is very far away. 
inoremap jk <esc>

" Toggle undo. Vim models undo as a tree, it makes sure that you never lose an
" action in Vim, but also makes it much more difficult to traverse around that
" tree. 'gundo.vim' fixes this by displaying that undo tree in graphic form.
" Here I've mapped it to ',u', which I like to think of as 'super undo'.
nnoremap <leader>u :GundoToggle<CR>

" Binding for sourcing vimrc 
nmap <Leader>sv :source $MYVIMRC<CR>

" Binding for editing vimrc 
nmap <Leader>ev :vsplit $MYVIMRC<CR>

" Save session
nnoremap <leader>s :mksession<CR>

" Use 'ag' to search source code in a project. 'ag.vim' is Vim-frontend of
" 'The Silver Searcher'.
nnoremap <leader>a :Ag

cd ~/Desktop


" YouCompleteMe {{{1

let g:ycm_global_ycm_extra_conf='~/vimfiles/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'


" Ag {{{1
let g:ag_prg="ag --vimgrep --smart-case"
let g:ag_working_path_mode="r"
let g:ag_highlight=1

" CtrlP {{{1

"Ctrlp settings
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer='Et'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command='ag -i --nocolor --nogroup --hidden -g "" %s'
