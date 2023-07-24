set nocompatible
call plug#begin('~/.vim/plugged')

"plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'townk/vim-autoclose'
Plug 'lilydjwg/colorizer'
Plug 'morhetz/gruvbox'
Plug 'tribela/vim-transparent'
call plug#end()

"settings
set number
set termguicolors
let g:airline#extensions#tabline#enabled = 1
set t_Co=256

"autoindent newline
inoremap <expr> <CR> InsertMapForEnter()
function! InsertMapForEnter()
    if pumvisible()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<CR>\<Esc>O"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,2) == '</'
        return "\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction

"current theme
set background=dark
colorscheme gruvbox 
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 0 
let g:molokai_original = 1

"hotkeys
map <F5> :NERDTreeToggle<CR>
"keybindings
"TAB completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" tab width (spaces)
set shiftwidth=3 smarttab
set expandtab
set tabstop=8 softtabstop=0
filetype indent on
set autoindent

" python-syntax
let python_highlight_all = 1

" python autopep
let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
let g:formatters_python = ['autopep8']
au BufWrite * :Autoformat
