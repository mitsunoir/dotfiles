call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
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

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

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

let mapleader = " "

command! RunCmd :!python %

inoremap <silent> jj <ESC>

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap <C-[> <ESC>
nnoremap <Leader>c :.w !cat - \| pbcopy<CR>
nnoremap <Leader>ac :!cat % \| pbcopy<CR>
nnoremap <Leader>r <Cmd>RunCmd<CR>
nnoremap <Leader>ld :LspDocumentDiagnostics<CR>

nnoremap <silent> <Leader>jq :%!jq '.'<Enter>
colorscheme solarized


let g:python3_host_prog = './.venv/bin/python'

" LSP configuration
" TODO `npm install -g pyright`
lua << EOF
require'lspconfig'.pyright.setup{
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        extraPaths = {vim.fn.getcwd() .. "/.venv/lib/python3.10/site-packages"},
      },
    },
  },
}
EOF

" Disable native LSP diagnostics
lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
  }
)
EOF

" LSP key mappings
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> :lua vim.lsp.buf.signature_help()<CR>


" Set completeopt for better completion experience
set completeopt=menuone,noselect

" Compe configuration
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:false

" Enable specific sources
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:false
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:false
let g:compe.source.spell = v:false
let g:compe.source.tags = v:false
let g:compe.source.snippets_nvim = v:false

inoremap <silent><expr> <C-f> compe#complete()
inoremap <silent><expr> <CR>  compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')

autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
