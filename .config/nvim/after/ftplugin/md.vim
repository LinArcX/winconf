let s:preview = "grip -b ". expand('%:t') ." \n"

" ;  firefox -new-tab -url http://localhost:6419/
call quickui#menu#clear('&MarkDown')
call quickui#menu#install('&MarkDown', [
            \ [ '&preview_grip', 'call HTerminal('.'0.4, 300.0, '.'"'. s:preview .'"'.')' ],
            \ ], '<auto>', 'md')
