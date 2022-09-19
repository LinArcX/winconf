" Vim global plugin for rendering the buffer list in the tabline
scriptencoding utf-32

au BufWrite * hi TabLineSel ctermbg=065 ctermfg=007
au TextChangedI * hi TabLineSel ctermbg=210 ctermfg=236

hi TabLineSel ctermbg=065 ctermfg=007
hi TabLineFill ctermbg=239 ctermfg=237
hi TabLine ctermbg=252 ctermfg=239

hi default link BufTabLineCurrent TabLineSel
hi default link BufTabLineHidden  TabLine
hi default link BufTabLineFill    TabLineFill

let s:mpbtl_icon = 1
let s:mpbtl_numbers = 0
let s:mpbtl_separators = 1

" '['.nr2char(0x1f604).']',  0x270d, '[█]', [+]
let s:minbtl_sign_indicator = '[•]'

let s:centerbuf = winbufnr(0)
let s:dirsep = fnamemodify(getcwd(),':p')[-1:] "/

function! mpbtl#user_buffers() " help buffers are always unlisted, but quickfix buffers are not
    return filter(range(1,bufnr('$')),'buflisted(v:val) && "quickfix" !=? getbufvar(v:val, "&buftype")')
endfunction

function! mpbtl#render()
    let show_num = s:mpbtl_numbers == 1
    let show_ord = s:mpbtl_numbers == 2
    let show_mod = 1

    let bufnums = mpbtl#user_buffers()
    let centerbuf = s:centerbuf " prevent tabline jumping around when non-user buffer current (e.g. help)

     " pick up data on all the buffers
    let tabs = []
    let path_tabs = []
    let tabs_per_tail = {}
    let currentbuf = winbufnr(0)
    let screen_num = 0
    for bufnum in bufnums
        let screen_num = show_num ? bufnum : show_ord ? screen_num + 1 : ''
        let tab = { 'num': bufnum }
        let tab.hilite = currentbuf == bufnum ? 'Current' : bufwinnr(bufnum) > 0 ? 'Active' : 'Hidden'
        if currentbuf == bufnum | let [centerbuf, s:centerbuf] = [bufnum, bufnum] | endif
        let bufpath = bufname(bufnum)
        if strlen(bufpath)
            let tab.path = fnamemodify(bufpath, ':p:~:.')
            let tab.sep = strridx(tab.path, s:dirsep, strlen(tab.path) - 2) " keep trailing dirsep
            let tab.label = tab.path[tab.sep + 1:]
            let pre = ( show_mod && getbufvar(bufnum, '&mod') ? s:minbtl_sign_indicator : '' ) . screen_num
            let tab.pre = strlen(pre) ? ' '. pre : ''
            let tabs_per_tail[tab.label] = get(tabs_per_tail, tab.label, 0) + 1
            let path_tabs += [tab]
        elseif -1 < index(['nofile','acwrite'], getbufvar(bufnum, '&buftype')) " scratch buffer
            let tab.label = ( show_mod ? '!' . screen_num : screen_num ? screen_num . ' !' : '!' )
        else " unnamed file
            let tab.label = ( show_mod && getbufvar(bufnum, '&mod') ? s:minbtl_sign_indicator : '' )
                        \             . ( screen_num ? screen_num : '*' )
        endif
        let tabs += [tab]
    endfor

    " disambiguate same-basename files by adding trailing path segments
    while len(filter(tabs_per_tail, 'v:val > 1'))
        let [ambiguous, tabs_per_tail] = [tabs_per_tail, {}]
        for tab in path_tabs
            if -1 < tab.sep && has_key(ambiguous, tab.label)
                let tab.sep = strridx(tab.path, s:dirsep, tab.sep - 1)
                let tab.label = tab.path[tab.sep + 1:]
            endif
            let tabs_per_tail[tab.label] = get(tabs_per_tail, tab.label, 0) + 1
        endfor
    endwhile

    " now keep the current buffer center-screen as much as possible:
    " 1. setup
    let lft = { 'lasttab':  0, 'cut':  '.', 'indicator': '<', 'width': 0, 'half': &columns / 2 }
    let rgt = { 'lasttab': -1, 'cut': '.$', 'indicator': '>', 'width': 0, 'half': &columns - lft.half }

    " 2. sum the string lengths for the left and right halves
    let currentside = lft
    for tab in tabs
        if s:mpbtl_icon
            let tab.label = ' '.mpi#get(expand('%:t')) .' '. tab.label . get(tab, 'pre', '') . ' '
        else
             let tab.label = ' '.tab.label . get(tab, 'pre', '') . ' '
        endif
        let tab.width = strwidth(strtrans(tab.label))
        if centerbuf == tab.num
            let halfwidth = tab.width / 2
            let lft.width += halfwidth
            let rgt.width += tab.width - halfwidth
            let currentside = rgt
            continue
        endif
        let currentside.width += tab.width
    endfor
    if currentside is lft " centered buffer not seen?
        " then blame any overflow on the right side, to protect the left
        let [lft.width, rgt.width] = [0, lft.width]
    endif

    " 3. toss away tabs and pieces until all fits:
    if ( lft.width + rgt.width ) > &columns
        let oversized
                    \ = lft.width < lft.half ? [ [ rgt, &columns - lft.width ] ]
                    \ : rgt.width < rgt.half ? [ [ lft, &columns - rgt.width ] ]
                    \ :                        [ [ lft, lft.half ], [ rgt, rgt.half ] ]
        for [side, budget] in oversized
            let delta = side.width - budget
            " toss entire tabs to close the distance
            while delta >= tabs[side.lasttab].width
                let delta -= remove(tabs, side.lasttab).width
            endwhile
            " then snip at the last one to make it fit
            let endtab = tabs[side.lasttab]
            while delta > ( endtab.width - strwidth(strtrans(endtab.label)) )
                let endtab.label = substitute(endtab.label, side.cut, '', '')
            endwhile
            let endtab.label = substitute(endtab.label, side.cut, side.indicator, '')
        endfor
    endif
    let swallowclicks = '%'.(1 + tabpagenr('$')).'X'
    return swallowclicks . join(map(tabs,'printf("%%#BufTabLine%s#%s",v:val.hilite,strtrans(v:val.label))'),'') . '%#BufTabLineFill#'
endfunction

set showtabline=2
set tabline=%!mpbtl#render()
