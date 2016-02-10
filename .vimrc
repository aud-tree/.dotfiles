set nocompatible

" Pathogen init
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

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
nnoremap <silent> <leader>ev    :vsplit $MYVIMRC<cr>
nnoremap          <leader>sv    :source $MYVIMRC<cr>
inoremap          jj            <esc>l
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
set background=dark
colorscheme solarized

" Plugin settings
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_quiet_messages = { "level": "warnings",
                                 \ "type":  "style",
                                 \ "regex": 'proprietary attribute',
                                 \ "file":  '.*\.html$' }
let g:ctrlp_show_hidden = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = "/tmp/"
let g:ctrlp_custom_ignore = { 'dir':  '\(node_modules\|.git\|.tmp\|.bundle\)$'
                            \ }
let g:vroom_use_vimux = 1
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop'
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['129',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" 129 = purple

" Autocommands (restart vim to apply changes)
augroup RainbowParens
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax,BufEnter,BufAdd * RainbowParenthesesLoadRound
  autocmd Syntax,BufEnter,BufAdd * RainbowParenthesesLoadSquare
  autocmd Syntax,BufEnter,BufAdd * RainbowParenthesesLoadBraces
augroup END

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=expr foldexpr=getline(v:lnum)=~'^\\s*/\\?\\\*'

" Functions
function! g:Rebuild_tags()
  call system('rm tags')
  echom 'ctags: rebuilding... please be patient'
  let g:cmd_output=system('ctags -R .')
  echo 'done'
endfunction
