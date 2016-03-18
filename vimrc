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
if g:iswindows==1
    let g:confdir='~/vimfiles/'
else
    let g:confdir='~/.vim/'
endif
set encoding=utf-8
set fenc=utf-8
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


" latex settings
filetype plugin on
"set shellslash
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
if g:iswindows==1
    set rtp+=~/vimfiles/bundle/Vundle.vim/
    call vundle#begin('~/vimfiles/bundle')
else
    set rtp+=~/.vim/bundle/Vundle.vim/
    call vundle#begin()
endif
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" Vundle {{{2
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" Fugitive {{{2
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

" Plugin 'godlygeek/tabular'

" Vim-Markdown {{{2
Plugin 'tpope/vim-markdown'
" VOom {{{2
Plugin 'VOom'
" Vim-Latex {{{2
Plugin 'vim-latex/vim-latex'
" Color-Scheme-Explorer {{{2
Plugin 'Color-Scheme-Explorer'
" Vim-ColorSchemes {{{2
Plugin 'flazz/vim-colorschemes'
" NerdCommenter {{{2
Plugin 'scrooloose/nerdcommenter'
" VimIM {{{2
Plugin 'vimIM'
" Txtfmt {{{2
Plugin 'Txtfmt-The-Vim-Highlighter'
" Gundo {{{2
Plugin 'sjl/gundo.vim'
" Ack.vim {{{2
Plugin 'mileszs/ack.vim'
" Ctrlp {{{2
Plugin 'ctrlpvim/ctrlp.vim'
" Vim-Airline {{{2
Plugin 'vim-airline/vim-airline'
" Airline-themes {{{2
Plugin 'vim-airline/vim-airline-themes'
" Expand-Region {{{2
Plugin 'terryma/vim-expand-region'
" YouCompleteMe {{{2
Plugin 'Valloric/YouCompleteMe'
" a.vim {{{2
Plugin 'a.vim'
" Vim-Signature {{{2
Plugin 'kshenoy/vim-signature'
" Emmet-Vim {{{2
Plugin 'mattn/emmet-vim'
" NerdTree {{{2
Plugin 'scrooloose/nerdtree'
" EasyMotion {{{2
Plugin 'Lokaltog/vim-easymotion'

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
" Currently I'm using luna which cooperate with vim-airline colorscheme.
color luna

" Enable syntax to allow Vim to show colors. Without this option,
" text will be colorless regardless of colorscheme.
syntax enable
syntax on


" replace powershell for cmd (Windows Only)
if g:iswindows==1
    set shell=cmd.exe
    set shellpipe=>
    set shellcmdflag=/c
    set shellquote=
    set shellxquote=(
    set shellxescape=\"&\|<>()@^
endif
"set shellcmdflag=-c

" Leader ShortCuts {{{1

" Customize <Leader>
let mapleader = "\<Space>"

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
nnoremap <leader>a :Ack
nnoremap <Leader>o :enew<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
vmap <Leader>y "*y
vmap <Leader>d "*d
nmap <Leader>p "*p
nmap <Leader>P "*P
vmap <Leader>p "*p
vmap <Leader>P "*P

autocmd BufEnter * silent! lcd %:p:h


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
" set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set gfw=NSimsun:h12
if g:iswindows==0
    set guifont=YaHei\ Consolas\ Hybrid\ 12
    set gfw=YaHei\ Consolas\ Hybrid\ 12
else
    set gfw=Consolas\ For\ Powerline\ FixedD:h11
endif

"-----put backup files in a specific folder
set backupdir=$HOME/vim-backup-files


" python variable
if g:iswindows==1
    let $PYTHONHOME="C:\\python27"
endif


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
set cursorcolumn

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

set ruler

set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set gcr=a:block-blinkon0
au GUIEnter * simalt ~x



inoremap <C-BS> <ESC>diwi






" Searching {{{1

" Search as characters are entered.
set incsearch

" Hightlight matches.
set hlsearch

" Turn off search highlight
nnoremap <leader>, :nohlsearch<CR>

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
nnoremap <space><space> za

" Tell Vim to fold based on indentation. Other acceptable values are marker,
" manual, expr, syntax, diff.
set foldmethod=indent


" List epub file list rather than open it directly.
if g:iswindows==1
    au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))
endif

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



" YouCompleteMe {{{1

let g:ycm_global_ycm_extra_conf=g:confdir . 'bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
if g:iswindows==1
    let g:ycm_path_to_python_interpreter='C:\python27\python.exe'
endif

nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
" 只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>


" Ag {{{1
let g:ackprg="ag --vimgrep"
" let g:ag_working_path_mode='r'

" CtrlP {{{1

"Ctrlp settings
let g:ctrlp_match_window='bottom,order:ttb'
let g:ctrlp_switch_buffer='Et'
let g:ctrlp_working_path_mode='r'
"let g:ctrlp_user_command='ag --nocolor --nogroup --hidden -g "" %s'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(log|jpg|png|jpeg)$',
    \ }

" Vim-airline {{{1

let g:airline_theme="luna"

let g:airline_powerline_fonts=1
set laststatus=2

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

"设置切换buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>

" 关闭状态显示空白符号计数,这个对我用处不大"
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#whitespace#symbol='!'


if g:iswindows==1
    set guifont=Consolas\ for\ Powerline\ FixedD:h11
endif

let g:Powerline_symbols='fancy'

if !exists('g:airline_symbols')
    let g:airline_symbols={}
endif
let g:airline_left_sep="\u2b80" 
let g:airline_left_alt_sep="\u2b81"
let g:airline_right_sep="\u2b82"
let g:airline_right_alt_sep="\u2b83"
let g:airline_symbols.branch="\u2b60"
let g:airline_symbols.readonly="\u2b64"
let g:airline_symbols.linenr="\u2b61"




 "设置顶部tabline栏符号显示"
 let g:airline#extensions#tabline#left_sep="\u2b80"
 let g:airline#extensions#tabline#left_alt_sep="\u2b81"
 


 " Vim-Expand-Region {{{1
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" switch between .h and .cpp {{{1
nmap <leader>ch :A<CR>

nmap <leader>sch :AS<CR>

" Vim-Signature {{{1
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }

" NerdTree {{{1
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" Gundo {{{1
set undofile
set undodir=~/.undo_history/
