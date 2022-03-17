set nocompatible
call plug#begin('~/.vim/plugged')

"plugins

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'cocopon/pgmnt.vim'
Plug 'cocopon/iceberg.vim'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'townk/vim-autoclose'
Plug 'lilydjwg/colorizer'
call plug#end()

"settings
set number
set termguicolors
let g:airline#extensions#tabline#enabled = 1
set t_Co=256

"current theme
"colorscheme iceberg 
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1

"hotkeys
map <F5> :NERDTreeToggle<CR>
