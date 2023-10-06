"=== Set vim
syntax on                                  " 启用语法高亮
set number                                 " 在左侧行号
set nobackup                               " 覆盖文件时不备份
set cursorline                             " 突出显示当前行
set ruler                                  " 在右下角显示光标位置的状态行
"set mouse=a                                " 启用鼠标支持
set laststatus=2                           " 启用状态栏
"set nocompatible                           " 不兼容 Vi 的设置
set backspace=indent,eol,start             " 允许使用退格键删除光标前的字符
set encoding=utf-8                         " 设置默认编码为 UTF-8
set fileencodings=utf-8,gbk,gb2312,gb18030 " 设置文件编码优先级
"set fileformat=unix                        " 设置文件格式为 Unix
"set fileformats=unix,dos,mac               " 文件格式优先级
set fileencoding=utf-8                     " 默认打开文件的编码为 UTF-8
set termencoding=utf-8                     " 终端编码为 UTF-8
set tabstop=4                              " 设置制表符宽度为 4
set shiftwidth=4                           " 设置缩进宽度为 4
set hlsearch                               " 高亮搜索结果
set incsearch                              " 实时匹配搜索结果
set ignorecase                             " 忽略搜索时的大小写
set smartcase                              " 智能匹配搜索结果（大小写敏感）
set expandtab                              " 将制表符转换为空格,要用 vim 写 makefile 文件不要加
set autoindent                             " 自动缩进
set smartindent                            " 智能缩进
set wrap                                   " 自动换行

"=== Install the plugins of vim
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'vim-syntastic/Syntastic'
    Plug 'vim-airline/vim-airline'
    Plug 'universal-ctags/ctags'
    Plug 'preservim/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'luochen1990/rainbow'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"=== Set Syntastic                                                                     
set statusline+=%#warningmsg#                                                   
set statusline+=%{SyntasticStatuslineFlag()}                                    
set statusline+=%*                                                              
let g:syntastic_always_populate_loc_list=1                                    
let g:syntastic_auto_loc_list=1                                               
let g:syntastic_check_on_open=0                                               
let g:syntastic_check_on_wq=0
"" Display checker-name for that error-message                                  
let g:syntastic_aggregate_errors=1        
"" I use the pip3 to install pylint                                             
let g:syntastic_python_checkers=['pylint','python3']

"=== Set rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"=== Set coc.nvim
"" Set the colors of floating windows recommanded
colors ron
hi Pmenu ctermfg=7 ctermbg=236 
hi CocFloatintg ctermfg=black ctermbg=red
hi CocMenuSel ctermbg=109 guibg=#13354A

"" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
