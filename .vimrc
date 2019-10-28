let g:solarized_termcolors=256
set clipboard=unnamed
execute pathogen#infect()
set laststatus=2
set showcmd
if has("syntax")
	syntax on
	set hlsearch
endif
"set guifont=Mono\ 13
colorscheme darkburn
syntax enable
"colorscheme solarized
set backspace=2              " 设置退格键可用
set ai " 设置自动缩进
set smartindent " 智能自动缩进
set shiftwidth=4 " 换行时行间交错使用4空格
set nu  " 显示行号
set mouse=v" 启用鼠标
"set ruler   " 右下角显示光标位置的状态行
"set showcmd" Show (partial) command in status line.
set showmatch" 显示括号配对情况
set incsearch "输入搜索内容时 动态的显示搜索结果
set hlsearch "搜索内容高亮显示
set nocompatible             " 关闭兼容模式
set hidden                   " 允许在有未保存的修改时切换缓冲区
set autochdir                " 设定文件浏览器目录为当前目录
set noswapfile      "禁止交换文件swp
:set cursorline
set keymodel=startsel,stopsel
set tabstop=4
set autoread
set sm
set cin
set sw=4
set encoding=utf-8
set fenc=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"let g:fencview_autodetect=1 " 使用fencview进行编码识别
"let g:fencview_auto_patterns='*' " 使用fencview进行编码识别
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4     " python文件，插入tab自动转空格
autocmd Filetype python %ret!     " python文件，当前文件已有tab自动转空格
"设置打开一个文件时候，猜测的文件编码列表 按照顺序来猜测
filetype plugin on
filetype plugin indent on    " 启用自动补全
filetype indent on           " 针对不同的文件类型采用不同的缩进格式
let mapleader=','
map <C-\> <plug>NERDCommenterToggle
nmap <C-\> <plug>NERDCommenterToggle<ESC>j
imap <C-\> <ESC><plug>NERDCommenterToggle<ESC>j<ESC>i
set pastetoggle=<F9>
autocmd! BufNewFile * call LoadTemplate()
fun LoadTemplate()
    "获取扩展名或者类型名
    let ext = expand ("%:e")
    let tpl = expand("~/.vim/tpl/".ext.".tpl")
    if !filereadable(tpl)
        echohl WarningMsg | echo "No template [".tpl."] for .".ext | echohl None
        return
    endif

    "读取模板内容
    silent execute "0r ".tpl
    "指定光标位置
    silent execute "normal G$"
    silent call search("#cursor#", "w")
    silent execute "normal 8x"
    "进入插入模式
    startinsert
endfun

