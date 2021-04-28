"----------------------------------------------
" Plugin management
"
" Download vim-plug from the URL below and follow the installation
" instructions:
" https://github.com/junegunn/vim-plug
"----------------------------------------------
if empty(glob('~/.local/share/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive

" General plugins
Plug 'vim-airline/vim-airline'
Plug 'bling/vim-bufferline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-emoji'
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
Plug 'ryanoasis/vim-devicons'
Plug 'machakann/vim-highlightedyank'
Plug 'chenkaie/smarthomekey.vim'

" Language support
Plug 'ekalinin/Dockerfile.vim'
Plug 'cespare/vim-toml'                        " toml syntax highlighting
Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim', {'for': 'rust'}

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'embark-theme/vim', { 'as': 'embark' }
call plug#end()

"---------------------------------------------
" General settings
"---------------------------------------------
set autoindent
set smartindent
set autoread
set autowrite
set colorcolumn=81
set completeopt-=preview
set encoding=utf-8
set expandtab
set noshowmode
set nospell
set noswapfile
set nowrap
set noerrorbells
set novisualbell
set number
set relativenumber
set ruler
set shiftwidth=4
set softtabstop=4
set tabstop=4
set laststatus=2
set title
set updatetime=100
syntax enable

" Colorscheme settings
if (has("termguicolors"))
    set termguicolors
endif

set background=dark
colorscheme embark

set incsearch
set hlsearch
set inccommand=split

 "neovim specific settings
 "Set python binaries neovim is using
 "Install the neovim package for these binaries separately
 "pip3 install -U neovim
"let g:python3_host_prog = '/usr/bin/python3'

" Enable mouse if possible
if has('mouse')
    set mouse=a
endif

" Set the leader button
let mapleader = ','

"----------------------------------------------
" Navigation
"----------------------------------------------
" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move between buffers with Shift + arrow key
nnoremap <S-Left> :bprevious<cr>
nnoremap <S-Right> :bnext<cr>

augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>h :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

"----------------------------------------------
" Plugin: vim-airline/vim-airline
"----------------------------------------------
let g:airline_theme = 'embark'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
let g:airline_left_sep = "\ue0b8"
let g:airline_left_alt_sep = "\ue0b9"
let g:airline_right_sep = "\ue0be"
let g:airline_right_alt_sep = "\ue0b9"
"----------------------------------------------
" Plugin: bling/vim-bufferline
"----------------------------------------------
let g:bufferline_echo = 0
autocmd VimEnter *
            \ let &statusline='%{bufferline#refresh_status()}'
                \ .bufferline#get_status_string()

"----------------------------------------------
" Plugin: 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <c-p> :FZF<cr>

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2

"----------------------------------------------
" Plugin: coc.vim
"----------------------------------------------
hi CocHintSign ctermfg=6
hi CocErrorSign ctermfg=1
hi CocWarningSign ctermfg=3
hi CocInfoSign ctermfg=6

hi CocInfoFloat ctermfg=7
hi CocHintFloat ctermfg=7

hi CocRustChainingHint ctermfg=8

"----------------------------------------------
" Plugin: machakann/vim-highlightedyank'
"----------------------------------------------
let g:highlightedyank_highlight_duration = 1000

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set expandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set expandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set expandtab
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown
au FileType markdown set textwidth=80

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: Rust
"----------------------------------------------
let g:rustfmt_autosave = 1

"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set expandtab
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set expandtab
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2

set completefunc=emoji#complete
