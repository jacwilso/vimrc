execute pathogen#infect()

filetype off                  " required
filetype plugin indent on

set t_Co=256

syntax on
colorscheme xoria256

set showmode                    " always show what mode we're currently editing in
set wildmenu
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell                  " don't beep
set noerrorbells                " don't beep
set autowrite                   "Save on buffer switch
set showcmd

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saves
nmap <leader>w :w!<cr>
nmap <leader>x :x!<cr>
" w !sudo tee >/dev/null % " sudo saves current

" Down/Up is really the next line
nnoremap j gj
nnoremap k gk

"Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Create/edit file in the current directory
nmap :ed :edit %:p:h/

"easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" SHIFT WINDOWS AROUND
" <C-w>H/J/K/L

"Resize vsplit
"nmap <C-v> :vertical resize +5<cr>
" <C-w> +/-/</>
"nmap | <C-w>|
"nmap _ <C-w>_
nmap == <C-w>=

" Open splits
nmap vs :vsplit<cr>
nmap sp :rightbelow split<cr>
nmap nt :tab split<cr>
nmap tt <C-w>T

nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>

highlight Search cterm=underline

"Other
autocmd cursorhold * set nohlsearch
autocmd cursormoved * set hlsearch

" Remove search results
command! H let @/=""

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Abbreviations
abbrev gm !php artisan make:model
abbrev gc !php artisan make:controller
abbrev gmig !php artisan make:migration

" Laravel framework commons " << LARAVEL QUICK COMMANDS
nmap lr :e routes/web.php<cr>
nmap ld :e database/migrations/
nmap lv :e resources/views/
nmap la :e app/
nmap lc :e app/Http/Controllers/
nmap js :e public/js/
nmap cs :e public/css/

" Auto-remove trailing spaces
autocmd BufWritePre *.php :%s/\s\+$//e

" Edit todo list for project
nmap <leader>todo :e ~/.todo.txt<cr>

" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/forum/**

"
"DOESN"T WORK CURRENTLY

    ""Load the current buffer in Chrome
    "nmap ,c :!open -a Google\ Chrome<cr>


" Powerline (Fancy thingy at bottom stuff)
"source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
source ~/.vim/plugins/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set guifont=Source\ Code\ Pro\ for\ Powerline
"Inconsolata\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 " Necessary to show Unicode glyphs
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Vawa
source ~/.vim/bundle/vawa/vawa.vim
let g:vawahl="ctermbg=black ctermfg=red guifg=#ff0000 guibg=#ffffff gui=bold"

" NERDTreeToggle
autocmd VimEnter * NERDTree | wincmd p
nmap <C-b> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
" CTRLP
set runtimepath^=~/.vim/bundle/ctrlp/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" NOT SURE BOUT THIS COMMAND
map <D-p> :CtrlP<cr> 
"map <C-r> :CtrlPBufTag<cr>
