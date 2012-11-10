" =============================================================================
" File:          plugin/psettings.vim
" Description:   Defines main functions of the plugin.
" Author:        Florian Margaine <florian@margaine.com>
" =============================================================================

let s:current_file = expand('<sfile>')

function! Psettings(settings)
    " We have /path/to/psettings/plugin/psettings.vim
    " And we want /path/to/psettings/settings/<argument>.vim
    let l:path = split(s:current_file, '/')

    " Remove 'psettings.vim'
    call remove(l:path, len(l:path) - 1)

    " Remove 'plugin'
    call remove(l:path, len(l:path) - 1)

    " Append 'settings'
    call add(l:path, 'settings')

    " Append '<argument>.vim'
    call add(l:path, a:settings . '.vim')

    " Prepend empty string to have / at the beginning of joined path
    call insert(l:path, '')

    let l:final_path = join(l:path, '/')

    " Read default path
    if filereadable(l:final_path)
        " And now source the path
        execute 'source ' . l:final_path
    endif

    " Read custom path added if it exists
    if exists('g:psettings_custom_path')
        if filereadable(g:psettings_custom_path)
            execute 'source ' . g:psettings_custom_path
        endif
    endif
endfunction

" Find the .mode file
let s:psettings_file = findfile('.psettings', '.;')

if !empty(s:psettings_file)
    for line in readfile(s:psettings_file)
        call Psettings(line)
    endfor
endif
