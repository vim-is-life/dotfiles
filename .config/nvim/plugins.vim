" plugins.vim

" utility
Plug 'editorconfig/editorconfig-vim' " editorconfig
Plug 'liuchengxu/vim-which-key' "which key setup
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'

" more utility, but creature comforts
Plug 'jeffkreeftmeijer/vim-numbertoggle' "sensible line numbering
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" misc
Plug 'w0rp/ale' "linter
