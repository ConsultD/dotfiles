
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath


call plug#begin('~/.local/share/nvim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
"Plug 'w0rp/ale'
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'gorodinskiy/vim-coloresque'
Plug 'maksimr/vim-jsbeautify'

" ion shell
Plug 'vmchale/ion-vim'

" Fuzzy
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" Calendar
Plug 'itchyny/calendar.vim'

" Ansible
Plug 'erikzaadi/vim-ansible-yaml'

" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" gruvbox
Plug 'morhetz/gruvbox'

Plug 'dearrrfish/vim-applescript'

call plug#end()

source ~/.vimrc
set hidden

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_complete_done = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'python':['pyls']}

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
command W w
command BD bp | bd #
set tabstop=4

let g:rustfmt_command = "rustfmt +nightly"
let g:rustfmt_autosave = 0
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

let g:NERDTreeWinPos = "left"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"let g:ale_linters = { 'rust': ['rls']}
"let g:airline#extensions#ale#enabled = 1
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0

"autocmd BufEnter * call ncm2#enable_for_buffer()
"inoremap <expr><Tab> (pumvisible()?(empty(v:completed_item)?"\<C-n>":"\<C-y>"):"\<Tab>")
"inoremap <expr><CR> (pumvisible()?(empty(v:completed_item)?"\<CR>\<CR>":"\<C-y>"):"\<CR>")

set undodir=~/.vimdid
set undofile

map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" vimwiki
let s:uname = system("uname -s")
if s:uname == "Darwin\n"
	let g:python3_host_prog='/usr/local/bin/python3'
	let g:python2_host_prog='/usr/bin/python'
endif
if s:uname == "Linux\n"
	let g:python3_host_prog='/usr/bin/python3'
	let g:python2_host_prog='/usr/bin/python'
endif

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Folding
set foldlevelstart=8
set foldmethod=indent
set foldnestmax=15

" Tera
autocmd BufNewFile,BufRead *.tera set ft=jinja
