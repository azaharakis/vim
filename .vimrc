set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
" vundle manage vundle, required
Plugin 'gmarik/vundle.vim'
" tree file explorer
Plugin 'scrooloose/nerdtree'
" intuative file searching
Plugin 'wincent/command-t'
"Plugin 'scrooloose/syntastic'
" ----- scrooloose/syntastic settings -----
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_error_symbol = "☠"
"let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_style_error_symbol = "☢"

"augroup mysyntastic
"au!
  "au filetype tex let b:syntastic_mode = "passive"
"augroup end
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%f
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" show git changes in the gutter of files
Plugin 'airblade/vim-gitgutter'
" colours
Plugin 'jelera/vim-javascript-syntax'
" indenting plus a couple of extra features
Plugin 'pangloss/vim-javascript'
let g:javascript_enable_domhtmlcss = 1

" syntax highlighting for jsx
Plugin 'mxw/vim-jsx'
"enables highlighting for .js files
let g:jsx_ext_required = 0

" visually displays indentation
Plugin 'nathanaelkane/vim-indent-guides'
" file searching within a project
Plugin 'kien/ctrlp.vim'
" git commands within vim
Plugin 'tpope/vim-fugitive'
" auto complete
Plugin 'valloric/youcompleteme'
" Editor config to use whats configured in projects
Plugin 'editorconfig/editorconfig-vim'
" jumping to files in js apps
Plugin 'moll/vim-node'
Plugin 'tpope/vim-repeat'
Plugin 'jaxbot/semantic-highlight.vim'
:nnoremap <Leader>s :SemanticHighlightToggle<cr>
let g:semanticTermColors = [28,1,2,3,4,5,6,7,25,9,10,34,12,13,14,15,16,125,124,19]
let g:semanticBlacklistOverride = {
    \ 'javascript': [
    \   'setTimeout',
    \   'break',
    \   'dance',
    \ ]
\ }
" surround text with stuff
Plugin 'tpope/vim-surround'
" shortcuts to jump to next and previous quick fixes i.e gitgrep
Plugin 'tpope/vim-unimpaired'
" these are the tweaks i apply to ycm's config, you don't need them but they might help.
" ycm gives you popups and splits by default that some people might not like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

"Easy commenting via cc
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

set expandtab         " use spaces instead of tab characters
set wrap              " wrap the display lines (not actual text)
set linebreak
set backspace=indent,eol,start
set incsearch         " show matching search results as typing
set ruler             " show row and column in status bar
set wildmenu          " nicer tab completion for :ex commands
set ignorecase        " case insensitive search by default
set smartcase         " use case sensitive search in a capital letter is used
set warn              " show what mode your in (insert, etc.)
set scrolloff=3       " number of lines to always show at at the top and bottom
set autoindent        " copy the indentation from the previous line
set colorcolumn=81    " highlight the 81st column (shorthand = :set cc=81)
set cursorline        " highlight the line which the cursor is on
set laststatus=2      " always show a status bar
set mouse=a           " make the mouse work - even in terminals
set list              " show `listchars` characters
set nocompatible              " be iMproved, required
set expandtab
set shiftwidth=2
set softtabstop=2
set listchars=tab:=»,trail:·
set t_Co=256
set background=dark
"color desert
color distinguished
"color mango
set splitbelow
set splitright
set number
filetype off                  " required

function! Renewtagsfile()
    exe 'silent !rm -rf .ctags'
    exe 'silent !ctags -a -rf .ctags --languages=javascript,typescript --exclude=.git --exclude="*.min.js" --exclude=node_modules 2>/dev/null'
    exe 'redraw!'
endfunction

" check file change every 4 seconds ('cursorhold') and reload the buffer upon detecting change
set autoread
au cursorhold * checktime    

" easier way to copy and paste from the global clipboard
 map <leader>p "+p
 map <leader>y "+y
" Navigating split tabs
 map <c-j> <c-w>j
 map <c-k> <c-w>k
 map <c-h> <c-w>h
 map <c-l> <c-w>l
imap <c-return> <cr><cr><c-o>k<tab>
"nerdtree settings
 map <c-n> :NERDTreeToggle<cr>
 map <leader>f :NERDTreeFind<cr>

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_dont_split = 'nerd'
" du fto undo diff changes in vim fugative
nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>
" quickly insert an empty new line without entering insert mode
nnoremap <leader>o o<esc>
"reopen last split tab > cntrl shift tab
nmap <c-s-t> :vs<bar>:b#<cr>
syntax on

