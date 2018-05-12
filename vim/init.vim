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
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" General config
let mapleader = ","

syntax on
colorscheme gruvbox
set background=dark

set number
set relativenumber

set foldmethod=indent
set nofoldenable
nnoremap <Space> za<CR>

nnoremap <leader>ev :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>d gt<CR>
nnoremap <leader>a gT<CR>
nnoremap <leader>h :nohl<CR>
nnoremap <leader>vs <C-w>v<CR>

set mouse=
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" NERDTree
let NERDTreeWinSize=60
let NERDTreeShowHidden=1
nnoremap <leader>1 :NERDTreeToggle<CR>

" Plugins
nnoremap <leader>pi :PlugInstall<CR>

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_show_hidden = 1

" Airline
let g:airline_theme='murmur'
