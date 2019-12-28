
" leader 快捷键区
  " 修改leader键
  let mapleader = ','
  let g:mapleader = ','


" Vim System Config
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
  " 启用鼠标
  set mouse=v
set wildignore=*.swp,*.bak,*.pyc,*.class,.svn
" change the terminal's title
set title
" 去掉输入错误的提示声音
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" 打开自动定位到最后编辑的位置, 需要确认 .viminfo 当前用户可写
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



"==========================================
" Theme
"==========================================
set termguicolors
" if &term =~ '256color'
  " " disable Background Color Erase (BCE) so that color schemes
  " " render properly when inside 256-color tmux and GNU screen.
  " " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  " set t_ut=
" endif
  colorscheme molokai
  let g:solarized_termcolors=256
  " monokai原始背景色
  let g:molokai_original = 1
  let g:rehash256 = 1
  " theme主题
  set background=dark
  " 开启语法高亮
  syntax on
  " 突出显示当前列
  set cursorcolumn
  " 突出显示当前行
  set cursorline

" set background=light
set t_Co=256



"==========================================
" Display Settings 展示/排版等界面格式设置
"==========================================

" 显示当前的行号列号
set ruler
" 在状态栏显示正在输入的命令
set showcmd
" 左下角显示当前vim模式
set showmode

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=9

" set winwidth=79

" 命令行（在状态行下）的高度，默认为1，这里是2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" 显示行号
set number
" 取消换行
set nowrap

" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


" 设置文内智能搜索提示
" 高亮search命中的文本
set hlsearch
" 打开增量搜索模式,随着键入即时搜索
set incsearch
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99
" 代码折叠自定义快捷键 <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

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

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x增减数字时使用十进制
set nrformats=

" 相对行号: 行号变成相对，可以用 nj/nk 进行跳转
set relativenumber number
" au FocusLost * :set norelativenumber number
" au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
" autocmd InsertEnter * :set norelativenumber number
" autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc





"==========================================
" FileEncode Settings 文件编码,格式
"==========================================
" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" 下面这句只影响普通模式 (非图形界面) 下的 Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" 如遇Unicode值大于255的文本，不必等到空格再折行
set formatoptions+=m
" 合并两行中文时，不在中间加空格
set formatoptions+=B



function! AbsoluteHideNumber()
  set nonumber
  set norelativenumber
endfunc

"==========================================
" HotKey Settings  自定义快捷键设置
"==========================================

" 我的快捷键：
" 保存快捷键
nnoremap <C-s> :w<CR>
" inoremap <C-j> <DOWN>
" inoremap <C-k> <UP>
" inoremap <C-h> <LEFT>
" inoremap <C-l> <RIGHT>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" 主要按键重定义

"Treat long lines as break lines (useful when moving around in them)
"se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" Go to home and end using capitalized directions
noremap H ^
noremap L $


" Map ; to : and save a million keystrokes 用于快速进入命令行
nnoremap ; :


" 命令行模式增强，ctrl - a到行首， -e 到行尾
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" 搜索相关
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" 进入搜索Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" 去掉搜索高亮
noremap <silent><leader>/ :nohls<CR>

" switch # *
nnoremap # *
nnoremap * #

" for # indent, python文件中输入新行时#号注释不切回行首
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" select block
nnoremap <leader>v `{jV`}k

" 复制选中区到系统剪切板中
vnoremap <leader>y "+y

" jj 替换 Esc
inoremap jj <Esc>

" close current buffer
function! CloseBuffer()
  let l:n = len(getbufinfo())
  if l:n <= 1
    q
  else
    bwipe
  endif

endfunction
nnoremap <leader>q :call CloseBuffer()<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" 交换 ' `, 使得可以快速使用'跳到marked位置
nnoremap ' `
nnoremap ` '


" 调整缩进后自动选中，方便再次操作
vnoremap < <gv
vnoremap > >gv

" tab/buffer相关

" 切换前后buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>

" terminal

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

  nnoremap <silent> <Leader>t     :sp<CR><C-w><C-w>:res 14<CR>:call AbsoluteHideNumber()<CR>
        \:terminal ++curwin zsh<CR>
  nnoremap <silent> <Leader><Leader>t     :vs<CR><C-w><C-w>:call AbsoluteHideNumber()<CR>
        \:terminal ++curwin zsh<CR>
  nnoremap <silent> <Leader>i     :sp<CR><C-w><C-w>:res 14<CR>:call AbsoluteHideNumber()<CR>
        \:terminal ++curwin ipython<CR>
  nnoremap <C-n> <C-w>j
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

  " tmap <Esc> <C-w><C-w>
  " tmap <C-t> <C-w><C-w>
  tmap <C-k> <C-w>k
  tnoremap <C-k> <C-w>k

  tmap <C-i> <C-\><C-N>
  tmap <C-w> <C-h>
  " tmap <C-j> <C-\><C-N><C-w>j
  " tmap <C-h> <C-\><C-N><C-w>h
  " tmap <C-l> <C-\><C-N><C-w>l
  " tmap <C-D> <C-d>close<CR>
  " tnoremap <Leader>q i<C-d>close<CR>

   source ~/.vim/vimrc.plug
