" init.vim file by Nikhil Pattisapu

" Step1: Download a prebuilt binary version for your OS and add it in $PATH
" You can use brew install neovim
" Step2: pip install pynvim
" Step3: Install vim-plug from https://github.com/junegunn/vim-plug
" Step4: Download nodejs binary and add to $PATH (for code completion plugin)
" Step5: After removing any plugin from vimrc run :PlugClean

" =================== SPECIFIC VIM INSTRUCTIONS ==============================================================================

" Vim script treats the letter | as end of command. You can use it to write comments besides noremap
" Vim script treats the letter \ as a continuation of the previous command. Can be used to split long commands.
" Vim script uses (dot) for string concatenation (For e.g. "hello " . "world") 
" To check the values for some vim properties (e.g textwidth) you can use :set textwidth? or :colorscheme?
" To check the values of variables (e.g. let g:completor_python_binary) you can use :echo completor_python_binary
" To reload currently active .vimrc use :source $MYVIMRC

" ============================================================================================================================
" =================== Disable backgound colors (BCE) =========================================================================

if &term =~ '256color'				" disable Background Color Erase (BCE) so that color schemes
	set t_ut=				" render properly when inside 256-color tmux and GNU screen.
endif						" See https://sunaku.github.io/vim-256color-bce.html

" =================== External Vundle Plugins ================================================================================

call plug#begin()				" Vim plug begin here
Plug 'psf/black'				" Python code formatter, needs to be installed through pip install black
Plug 'scrooloose/nerdtree'			" Shows file explorer within Vim
Plug 'jistr/vim-nerdtree-tabs'			" Allows us to open files in new tab from Vim.
Plug 'vim-airline/vim-airline'			" Lean & mean status/tabline for vim that's light as air.
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion engine. Requires nodejs
Plug 'tpope/vim-surround'			" All about surroundings like parenthesis
Plug 'tpope/vim-fugitive'			" Vim plugin for git
Plug 'rafi/awesome-vim-colorschemes'		" Vim colorschemes
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'				" Fuzzy finder for vim
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'itchyny/vim-cursorword'			" Underlines the word under cursor
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }	" :Pydocstring, requires pip install doq
call plug#end()					" All plugin entries should be enclosed before this line.


" ============================================================================================================================
" =================== General Settings =======================================================================================

set nocompatible				" Use vim not vi
set t_Co=256					" show colors even when opened inside screen or tmux
set guicursor=a:block-Cursor
set termencoding=utf-8				" Set the default encoding to UTF-8.
set backspace=indent,eol,start			" Allow backspace over everything. Otherwise backspace key won't work in vim.
set autoread					" Reload file if changed externally.
set number					" Shows the line numbers by default.
set clipboard=unnamed				" Use system's clipboard (For copy and paste). Vim has a custom clipboard.
set scrolloff=999				" Ensures that your working line is always at the center (Better readability)
"set textwidth=200				" Default text width. 
set background=dark				" The default background is dark.
set termguicolors				" Add this to enable true terminal color support.
set cursorline					" Adds cursorline
colorscheme onedark				" SETTING NECESSARY. Otherwise raises errors with plugin vim-indent-guides.
set synmaxcol=10000				" Change vim's default behaviour where syntax highlight is limited to 3000 chars

syntax on					" Shows colored syntax in vim.
filetype plugin on				" Detects a FileType which is used by autocomplete and other functionalities.
filetype indent on				" Performs indentation based on Filetyoe

" ============================================================================================================================
" =================== Backup Settings ========================================================================================

set nobackup
set nowritebackup
set noswapfile

" ============================================================================================================================
" =================== Search and Regular Expressions =========================================================================

set gdefault					" RegExp global by default
set magic					" Enable extended regexes.
set hlsearch					" highlight searches
set incsearch					" show the `best match so far' astyped
set ignorecase					" make searches case-insensitive
set smartcase					" unless they contain upper-case letters
set tabpagemax=100				" Max. number of tab pages allowed to be opened
set modifiable					" Will make a buffer modifiable. set noma does the opposite

" ============================================================================================================================
" =================== Python File type specific settings =====================================================================

au FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=88
\ expandtab autoindent fileformat=unix foldmethod=indent foldnestmax=2
\ fileformat=unix completeopt-=preview colorcolumn=89 background=dark
au FileType python colorscheme gruvbox
au FileType python let g:gruvbox_termcolors=256
au FileType python let g:gruvbox_contrast_dark="soft"
au FileType python let g:pydocstring_formatter='google'
au FileType python map <leader>d :Pydocstring<CR>

" ============================================================================================================================
" =================== Latex File type specific settings ======================================================================

au FileType tex,latex,context,plaintex setlocal tabstop=4 softtabstop=4
\ shiftwidth=4 autoindent fileformat=unix wrap linebreak nolist
\ completeopt-=preview background=light

" ============================================================================================================================
" =================== RestructuredText File type specific settings ===========================================================
" Sublists in rst have to be indented with 3 spaces

au BufNewFile,BufRead *.rst setlocal tabstop=3 softtabstop=3 shiftwidth=3
\ autoindent expandtab fileformat=unix wrap linebreak nolist background=light

" au BufNewFile,BufRead *.rst colorscheme PaperColor

" ============================================================================================================================
" =================== External Plugin Related Settings =======================================================================

let NERDTreeIgnore=['\.pyc$', '\~$', '\.pdf$',
\ '\.dvi$', '__pycache__']          		" Ignore specific kinds of files and directories in NERDTree
" let NERDTreeQuitOnOpen = 1			" Close NERDTree when opening a new file.

map :mit :0r ~/.config/nvim/mit.txt		" Shortcut for MIT License
map :gnu :0r ~/.config/nvim/gnu.txt		" Shortcut for GNU GPL v3 License
map :apache :0r ~/.config/nvim/apache.txt	" Shortcut for Apache License 2.0
noremap <C-n> :NERDTreeToggle<CR>|		" Shortcut (Ctrl + n) to toggle NERDTree
noremap <S-Up> :tabr<cr>|			" Shortcut (Shift + Up) to go to the right tab
noremap <S-Down> :tabl<cr>|			" Shortcut (Shift + Down) to go to the left tab
noremap <S-Left> :tabp<cr>|			" Shortcut (Shift + Left) to go to the previous tab
noremap <S-Right> :tabn<cr>|			" Shortcut (Shift + Right) to go to the next tab
inoremap <C-n> <esc>:NERDTreeToggle<CR>|	" Shortcut in insert mode (Ctrl + n) to toggle NERDTree
inoremap <S-Up> <esc>:tabr<cr>|			" Shortcut in insert mode (Shift + Up) to go to the right tab
inoremap <S-Down> <esc>:tabl<cr>|		" Shortcut in insert mode (Shift + Down) to go to the left tab
inoremap <S-Left> <esc>:tabp<cr>|		" Shortcut in insert mode (Shift + Left) to go to the previous tab
inoremap <S-Right> <esc>:tabn<cr>|		" Shortcut in insert mode (Shift + Right) to go to the next tab


let g:indent_guides_enable_on_vim_startup = 1	" Show the visual indentation right from Vim startup. Enabled by default.
let g:completor_python_binary = $PYTHON3_PATH . "/bin/python" " Define miniconda python for completor.

" vim-slime and vim-iython-cell settings for vim + tmux
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}
let g:slime_dont_ask_default = 1
let g:slime_preserve_curpos = 0
let g:slime_cell_delimiter = "#%%"
nmap <leader>s <Plug>SlimeSendCell
"

" ============================================================================================================================
" =================== Internal Shortcuts which do not involve any external plugins ===========================================



inoremap jk <esc>|				" Shortcut (jk) for <esc>
inoremap <esc> <nop>|				" Map <esc> to no operation (<nop>)

inoremap <silent> <C-[>OC <Right>|	
inoremap <silent> <C-[>OD <Left>|
inoremap <silent> <C-[>OB <Down>|
inoremap <silent> <C-[>OA <Up>|
inoremap <silent> <C-[>OC <Right>|
inoremap <silent> <C-[>OD <Left>|
inoremap <silent> <C-[>OB <Down>|
inoremap <silent> <C-[>OA <Up>|

iabbrev @@ @author: Nikhil Pattisapu, Matching Quality, Amazon|	" Shortcut (@@) for adding signature

" ============================================================================================================================
