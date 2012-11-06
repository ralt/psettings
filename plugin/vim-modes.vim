" =============================================================================
" File:          plugin/vim-modes.vim
" Description:   Defines main functions of the plugin.
" Author:        Florian Margaine <florian@margaine.com>
" =============================================================================

let s:current_file = expand('<sfile>')

function! Mode(mode)
    " We have /path/to/vim-modes/plugin/vim-modes.vim
    " And we want /path/to/vim-modes/modes/<argument>.vim
    let l:path = split(s:current_file, '/')

    " Remove 'vim-modes.vim'
    call remove(l:path, len(l:path) - 1)

    " Remove 'plugin'
    call remove(l:path, len(l:path) - 1)

    " Append 'modes'
    call add(l:path, 'modes')

    " Append '<argument>.vim'
    call add(l:path, a:mode . '.vim')

    " Prepend empty string to have / at the beginning of joined path
    call insert(l:path, '')

    " And now source the path
    execute 'source ' . join(l:path, '/')
endfunction
