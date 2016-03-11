set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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

let g:weibo_access_token = '43B668DAABA9D816A147964466D80230'
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
set fmr=<<<,>>>

" customize Leader
let mapleader = ","

" customize LocalLeader
let maplocalleader = "."

" for usage of easy source
nmap <Leader>s :source $HOME/_vimrc<CR>

" open vimrc fast
nmap <Leader>e :vsplit $HOME/_vimrc<CR>

" show linenumber
set number

" show the relative numbers of other lines in the current window
set relativenumber

" get into command mode
inoremap jk <esc>:w<CR>


" set tab width
set tabstop=8
set softtabstop=2
set shiftwidth=2
set noexpandtab


" set vim font
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
set gfw=свт╡:h10:cGB2312

"-----put backup files in a specific folder
set backupdir=$HOME/vimbackup


" python variable
let $PYTHONHOME="C:\\Program Files (x86)\\python2.7"




filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/Vundle.vim
call vundle#begin('~/vimfiles/')
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
Plugin 'git://git.wincent.com/command-t.git'
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" set color scheme
syntax on
color freya
