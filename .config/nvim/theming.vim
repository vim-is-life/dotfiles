" theming.vim

" statusline
Plug 'itchyny/lightline.vim'
let g:lightline = {} " so the colorscheme can theme lightline later

" prerequisites
set background=dark
set termguicolors

" colorscheme plugins
" to set lightline theme: let g:lightline = { 'colorscheme': 'tender' }
Plug 'dracula/vim', {'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'kaicataldo/material.vim', {'branch': 'main'}
let g:material_theme_style = 'default'
let g:material_terminal_italics = 1

