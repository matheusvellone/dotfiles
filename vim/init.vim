if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
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
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'

call plug#end()

" General config
let mapleader = ","

syntax on
colorscheme gruvbox
set background=dark

set number
set relativenumber
set cursorline

set inccommand=split

set cc=80,120

set ignorecase
set smartcase
set nohlsearch

set foldmethod=indent
set foldlevel=50
set nofoldenable
nnoremap <Space> za
nnoremap <F5> :e<CR>

nnoremap <leader>ve :edit ~/.config/nvim/init.vim<CR>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>h :nohl<CR>

" Window management
nnoremap <leader>t :tabe %<CR>
nnoremap <leader>a <C-w>h
nnoremap <leader>d <C-w>l
nnoremap <leader>e gt
nnoremap <leader>q gT

nnoremap <leader>sh <C-w>s
nnoremap <leader>sv <C-w>v
set fillchars+=vert:│

nnoremap <S-Down> <c-w>+
nnoremap <S-Up> <c-w>-
nnoremap <S-Left> <c-w><
nnoremap <S-Right> <c-w>>

nnoremap <leader>zw <C-w>\|<C-w>_
nnoremap <leader>zr <C-w>=

vnoremap <leader>s :sort<CR>

set mouse=
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <leader>con :set clipboard=unnamedplus<CR>
nnoremap <leader>coff :set clipboard=<CR>

" Functions
function! OnBattery()
  if empty(glob('/sys/class/power_supply/AC/online'))
    return 0
  endif

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

if OnBattery()
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

" better whitespace
let g:better_whitespace_enabled=1

" nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
