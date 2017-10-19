" Embrace the power of vundle!
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

" Enable syntax highlighting
syntax enable
autocmd BufNewFile,BufRead *.xill   set syntax=javascript

" Open NerdTREE if a folder is opened or no file is provided
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Bind CTRL+n to NERDTree focus
map <C-n> :NERDTreeFocus<CR>

" Close vim if NerdTREE is the only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show hidden files
let NERDTreeShowHidden=1

" Show line numbers
set number

" Formatting
set tabstop=4
set shiftwidth=4
set expandtab

" Print Margin
set colorcolumn=80
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Set tabstop to 2 for yaml files
autocmd BufRead,BufNewFile *.yml set shiftwidth=2 tabstop=2
