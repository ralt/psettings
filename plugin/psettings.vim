" =============================================================================
" File:          plugin/psettings.vim
" Description:   Defines main functions of the plugin.
" Author:        Florian Margaine <florian@margaine.com>
" =============================================================================

" =============================================================================
" Default functions part. Handles reading the default psettings and custom.
" =============================================================================

function! s:findPath(path, settings)
    " We have /path/to/psettings/plugin/psettings.vim
    " And we want /path/to/psettings/settings/<argument>.vim
    let l:path = split(a:path, '/')

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

    return join(l:path, '/')
endfunction

let s:current_file = expand('<sfile>')

function! Psettings(settings)
    let l:path = s:findPath(s:current_file, a:settings)

    " Read default path
    if filereadable(l:path)
        " And now source the path
        execute 'source ' . l:path
    endif

    " Read custom path added if it exists
    if exists('g:psettings_custom_path')
        if filereadable(g:psettings_custom_path)
            execute 'source ' . g:psettings_custom_path
        endif
    endif
endfunction

" =============================================================================
" Reading the .psettings file part.
" =============================================================================

" Find the .psettings file
let s:psettings_file = findfile('.psettings', '.;')

function! s:handleFile(file)
    " It crashes it the files doesn't exist
    if !empty(a:file)
        for line in readfile(a:file)
            call Psettings(line)
        endfor
    endif
endfunction

call s:handleFile(s:psettings_file)
