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

set nocompatible

"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim

if is_windows
  behave mswin
endif

"һ������
set nu!
colorscheme desert
syntax enable
syntax on
autocmd InsertLeave * se nocul  " ��ǳɫ������ǰ��  
autocmd InsertEnter * se cul    " ��ǳɫ������ǰ��
set nobackup			" ��Ҫ~�����ļ�
set autoread			" �ļ����Ķ��Զ�����
set autoindent			" �Զ�����
set cindent
set smartindent
set ignorecase
set incsearch
set shiftwidth=4
set tabstop=4
set expandtab


"�Զ����ݼ�
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
vnoremap <C-K> 0I//           "C/C++��ע��
vnoremap <C-L> 0I<Del><Del>   "C/C++ȡ��ע��(ֻ�Ե�ǰ������)

"�Զ���ȫ
filetype plugin indent on 
set completeopt=longest,menu
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType = "<C-X><C-N>" 


"Tlist����
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"MiniBuf����
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplorerMoreThanOne=0

"WinManager����
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

"Grep����
nnoremap <silent> <F3> :Rgrep<CR><CR><CR><CR>

"Ctags����
"set tags=tags;
"set autochdir

"cscope����
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


"gvim��������
"����gvim�˵����͹�����, ʹ��F2��
if is_gui 
set guioptions-=m  " ���ز˵��� 
set guioptions-=T  " ���ع����� 
"set guioptions-=L " ������������ 
"set guioptions-=r " �����Ҳ������ 
"set guioptions-=b " ���صײ������� 
"set showtabline=0 " ����Tab�� 
set lines=35 columns=118 "����gvim��ʱ�Ĵ��ڴ�С
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI	" use when VeraMono.ttf installed
endif 


set diffexpr=MyDiff()
function MyDiff()
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

