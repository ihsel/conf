execute pathogen#infect()
set noswapfile
set autoread " reload any files that have not been edited in vim
set encoding=utf-8
set showmatch
set nu
set hlsearch
" set nowrap
set colorcolumn=80 " flake limit is 79
set cursorline
syntax enable
set nocompatible              " required
filetype off                  " required
filetype indent on
set autoindent
set backspace=indent,eol,start
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ... PLUGINS ...
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'lifepillar/pgsql.vim'
Plugin 'mxw/vim-jsx'
Plugin 'sickill/vim-monokai'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'ternjs/tern_for_vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'pearofducks/ansible-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Rip-Rip/clang_complete'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" colorscheme sublimemonokai
" let g:sublimemonokai_term_italic = 1
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

" sql
let g:sql_type_default = 'pgsql'

autocmd vimenter * NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$'] " ignore files in NERDTree
let g:AutoPairsFlyMode = 0
let g:AutoPairsShortcutBackInsert = '<M-b>'


" screen split
set splitbelow
set splitright

" screen split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" enable folding
set foldmethod=expr  " indent
set foldlevel=99

" enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1

" for python
let python_highlight_all=1
au BufNewFile,BufRead *.py set tabstop=4 | 
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let g:python_pep8_indent_multiline_string=1
" flake8
let g:flake8_show_in_gutter = 1

" flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


" for fullstack
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set expandtab |
    \ set autoindent |

" javascript
let g:javascript_plugin_flow = 1

" for yml
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1
autocmd FileType yaml setlocal et ts=2 ai sw=2 nu sts=0
