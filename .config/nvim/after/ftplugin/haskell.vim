" Run the project
map <silent> <F5> :w<CR><Esc>:term<CR>istack exec

let g:which_key_map.h = {
                        \ 'name' : '+Haskell' ,
                        \ 'b' : [':term\<CR>istack build\<CR>'  , 'Stack Build']     ,
                        \ 'bn' : [':term\<CR>istack bench\<CR>'  , 'Stack Bench']     ,
                        \ 'c' : [':term\<CR>istack clean\<CR>'  , 'Stack Clean']     ,
                        \ 'h' : [':term\<CR>istack haddock\<CR>'  , 'Stack HadDoc']     ,
                        \ 'i' : [':term\<CR>istack init\<CR>'  , 'Stack Init']     ,
                        \ 'n' : [':term\<CR>istack new\<CR>'  , 'Stack New']     ,
                        \ 's' : [':term\<CR>istack solver\<CR>'  , 'Stack Solver']     ,
                        \ 't' : [':term\<CR>istack test\<CR>'  , 'Stack Test']     ,
                        \ 'u' : [':term\<CR>istack update\<CR>'  , 'Stack Update']     ,
                        \ 'ug' : [':term\<CR>istack upgrade\<CR>'  , 'Stack Upgrade']     ,
                        \ 'e' : ['ExtractVariable()'   , 'Extract Variable']     ,
                        \ 'em' : ['ExtractMethod()'   , 'Extract Method']     ,
                        \ 'f' : [':call AutoFormat()\<CR>'  , 'Format Current File']     ,
                        \ }

" setlocal formatprg=hindent
" set formatprg=stylish-haskell

" " Format file when save it
" autocmd BufWrite * :call AutoFormat()
"
" function! AutoFormat()
"         :%!~/.local/bin/stylish-haskell
" endfunction
"
