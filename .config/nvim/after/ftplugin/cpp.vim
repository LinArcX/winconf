call quickui#menu#clear('C&pp')
call quickui#menu#install('C&pp', [
            \ [ '&extract-variable', ":call ExtractVariable()" ],
            \ [ 'e&xtract-method', ":call ExtractMethod()" ],
            \ ], '<auto>', 'cpp')
