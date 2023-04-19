call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'lambdalisue/fern.vim'
Plug 'pechorin/any-jump.vim'

"Plug 'garbas/vim-snipmate'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'

Plug 'rust-lang/rust.vim'
Plug 'ajpaulson/julia-syntax.vim'
Plug 'jjo/vim-cue'
Plug 'luochen1990/rainbow'
Plug 'fatih/vim-go'
Plug 'shaunsingh/solarized.nvim'
Plug 'vim-skk/eskk.vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'neomake/neomake'

call plug#end()

syntax enable

set re=0
set termguicolors
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set number
set omnifunc=syntaxcomplete#Complete
set laststatus=2
set incsearch
set hlsearch
" set autoindent
" set smartindent
" set statusline=%F
" set statusline+=%m

" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}

"let g:snipMate = { 'snippet_version' : 1 }
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "vim-snippets/competitive-programming"]

" SKK setting
let g:eskk#directory = "~/.config/eskk"
"let g:eskk#dictionary = { 'path': "~/.config/eskk/my_jisyo", 'sorted': 1, 'encoding': 'utf-8',}
let g:eskk#large_dictionary = {'path': "~/.config/eskk/SKK-JISYO.L", 'sorted': 1, 'encoding': 'euc-jp',}
imap jk <Plug>(eskk:toggle)
augroup vimrc_eskk
  autocmd!
  autocmd User eskk-enable-post lmap <buffer> l <Plug>(eskk:disable)
augroup END

let g:lsp_diagnostics_echo_cursor = 1
let g:rainbow_active = 1
let g:rustfmt_autosave = 1 
let mapleader = " "

command! RunCmd :!cargo run
command! BuildCmd :!cargo build
command! FmtCmd :!rustfmt %

inoremap <silent> jj <ESC>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap <C-[> <ESC>
nnoremap <Leader>c :.w !cat - \| pbcopy<CR>
nnoremap <Leader>ac :!cat % \| pbcopy<CR>
nnoremap <Leader>r <Cmd>RunCmd<CR>
nnoremap <Leader>b <Cmd>BuildCmd<CR>
nnoremap <Leader>f <Cmd>FmtCmd<CR>
nnoremap <Leader>ld :LspDocumentDiagnostics<CR>

nnoremap <silent> <Leader>jq :%!jq '.'<Enter>
colorscheme solarized
