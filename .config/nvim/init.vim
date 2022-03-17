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
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'sjl/badwolf'
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
colorscheme badwolf 
let g:airline_theme = 'deus'
let g:airline_powerline_fonts = 1
let g:molokai_original = 1

"hotkeys
map <F5> :NERDTreeToggle<CR>

"keybindings
"TAB completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"


" for transparent background
function! AdaptColorscheme()
   highlight clear CursorLine
   highlight Normal ctermbg=none
   highlight LineNr ctermbg=none
   highlight Folded ctermbg=none
   highlight NonText ctermbg=none
   highlight SpecialKey ctermbg=none
   highlight VertSplit ctermbg=none
   highlight SignColumn ctermbg=none
endfunction
autocmd ColorScheme * call AdaptColorscheme()

highlight Normal guibg=NONE ctermbg=NONE
highlight CursorColumn cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
highlight CursorLineNr cterm=NONE ctermbg=NONE ctermfg=NONE
highlight clear LineNr
highlight clear SignColumn
highlight clear StatusLine
