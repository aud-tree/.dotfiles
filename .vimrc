set nocompatible

" vim-plug init
call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'kien/rainbow_parentheses.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'mattn/emmet-vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'vim-ruby/vim-ruby'
Plug 'easymotion/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mxw/vim-jsx', { 'for': 'jsx' }
Plug 'ervandew/supertab'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'chriskempson/base16-vim'
Plug 'othree/html5.vim'
Plug 'fatih/vim-go'

call plug#end()

" Macros
runtime macros/matchit.vim

" Plugin mappings
nnoremap <silent> <leader>nf :NERDTreeFind<cr><c-w>=
nnoremap <silent> <leader>nt :NERDTreeToggle<cr><c-w>=
nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fb :CtrlPBuffer<cr>
nnoremap <silent> <leader>ww :FixWhitespace<cr>
nnoremap <silent> <leader>rt :call g:Rebuild_tags()<cr>
nnoremap <silent> <leader>rf :VroomRunNearestTest<cr>
nnoremap <silent> <leader>rb :VroomRunTestFile<cr>
nnoremap <silent> <leader>rq :VimuxCloseRunner<cr>
nnoremap <silent> <leader>rp :RainbowParenthesesLoadRound<cr> :RainbowParenthesesLoadSquare<cr> :RainbowParenthesesLoadBraces<cr> :RainbowParenthesesActivate<cr>hhh
nnoremap <silent> <leader>ra :Require!<cr>
nnoremap <silent> <leader>r1 :Require<cr>

" Convenience mappings
nnoremap <silent> <leader><cr>  :tabnew<cr>
nnoremap <silent> <leader>]     gt
nnoremap <silent> <leader>[     gT
nnoremap <silent> <leader>nh    :nohls<cr>
nnoremap <silent> <leader>rr    :set relativenumber!<cr>
nnoremap <silent> <leader>ev    :e $MYVIMRC<cr>
nnoremap          <leader>sv    :source $MYVIMRC<cr>
inoremap          jk            <esc>l
inoremap          <esc>         <esc>l
inoremap          <c-l>         <Space>=><Space>
inoremap          OA          <up>
inoremap          OB          <down>
inoremap          OC          <right>
inoremap          OD          <left>
nnoremap          OA          <up>
nnoremap          OB          <down>
nnoremap          OC          <right>
nnoremap          OD          <left>
nnoremap          <c-h>         <c-w>h
nnoremap          <c-j>         <c-w>j
nnoremap          <c-k>         <c-w>k
nnoremap          <c-l>         <c-w>l

" Abbreviations
cnoreabbrev Q q
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev wA wa
cnoreabbrev WA wa
cnoreabbrev Qa qa
cnoreabbrev qA qa
cnoreabbrev QA qa
cnoreabbrev X x

" General settings
filetype plugin indent on
set hlsearch incsearch
set hidden
set showmatch
set dir=/tmp//
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab smarttab
set wrap
set scrolloff=4
set number
set ruler
set backspace=indent,eol,start
set undodir=~/.vim/undo
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
set ignorecase
set smartcase
set conceallevel=1

" Status line
set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
set statusline+=%-40f\                    " relative path
set statusline+=%=                        " seperate between right- and left-aligned
set statusline+=%1*%y%*%*\                " file type
set statusline+=%10(L(%l/%L)%)\           " line
set statusline+=%2(C(%v/125)%)\           " column
set statusline+=%P                        " percentage of file

" Colorscheme settings
syntax enable
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256
set background=dark
colorscheme base16-default-dark

" Plugin settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
"let g:syntastic_debug = 3
let g:syntastic_scss_checkers = []
let g:syntastic_quiet_messages = { "level": "warnings",
                                 \ "type":  "style",
                                 \ "regex": 'proprietary attribute',
                                 \ "file":  '.*\.html$' }
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = "/tmp/"
let g:ctrlp_custom_ignore = { 'dir':  '\(node_modules\|.git\|.tmp\|.bundle\)$' }

" Autocommands (restart vim to apply changes)
augroup RainbowParens
  autocmd!
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
augroup END

au FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*/\\?\\\*'

" Functions
function! g:Rebuild_tags()
  call system('rm tags')
  echom 'ctags: rebuilding... please be patient'
  let g:cmd_output=system('ctags -R .')
  echo 'done'
endfunction
