" SPDX-FileCopyrightText: 2021 k4leg <python.bogdan@gmail.com>
"
" SPDX-License-Identifier: CC0-1.0

call plug#begin()
Plug 'vim-airline/vim-airline', {'commit': 'b861f9d2483a8b066f7b5b4dbae8990ff21455c5'}

Plug 'preservim/nerdtree', {'commit': 'de0e2edeac61039d8c9fb01a43b0305baad0a28b'}

Plug 'tpope/vim-surround', {'commit': 'f51a26d3710629d031806305b6c8727189cd1935'}

Plug 'wellle/targets.vim', {'commit': '4a5e9c09ec2ba63c8cd16b433453e41c22efab22'}

Plug 'neovim/nvim-lspconfig', {'commit': '7d6e2211571029ace6ddeefed7df18e4dc51274f'}
Plug 'haorenW1025/completion-nvim', {'commit': '22624f0aa5d1fdd0c84456300d2390b223c1a226'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'commit': '9e147d23566f58f2da6682242ffb89cb0de426b5'}

Plug 'easymotion/vim-easymotion', {'commit': 'd75d9591e415652b25d9e0a3669355550325263d'}

Plug 'tpope/vim-commentary', {'commit': '349340debb34f6302931f0eb7139b2c11dfdf427'}

Plug 'luochen1990/rainbow', {'commit': '4d15633cdaf61602e1d9fd216a77fc02e0881b2d'}

Plug 'ervandew/supertab', {'commit': 'f0093ae12a9115498f887199809a6114659fc858'}

Plug 'honza/vim-snippets', {'commit': 'f1b72d866d6564075a8b0da1f179c0b7de723131'}
Plug 'SirVer/ultisnips', {'commit': '8803960a4e09daf1ad4d82e16a25bbdb4c78530e'}

Plug 'KeitaNakamura/tex-conceal.vim', {'commit': '822712d80b4ad5bc5c241ab0a778ede812ec501f'}
Plug 'lervag/vimtex', {'commit': '607956c431fc00ffe752c61debc80ac95293ca5b'}

Plug 'marko-cerovac/material.nvim', {'commit': '5f9d88930fc1a40dc8d419da830dae3d9aae5b80'}

Plug 'baskerville/vim-sxhkdrc', {'for': 'sxhkdrc', 'commit': '7b8abc305ba346c3af7d57da0ebec2b2f2d3f5b0'}
call plug#end()

set tabstop=4 shiftwidth=4 expandtab smartindent
set number relativenumber
set list
set breakindent

autocmd FileType yaml,nix setlocal tabstop=2 shiftwidth=2
autocmd FileType tex setlocal spell spelllang=ru_ru,en_us textwidth=79

filetype plugin on
filetype indent on
filetype on
syntax on

nmap <ESC> :nohlsearch<CR>
cabbrev W w!
cabbrev Q q!
inoremap <C-l> <C-g>u<ESC>[s1z=`]a<C-g>u

set langmap+=фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
set langmap+=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ
set langmap+=ЖжЭэХхЪъБЮю;\:\;\"\'{[}]<>.

" Plugins
"" preservim/nerdtree
nmap <F2> :NERDTreeToggle<CR>

"" haorenW1025/completion-nvim
lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
set completeopt=menuone,noinsert,noselect
set shortmess+=c
let g:completion_enable_snippet = 'UltiSnips'

"" nvim-treesitter/nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash", "c", "comment", "cpp", "css", "dockerfile", "html", "json",
    "latex", "python", "regex", "toml", "yaml"
  },
  highlight = { enable = true },
  indent = { enable = true }
}
EOF
set foldlevel=1000000 foldmethod=expr foldexpr=nvim_treesitter#foldexpr()

"" easymotion/vim-easymotion
let g:EasyMotion_leader_key = '<SPACE>'

"" tpope/vim-commentary
autocmd FileType c,cpp setlocal commentstring=//\ %s

"" luochen1990/rainbow
let g:rainbow_active = v:true

"" ervandew/supertab
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabContextDefaultCompletionType = '<C-n>'
let g:SuperTabMappingTabLiteral = '<C-t>'

"" SirVer/ultisnips
let g:UltiSnipsExpandTrigger = '<TAB>'
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'

"" KeitaNakamura/tex-conceal.vim
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"" lervag/vimtex
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
let g:vimtex_view_method='zathura'

"" marko-cerovac/material.nvim
let g:material_style = 'darker'
let g:material_italic_comments = v:true
let g:material_disable_background = v:true
colorscheme material
