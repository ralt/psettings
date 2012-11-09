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

    let l:final_path = join(l:path, '/')

    " Read default path
    if filereadable(l:final_path)
        " And now source the path
        execute 'source ' . l:final_path
    endif

    " Read custom path added if it exists
    if exists('g:modes_custom_path')
        if filereadable(g:modes_custom_path)
            execute 'source ' . g:modes_custom_path
        endif
    endif
endfunction

" Find the .mode file
let s:mode_file = findfile('.mode', '.;')

if !empty(s:mode_file)
    for line in readfile(s:mode_file)
        call Mode(line)
    endfor
endif
