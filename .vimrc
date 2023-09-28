call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'webastien/vim-ctags'
    Plug 'esukram/vim-taglist'
    Plug 'vim-syntastic/Syntastic'
    Plug 'vim-airline/vim-airline'
    Plug 'dmerejkowsky/vim-ale'
call plug#end()

" Syntastic                                                                     
"" Recommended settings                                                         
set statusline+=%#warningmsg#                                                   
set statusline+=%{SyntasticStatuslineFlag()}                                    
set statusline+=%*                                                              
let g:syntastic_always_populate_loc_list = 1                                    
let g:syntastic_auto_loc_list = 1                                               
let g:syntastic_check_on_open = 1                                               

"" Display checker-name for that error-message                                  
let g:syntastic_aggregate_errors = 1        

"" I use the pip3 to install pylint                                             
let g:syntastic_python_checkers=['pylint', 'python3']
