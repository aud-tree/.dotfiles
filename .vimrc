source ~/.vim/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

map <silent> <LocalLeader>nf :NERDTreeFind<CR>
map <silent> <LocalLeader>nt :NERDTreeToggle<CR>
map <silent> <LocalLeader>ff :CtrlP<CR>
map <silent> <LocalLeader>fb :CtrlPBuffer<CR>

map <silent> <LocalLeader><CR> :tabnew<CR>
map <silent> <LocalLeader>] gt
map <silent> <LocalLeader>[ gT
map <silent> <LocalLeader>nh :nohls<CR>
inoremap jj <ESC>

set hidden
set wrap
set scrolloff=4
set number
set ruler

syntax enable
set background=dark
colorscheme solarized
