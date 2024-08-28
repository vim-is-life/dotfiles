" language-specific.vim

" ##################### [General Writing] ########################
" 'Distraction-free writing in Vim.' according to the description.  makes everything fullscreen with `:Goyo` command
Plug 'junegunn/goyo.vim'

" dim all lines except the one you're working on, works well with Goyo
Plug 'junegunn/limelight.vim'

" thesaurus to find synonyms for words under the cursor
Plug 'ron89/thesaurus_query.vim'

" grammar checker for neovim, run `:GrammarousCheck`
Plug 'rhysd/vim-grammarous'

" powerful table editor
"   An awesome automatic table creator & formatter allowing one to create neat tables as you type.
Plug 'dhruvasagar/vim-table-mode'

" extension to show lines with the indents in your stuff
Plug 'Yggdroot/indentLine'

" prettier formatter
" 	post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }




" ##################### [Git Integrations] #####################
" fugitive.vim
" 	Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim? Either way, it's "so awesome, it should be illegal". That's why it's called Fugitive.

Plug 'tpope/vim-fugitive'



" ##################### [Markdown/Pandoc Stuff] #####################
" Pandoc Integrations

" Description
"   vim-pandoc provides facilities to integrate Vim with the pandoc document converter and work with documents written in its markdown variant (although textile documents are also supported).
Plug 'vim-pandoc/vim-pandoc'

" Description
"   Standalone pandoc syntax module, to be used alongside vim-pandoc.
Plug 'vim-pandoc/vim-pandoc-syntax'

" Mainly for compatibility with TableMode. Description:
"   Handles vim-pandoc's integration with third-party plugins.
Plug 'vim-pandoc/vim-pandoc-after'



" Markdown Stuff

" Description
"   Syntax highlighting, matching rules and mappings for the original Markdown and extensions.
Plug 'plasticboy/vim-markdown'

" markdown-preview (opens in browser)

" If you don't have nodejs and yarn
" use pre build, add 'vim-plug' to the filetype list so vim-plug can update this plugin
" see: https://github.com/iamcco/markdown-preview.nvim/issues/50
"" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" If you have nodejs and yarn
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 1

" ##################### [RMarkdown and R Stuff] ########################

" RMarkdown support for vim.
Plug 'vim-pandoc/vim-rmarkdown'

" ##################### [LaTeX Stuff] ########################

" VimTeX is a modern Vim and Neovim filetype and syntax plugin for LaTeX files.
Plug 'lervag/vimtex'

" ##################### [Python Stuff] ########################

" install jedi for python goodness
Plug 'davidhalter/jedi-vim'

" ##################### [HTML] ########################

" extension to provide emmet abbreviations for HTML in neovim
Plug 'mattn/emmet-vim'

" ##################### [Ledger] ########################
Plug 'ledger/vim-ledger'

" ##################### [Julia] ########################
Plug 'JuliaEditorSupport/julia-vim'

" ##################### [Haskell] ########################
Plug 'neovimhaskell/haskell-vim'

" ##################### [go] ########################
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
