" mappings.vim

" the infamous remap
inoremap jk <Esc>

" window movement and control commands
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wk <C-w>k
nnoremap <leader>wj <C-w>j
nnoremap <leader>wq <C-w>q

" easy file saving command
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :w!<CR>

" ------------- [for window splitting and movement] ------------
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
nnoremap <silent> <leader>wsh :call WinMove('h')<CR>
nnoremap <silent> <leader>wsj :call WinMove('j')<CR>
nnoremap <silent> <leader>wsk :call WinMove('k')<CR>
nnoremap <silent> <leader>wsl :call WinMove('l')<CR>
" Quick example:
" If you press ctrl + j and there is a pane below your pane, switch to it.
" Otherwhise create a new split pane below and switch to it.

" ------------- [for fzf: fuzzy finder plugin] ------------
map \\ :Files<CR>

" thesaurus query stuff
nnoremap <leader>cwl :ThesaurusQueryLookupCurrentWord<CR>
nnoremap <leader>cwr :ThesaurusQueryReplaceCurrentWord<CR>
