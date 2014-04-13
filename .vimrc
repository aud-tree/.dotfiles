set nocompatible

" Pathogen init
source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Plugin mappings
nnoremap <silent> <leader>nf :NERDTreeFind<cr>
nnoremap <silent> <leader>nt :NERDTreeToggle<cr>
nnoremap <silent> <leader>ff :CtrlP<cr>
nnoremap <silent> <leader>fb :CtrlPBuffer<cr>
nnoremap <silent> <leader>ww :FixWhitespace<cr>
nnoremap <silent> <leader>rt :TagbarToggle<cr>
nnoremap <silent> <leader>rb :VroomRunTestFile<cr>
nnoremap <silent> <leader>rf :VroomRunNearestTest<cr>

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
inoremap          <esc>         <nop>

" Autocommands (restart vim to apply changes)
augroup VimscriptEdit
  autocmd!
  autocmd FileType vim nnoremap <silent> <buffer> q :q<cr>
  autocmd FileType vim nnoremap <buffer> <leader>ev <nop>
augroup END

" General settings
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
let g:syntastic_quiet_messages = { "level": "warnings",
                                 \ "type":  "style",
                                 \ "regex": 'proprietary attribute',
                                 \ "file":  '.*\.html$' }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = "/tmp/"
let g:ctrlp_custom_ignore = { 'dir':  '\(node_modules\|.git\)$'
                            \ }
let g:vroom_use_vimux = 1

" Functions
