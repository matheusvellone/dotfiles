set relativenumber
set mouse=

call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

call plug#end()

let mapleader = ","

nnoremap <leader>1 :NERDTreeToggle<CR>
nnoremap <leader>ev :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pi :PlugInstall<CR>

nnoremap <C-s> :w<CR>
