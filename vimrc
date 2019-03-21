set number relativenumber
set nocompatible              " be iMproved, required
filetype off                  " required

set clipboard=unnamedplus

" Remove trailing whitespaces when w
autocmd BufWritePre * %s/\s\+$//e

" Terminal emulator config
set splitbelow
tnoremap <C-h> <C-W><C-h>
tnoremap <C-j> <C-W><C-j>
tnoremap <C-k> <C-W><C-k>
tnoremap <C-l> <C-W><C-l>
tnoremap <C-u> <C-\><C-N><C-u>
tnoremap <C-d> <C-\><C-N><C-d>

" Misc shortcuts
noremap <LocalLeader>mm :vertical bo terminal make<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'benmills/vimux'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'jpg\|jpeg\|png\|git'
let g:ctrlp_working_path_mode = 0
Plugin 'itchyny/lightline.vim'
set noshowmode
set laststatus=2
Plugin 'tmhedberg/matchit'
Plugin 'sickill/vim-pasta'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
" Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'

" Insertion
Plugin 'raimondi/delimitmate'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'bronson/vim-trailing-whitespace'

" Latex
Plugin 'lervag/vimtex'

" Markdown
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" C++ plugins
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'a.vim'

" python
Plugin 'broesler/jupyter-vim'

" R plugins
Plugin 'jalvesaq/nvim-r'
let R_assign = 0
let R_nvim_wd = -1
let Rout_more_colors = 1
let R_complete = 1
let R_args_in_stline = 1
let R_show_args = 0
let R_show_arg_help = 0
let R_specialplot = 1
nmap <silent> <LocalLeader>ih :call RAction("head", "@,48-57,_,.")<CR>
nmap <silent> <LocalLeader>it :call RAction("tail", "@,48-57,_,.")<CR>
nmap <silent> <LocalLeader>is :call RAction("show", "@,48-57,_,.")<CR>
nmap <silent> <LocalLeader>id :call RAction("mtrace", "@,48-57,_,.")<CR>
map <silent> <LocalLeader>pi :call g:SendCmdToR("library(devtools); devtools::install()")<CR>
map <silent> <LocalLeader>pd :call g:SendCmdToR("library(devtools); devtools::document()")<CR>
map <silent> <LocalLeader>pb :call g:SendCmdToR("library(devtools); devtools::build()")<CR>
map <silent> <LocalLeader>pc :call g:SendCmdToR("library(devtools); devtools::check()")<CR>

call vundle#end()

set list lcs=tab:\|\
filetype plugin indent on
set tags=./tags;/
