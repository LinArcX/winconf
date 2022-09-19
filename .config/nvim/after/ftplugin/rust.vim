set formatoptions-=cro

" Run the project
map <silent> <F5> :w<CR><Esc>:term<CR>icargo run<CR>

" Format file when save it
autocmd BufWrite * :call AutoFormat()

" nnoremap <leader>nt :vsplit<cr>:term<cr>i
let g:which_key_map.r = {
                        \ 'name' : '+Rust' ,
                        \ 'b' : [':term\<CR>icargo build\<CR>'  , 'Cargo Build']     ,
                        \ 'bn' : [':term\<CR>icargo bench\<CR>'  , 'Cargo Bench']     ,
                        \ 'c' : [':term\<CR>icargo check\<CR>'  , 'Cargo Check']     ,
                        \ 'cl' : [':term\<CR>icargo clean\<CR>'  , 'Cargo Clean']     ,
                        \ 'd' : [':term\<CR>icargo doc\<CR>'  , 'Cargo Doc']     ,
                        \ 'e' : ['ExtractVariable()'   , 'Extract Variable']     ,
                        \ 'em' : ['ExtractMethod()'   , 'Extract Method']     ,
                        \ 'f' : [':call FormatCurrentFile()\<CR>'  , 'Format Current File']     ,
                        \ 'r' : [':term\<CR>icargo run\<CR>' , 'Run'] ,
                        \ 'rr' : [':RustRun\<CR>' , 'Rust Run'] ,
                        \ 't' : [':term\<CR>icargo test\<CR>'  , 'Cargo Test']     ,
                        \ }

function! FormatCurrentFile()
    let active_buffer=@%
    exe ":!rustfmt ".active_buffer." -v --color always\<CR>"
endfunction

function! AutoFormat()
        execute "normal! mz"
        execute "normal! gg=G"
        exe "normal! 'z"
endfunction

function! GetVisualSelection()
        " Why is this not a built-in Vim script function?!
        let [line_start, column_start] = getpos("'<")[1:2]
        let [line_end, column_end] = getpos("'>")[1:2]
        let lines = getline(line_start, line_end)
        if len(lines) == 0
                return ''
        endif
        let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
        let lines[0] = lines[0][column_start - 1:]
        return join(lines, "\n")
endfunction

" Extract Variable
function! ExtractVariable()
        let var = input('variable name: ')
        execute "normal! \<S-^>ilet ".var." = "
endfunction

" Extract Method
function! ExtractMethod()
        let function_name  = inputdialog("Name of new method:")
        let return_type = inputdialog("Enter Return Type:(Default=none)")
        " Copy lines and save it to content variable
        let content = GetVisualSelection()

        " Get start_line and end_line
        let start_line = line("'<")
        let end_line = line("'>")

        " Mark Current line to jump back again
        execute "normal! kmx"
        exe "normal! ". start_line . "G"

        " Delete lines
        let j = 0
        while j < end_line - start_line +1
                d
                let j = j + 1
        endwhile
        " Call the function.
        exe "normal! i". function_name . "();\<Esc>"

        let hasReturnType = 0
        if return_type != ""
                let hasReturnType = 1
        endif
        if hasReturnType == 1
                exe "normal! Go\<CR>fn ".function_name."() -> ".return_type." {\<CR>"
        else
                exe "normal! Go\<CR>fn ".function_name."() {\<CR>"
        endif

        " Paste content to function body
        exe "normal! i" . content . "\<CR>}\<Esc>"

        " Back to saved locaiton
        exe "normal! 'x"
endfunction
