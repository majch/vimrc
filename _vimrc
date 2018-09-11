" windows or unix
if (has("win32") || has("win64"))
  let g:is_windows = 1
else
  let g:is_windows = 0
endif

" terminal or gvim/macvim
if has("gui_running")
  let g:is_gui = 1
else
  let g:is_gui = 0
endif

let mapleader=","

set nocompatible

filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///Users/juncheng.ma/.vim'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

Plugin 'CtrlP.vim'
Plugin 'TList.vim'
Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'Grep.vim'
Plugin 'minibufexpl.vim'
Plugin 'ctags.vim'
"Plugin 'Supertab'
Plugin 'Valloric/YouCompleteMe'    " cd ~/.vim/bundle/YouCompleteMe; ./install.py --clang-completer
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

if is_windows
  behave mswin
endif

"Ò»°ãÉèÖÃ
set nu
syntax enable
syntax on
"colorscheme desert
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
autocmd InsertLeave * se nocul  " ÓÃÇ³É«¸ßÁÁµ±Ç°ÐÐ  
autocmd InsertEnter * se cul    " ÓÃÇ³É«¸ßÁÁµ±Ç°ÐÐ
set nobackup			" ²»Òª~±¸·ÝÎÄ¼þ
set autoread			" ÎÄ¼þ±»¸Ä¶¯×Ô¶¯ÔØÈë
set autoindent			" ×Ô¶¯Ëõ½ø
set cindent
set smartindent
set ignorecase
set incsearch
set hlsearch
set shiftwidth=4
set tabstop=4
set expandtab

" open the quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow


"×Ô¶¨Òå¿ì½Ý¼ü
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
vnoremap <C-K> 0I//           "C/C++¿é×¢ÊÍ
vnoremap <C-L> 0I<Del><Del>   "C/C++È¡Ïû×¢ÊÍ(Ö»¶Ôµ±Ç°ÐÐÓÐÓÃ)

"YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

"×Ô¶¯²¹È«
filetype plugin indent on 
set completeopt=longest,menu
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-N>" 


"Tlist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"Download and build Exuberant Ctags first (required for MacOS)
let g:Tlist_Ctags_Cmd='/usr/local/bin/ctags'

"MiniBuf
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=0

"WinManager
let g:NERDTree_title='NERD Tree'
let g:winManagerWindowLayout='NERDTree|TagList'
nmap wm :WMToggle<cr>

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction

"GrepÉèÖÃ
nnoremap <silent> <F3> :Rgrep<CR><CR><CR><CR>
nnoremap <silent> <leader>f :Ggrep <C-R><C-W><CR><C-O>

"vim-javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"vimrc
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['pylint']  " make sure listed checker is in your PATH
let g:syntastic_python_pylint_rcfile='~/.pylintrc'
let g:syntastic_javascript_checkers=['eslint']

"CtagsÉèÖÃ
"set tags=tags;
"set autochdir

"cscopeÉèÖÃ
if has("cscope")
  if is_windows
    set csprg=C:\Program\ Files\ (x86)\Vim\vim73\cscope.exe
  else
    set csprg=/usr/local/bin/cscope
  endif
  "set cscopequickfix=s-,c-,d-,i-,t-,e-
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	"search for this c symbol
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	"search for this string
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"gvim´°¿ÚÉèÖÃ
"Òþ²Øgvim²Ëµ¥À¸ºÍ¹¤¾ßÀ¸, Ê¹ÓÃF2´ò¿ª
if is_gui 
set guioptions-=m  " Òþ²Ø²Ëµ¥À¸ 
set guioptions-=T  " Òþ²Ø¹¤¾ßÀ¸ 
"set guioptions-=L " Òþ²Ø×ó²à¹ö¶¯Ìõ 
"set guioptions-=r " Òþ²ØÓÒ²à¹ö¶¯Ìõ 
"set guioptions-=b " Òþ²Øµ×²¿¹ö¶¯Ìõ 
"set showtabline=0 " Òþ²ØTabÀ¸ 
set lines=100 columns=118 "ÉèÖÃgvim´ò¿ªÊ±µÄ´°¿Ú´óÐ¡
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI	" use when VeraMono.ttf installed
endif 


"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  let eq = ''
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      let cmd = '""' . $VIMRUNTIME . '\diff"'
"      let eq = '"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
"endfunction
"
