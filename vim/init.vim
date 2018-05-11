if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

call plug#end()

syntax on

colorscheme gruvbox
set background=dark

set relativenumber
set mouse=

set foldmethod=indent
set nofoldenable

let mapleader = ","

nnoremap <leader>1 :NERDTreeToggle<CR>
nnoremap <leader>ev :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>vs <C-w>v<CR>
nnoremap <Space> za<CR>

nnoremap <C-s> :w<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
