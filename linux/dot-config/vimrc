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

"===Set colors of vim 
"colors pablo 
"colors ron
colors elflord
hi CocMenuSel ctermbg=232 

"===Install the plugins of vim
call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'vim-airline/vim-airline'
    Plug 'universal-ctags/ctags'
    Plug 'preservim/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'luochen1990/rainbow'
    Plug 'dense-analysis/ale'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


"=== Set ale
" Set checker for python
let g:ale_linters = {'python': ['pylint']}

" Show number of errors
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf('%d⨉ %d⚠ ', all_non_errors, all_errors)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" Format error strings
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" Show vim windows for the loclist or quickfix items when a file contains warnings or errors,
let g:ale_open_list = 0


"===Set rainbow
" Set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 


"===Set coc.nvim
" Start CoC by default (but Coc is enabled)
let g:coc_start_at_startup = 1

" Disable Coc auto suggestion in tex file
autocmd FileType tex let b:coc_suggest_disable = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
