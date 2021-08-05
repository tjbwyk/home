set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'sickill/vim-monokai'
Plugin 'sheerun/vim-polyglot'
Plugin 'rhysd/vim-clang-format'
Plugin 'lervag/vimtex'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
colorscheme monokai
set laststatus=2
set statusline+=%f
set relativenumber
set number
set expandtab
set shiftwidth=2
set softtabstop=2
set undofile
set cindent
set cino=g0,(0,+4,N-s
set completeopt-=preview
set cursorline
"set ignorecase
set nowrap
set splitbelow
set termwinsize=10x0
set visualbell
set t_vb=
highlight ColorColumn ctermbg=234 ctermfg=088
let &colorcolumn=join(range(101,999),",")
highlight CursorLine cterm=NONE ctermbg=234
highlight ExtraWhitespace ctermbg=darkgreen
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd BufWritePre * %s/\s\+$//e
"highlight OverLength ctermbg=232
"match OverLength /\%101v.\+/
vmap <C-c> "+y
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

nmap <silent> <C-UP> :wincmd +<CR>
nmap <silent> <C-DOWN> :wincmd -<CR>
nmap <silent> <C-LEFT> :wincmd <<CR>
nmap <silent> <C-RIGHT> :wincmd ><CR>

nmap <silent> <C-t> :bel term<CR>

"" NERDTree
" For mouse click in NERDTree
if has('mouse')
  set mouse=a
endif
let g:NERDTreeMouseMode=3
map <C-n> :NERDTreeToggle<CR>
map <C-y> :NERDTreeFind<CR>

"" YCM
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
map <F9> :YcmCompleter FixIt<CR>

"" incsearch
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"" vintex
let g:polyglot_disabled = ['latex']
let g:vimtex_view_general_viewer = 'okular --unique'

"" a.vim
let g:alternateSearchPath = 'sfr:../Interface,sfr:../Implementation,reg:/Implementation/Interface/g/,reg:/Interface/Implementation/g/,sft:../Interface/TomTom/NavKit/MapMatcher,sft:../Interface/TomTom/NavKit/DrivingContext'
let g:alternateNoDefaultAlternate = 1
map <C-a> :A<CR>

"" ctags
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extras=+fq --exclude={Build,.git} .<CR>

"" vim-clang-format
map <F5> :ClangFormat<CR>
