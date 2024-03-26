set nocompatible
call plug#begin('~/.vim/plugged')

"plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'rstacruz/vim-closer'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
Plug 'tribela/vim-transparent'
Plug 'vim-scripts/c.vim'
Plug 'wfxr/minimap.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}

call plug#end()

"settings
set number
set termguicolors
let g:airline#extensions#tabline#enabled = 1
set t_Co=256
syntax enable

" tabbing settings: 
set shiftwidth=3 smarttab
set expandtab
set tabstop=8 softtabstop=0
filetype plugin indent on
set autoindent
set si
set ai

"current theme:
set background=dark
colorscheme gruvbox 
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 0 
let g:molokai_original = 1

"hotkeys
map <F5> :NERDTreeToggle<CR>

