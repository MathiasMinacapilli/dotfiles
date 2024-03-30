syntax on

set noerrorbells

" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

set runtimepath+=~/.vim_runtime
set smartindent
set autoindent
set cursorline " to highlight the current line
" :set number relativenumber " turn hybrid line numbers on
:set nu nornu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

colorscheme monokai
set background=dark

" source ~/.vim_runtime/vimrcs/basic.vim
" source ~/.vim_runtime/vimrcs/filetypes.vim
" source ~/.vim_runtime/vimrcs/plugins_config.vim
" source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

" Automatic installation of vim-plug to manage plugins in vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Mappings
let mapleader = " "

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

map <Leader>nt :NERDTreeFind<CR>
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Pluggins:
" To install plugins you just run: `:PlugInstall`
" To install plugins you just run: `:PlugInstall`
" To clean plugins to re-install then: `:PlugClean`
call plug#begin('~/.vim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'

" status bar
" Plug 'maximbaz/light-ale'
" Plug 'itchyny/lightline.vim'

" tree
Plug 'preservim/nerdtree'

" typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" autocomplete
" Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" editor
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'

call plug#end()


