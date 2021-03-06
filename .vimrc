""
" File: .vimrc
" Auth: Cezary Wojcik
" Desc: My .vimrc file.
""

" [ set up vundle ]
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" [ plugins ]
" features
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'Shougo/neocomplete.vim'
Plugin 'yggdroot/indentline'

" colorscheme
Plugin 'sjl/badwolf'

" additional language support
Plugin 'keith/swift.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'cakebaker/scss-syntax.vim'

" [ end vundle]
call vundle#end()

" [ appearance ]
set t_Co=256
set number " show line numbers
set numberwidth=3 " width of line number columns
set listchars=tab:\|\ ,trail:·,eol:¬ " show symbols
set backspace=indent,eol,start
set showcmd " shows incomplete command
set novb noeb "no visual bell or error beeps
set wildmenu " better command-line completion
set wildmode=longest:full,full
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj
set wildignore+=*/smarty/*,*/vendor/*,*/node_modules/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*.DS_Store
set encoding=utf-8
set cursorline " highlight current line
set laststatus=2 " always show status line
set ruler " show current position
set cmdheight=1
set hid
set backspace=eol,start,indent " fix backspace
set whichwrap+=<,>,h,l
set lazyredraw
set magic " regular expressions
set showmatch " matching brackets
set mat=2
filetype plugin indent on

" [ auto commands ]
" auto source vimrc on save
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" restore cursor position
if has("autocmd")
	autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif
endif

" resize splits on window resize
au VimResized * exe "normal! \<c-w>="

" fix linewise visual selection of various text objects
nnoremap Vat vatV
nnoremap Vab vabV
nnoremap VaB vaBV

" [ searching ]
" keep search matches in the middle of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
set hlsearch
set incsearch " highlight as search pattern is matched
set ignorecase " ignore case when searching
set smartcase " smart case for searching

" [ remaps  ]
inoremap <C-c> <ESC> " just in case
nmap fq :q!<CR> " fq to force quit
nmap <leader>w :w!<CR>
map <C-h> <C-w>h " window switching
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" [ settings ]
set ffs=unix,dos,mac
set noswapfile
set expandtab " spaces instead of tabs
set wrap
set autoread " auto read when file is changed from outside
let mapleader=","
let g:mapleader=","
set autoindent
set smartindent
set hidden
syntax enable " syntax hightlighting
set nostartofline " dont reset cursor to start of line when moving around
set ttyfast " fast scrolling
set history=1000
set gdefault " use g flag in search/replace by default

" [ airline ]
let g:airline_powerline_fonts = 1

" [ indent guides ]
let g:indentLine_color_term=239
let g:indentLine_char='|'

" [ badwolf ]
set background=dark
colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:badwolf_css_props_highlight = 1

" [ syntastic ]
let g:syntastic_check_on_open = 1

" [ nerd tree]
map <C-n> :NERDTreeToggle<CR> " toggle nerd tree using CTRL-N
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" [ neocomplete ]
let g:acp_enableAtStartup = 0
" use neocomplete.
let g:neocomplete#enable_at_startup = 1
" use smartcase
let g:neocomplete#enable_smart_case = 1
" set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" [ comment headers ]
" default comment header
function! s:insert_gates()
  execute "normal! i/**"
  execute "normal! oFile: " . expand("%:t") 
  execute "normal! oDate: " . strftime("%b %d, %Y %X")
  execute "normal! :r !date"
  execute "normal! oDesc:  "
  execute "normal! oAuth: Cezary Wojcik"
  execute "normal! o/"
  execute "normal! $"
  normal! kk
endfunction
autocmd BufNewFile *.js,*.c,*.h,*.swift call <SID>insert_gates()

function! s:insert_gates2()
  execute "normal! i##"
  execute "normal! o# File: " . expand("%:t") 
  execute "normal! o# Date: " . strftime("%b %d, %Y %X")
  execute "normal! :r !date"
  execute "normal! o# Desc:  "
  execute "normal! o# Auth: Cezary Wojcik"
  execute "normal! o##"
  execute "normal! $"
  normal! kk
endfunction
autocmd BufNewFile *.py,*.sh call <SID>insert_gates2()

