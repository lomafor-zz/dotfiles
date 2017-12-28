func! Foldexpr_markdown(lnum)
    let l1 = getline(a:lnum)
    if l1 =~ '^\s*$'
        return '='
    endif
    let l2 = getline(a:lnum+1)
    if  l2 =~ '^=\+\s*$'
        return '>1'
    elseif l2 =~ '^-\+\s*$'
        return '>2'
    elseif l1 =~ '^#'
        return '>'.matchend(l1, '^#\+')
    else
        return '='
    endif
endfunc

setlocal foldexpr=Foldexpr_markdown(v:lnum)
setlocal foldmethod=expr
setlocal foldlevel=0
