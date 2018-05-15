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
Plug 'neomake/neomake'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'

call plug#end()

" General config
let mapleader = ","

syntax on
colorscheme gruvbox
set background=dark

set number
set relativenumber

set inccommand=split

set cc=80,120

set foldmethod=indent
set nofoldenable
nnoremap <Space> za

nnoremap <leader>ev :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>h :nohl<CR>

" Window management
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>d gt
nnoremap <leader>a gT

nnoremap <leader>sh <C-w>s
nnoremap <leader>sv <C-w>v
nnoremap <leader>zw <C-w>\|<C-w>_
nnoremap <leader>zr <C-w>=

vnoremap <leader>s :sort<CR>

set mouse=
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Functions
function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

" NERDTree
let NERDTreeWinSize=60
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
nnoremap <leader>1 :NERDTreeFind<CR>
nnoremap <leader>2 :NERDTreeToggle<CR>

" Plugins
nnoremap <leader>pi :PlugInstall<CR>

" Neomake
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_show_hidden = 1

" Airline
let g:airline_theme='murmur'

" Deoplete
let g:deoplete#enable_at_startup = 1

" fzf
tnoremap <Esc> <C-\><C-n>:q<CR>
