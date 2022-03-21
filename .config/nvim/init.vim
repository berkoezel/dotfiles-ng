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
Plug 'townk/vim-autoclose'
Plug 'lilydjwg/colorizer'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
Plug 'tribela/vim-transparent'
Plug 'NLKNguyen/papercolor-theme'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
colorscheme PaperColor 
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 0 
let g:molokai_original = 1

"hotkeys
map <F5> :NERDTreeToggle<CR>
"keybindings
"TAB completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
