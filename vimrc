"==========================================
" basic setting
"==========================================
let mapleader = ','
let g:mapleader = ','
nnoremap ; :
set mouse=v


"==========================================
" encoding
"==========================================
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8
" Use Unix as the standard file type
set ffs=unix,dos,mac
" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B


"==========================================
" loading
"==========================================
syntax on
set nocompatible

" 取消备份。 视情况自己改
set nobackup
" 关闭交换文件
set noswapfile
" 文件修改之后自动载入
set autoread
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on
" Persistent undo
set hidden
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000


" Remember info about open buffers on close
set viminfo^=%
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" searching
"==========================================
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 去除以前搜索结果
exec "nohlsearch"
" For regular expressions turn magic on
set magic
" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>
" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v
" switch # *
nnoremap # *
nnoremap * #


"==========================================
" line
"==========================================
" 显示行号
set number
" 取消换行
set nowrap
" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber
" 显示下划线
" set cursorline
" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode
" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=9
" 列宽
set cc=80
" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2
" 隐藏行号
function! AbsoluteHideNumber()
  if(&number == 1)
    set nonumber norelativenumber
  else
    set number relativenumber
  endif
endfunc
map <Leader>n :call AbsoluteHideNumber()<CR>
" 切换模型
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc


"==========================================
" cmd
"==========================================
set showcmd
set wildmenu
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.,__pycache__
" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
" 命令行模式增强，ctrl - a到行首， -e 到行尾
" cnoremap <C-j> <t_kd>
" cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

"==========================================
" theme
"==========================================
colorscheme molokai
let g:solarized_termcolors=256
" monokai原始背景色
let g:molokai_original = 1
let g:rehash256 = 1
" theme主题
set background=dark
" 突出显示当前列
set cursorcolumn
" 突出显示当前行
set cursorline
" set background=light
set t_Co=256


"==========================================
" split
"==========================================
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <silent> <Leader>j :res +5<CR>
nnoremap <silent> <Leader>k :res -5<CR>
nnoremap <silent> <Leader>h :vertical resize-5<CR>
nnoremap <silent> <Leader>l :vertical resize+5<CR>
nnoremap <silent> <C-=> :res +5<CR>
nnoremap <silent> <C--> :res -5<CR>
nnoremap <silent> + :vertical resize+5<CR>
nnoremap <silent> _ :vertical resize-5<CR>
" 切换横竖分屏
map sv <C-w>t<C-w>H
map sh <C-w>t<C-w>K


"==========================================
" indent
"==========================================
" 缩进配置
" Smart indent
set smartindent
" 打开自动缩进
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent
" tab相关变更
" 设置Tab键的宽度        [等同的空格个数]
set tabstop=2
" 每一次缩进对应的空格数
set shiftwidth=2
" 按退格键时可以一次删掉 4 个空格
set softtabstop=2
" insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set smarttab
" 将Tab自动转化成空格[需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set expandtab
" 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

"==========================================
" save & quit
"==========================================

" Quickly save the current file
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

"==========================================
" navigation
"==========================================
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" jj 替换 Esc
inoremap jj <Esc>
" 解决backspace不能使用
set backspace=indent,eol,start


"==========================================
" visual model
"==========================================
" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv
" select block
" nnoremap <leader>v `{jV`}k
nnoremap <leader>v <C-v>
" 复制选中区到系统剪切板中
vnoremap <C-c> "+y
vnoremap q <ESC>

"==========================================
" terminal
"==========================================
if has('nvim')
  " neo terminal
  nnoremap <leader>r V:call SendToTerminal()<CR>$
  vnoremap <leader>r <Esc>:call SendToTerminal()<CR>
  nnoremap <silent> <Leader>t     :sp<CR><C-w><C-w>:res 14<CR>:call AbsoluteHideNumber()<CR>
        \:terminal zsh<CR>i
  nnoremap <silent> <Leader><Leader>t     :vs<CR><C-w><C-w>:call AbsoluteHideNumber()<CR>
        \:terminal zsh<CR>i
  nnoremap <silent> <Leader>i     :sp<CR><C-w><C-w>:res 14<CR>:call AbsoluteHideNumber()<CR>
        \:terminal ipython<CR>i
  " nnoremap <C-n> <C-w>j
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  " :res 14<CR>:call AbsoluteHideNumber()<CR>i
  " inoremap <Leader>t     <Esc>:sp<CR><C-w><C-w>:res 14<CR>:term$ZSH_BIN<CR>i
  " open vertical terminal
  " nnoremap <Leader>b     :vs<CR><C-w><C-w><CR>:term$ZSH_BIN<CR>i
  " quick to terminal insert mode
  " " quick make
  " nnoremap <Leader>m     <C-w>jimake<CR><C-\><C-n><C-w>k
  " inoremap <Leader>m     <Esc><C-w>jimake<CR><C-\><C-n><C-w>k
  " nnoremap <Leader>l     <C-w>ji<C-p><CR><C-\><C-n><C-w>k
  " inoremap <Leader>l     <Esc><C-w>ji<C-p><CR><C-\><C-n><C-w>k
  " terminal exit

  " tmap <Esc> <C-\><C-n>
  " tmap <C-t> <C-\><C-n>
  " tmap <C-k> <C-w>k
  " tnoremap <C-k> <C-\><C-n><C-w>k

  tmap <Esc> <C-\><C-N>
  tmap <C-j> <C-\><C-N><C-w>j
  tmap <C-k> <C-\><C-N><C-w>k
  tmap <C-h> <C-\><C-N><C-w>h
  tmap <C-l> <C-\><C-N><C-w>l
  tnoremap <C-d> <C-\><C-n>:call CloseTerminal()<CR>
  " tmap <C-D> <C-d>close<CR>
  " tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <Leader>q i<C-d>close!<CR>
  function! CloseTerminal()
    let l:n = len(getbufinfo())
    if l:n <= 1
      q!
    else
      bw!
    endif
  endfunction
elseif v:version > 800
  nnoremap <leader>r V:call SendToTerminal()<CR>$
  vnoremap <leader>r <Esc>:call SendToTerminal()<CR>
  nnoremap <leader>s V:call SendToTerminalNoreturn()<CR>$
  vnoremap <leader>s <Esc>:call SendToTerminalNoreturn()<CR>
  function! SendToTerminal()
    let buff_n = term_list()
    if len(buff_n) > 0
      let buff_n = buff_n[0] " sends to most recently opened terminal
      let lines = getline(getpos("'<")[1], getpos("'>")[1])
      let indent = match(lines[0], '[^ \t]') " check for removing unnecessary indent
      for l in lines
        let new_indent = match(l, '[^ \t]')
        if new_indent == 0
          call term_sendkeys(buff_n, l. "\<CR>")
        else
          call term_sendkeys(buff_n, l[indent:]. "\<CR>")
        endif
        sleep 10m
      endfor
    endif
  endfunction
  function! SendToTerminalNoreturn()
    let buff_n = term_list()
    if len(buff_n) > 0
      let buff_n = buff_n[0] " sends to most recently opened terminal
      let lines = getline(getpos("'<")[1], getpos("'>")[1])
      let indent = match(lines[0], '[^ \t]') " check for removing unnecessary indent
      for l in lines
        let new_indent = match(l, '[^ \t]')
        if new_indent == 0
          call term_sendkeys(buff_n, l)
        else
          call term_sendkeys(buff_n, l[indent:])
        endif
        sleep 10m
      endfor
    endif
  endfunction

  nnoremap <silent> <Leader>t     :set splitbelow<CR>:split<CR>:res 14<CR>:call AbsoluteHideNumber()<CR>
        \:terminal ++curwin zsh<CR>
  nnoremap <silent> <Leader><Leader>t     :set splitright<CR>:vsplit<CR>:call AbsoluteHideNumber()<CR>
        \:terminal ++curwin zsh<CR>
  nnoremap <silent> <Leader>i     :set splitbelow<CR>:split<CR>:res 14<CR>:call AbsoluteHideNumber()<CR>
        \:terminal ++curwin ipython<CR>

  tnoremap <C-d> <C-\><C-n>:call CloseTerminal()<CR>
  " tnoremap <Esc> <C-\><C-n>
  tnoremap <C-t> <C-\><C-n>
  tnoremap <C-k> <C-w>k
  tnoremap <C-h> <C-w>h
  tnoremap <C-b> <ESC>b

  function! CloseTerminal()
    let l:n = len(getbufinfo())
    if l:n <= 1
      q!
    else
      bw!
    endif
  endfunction
endif

source ~/.vim/vimrc.plug
