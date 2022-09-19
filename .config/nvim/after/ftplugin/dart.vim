set formatoptions-=cro

let g:dart_format_on_save = 1
let g:dart_style_guide = 2
let g:loaded_syntastic_dart_dartanalyzer_checker = 0 "Improve speed

let dart_html_in_string=v:true
let dart_corelib_highlight=v:false

autocmd BufWrite * :silent !dartfmt " AutoFormat on file save
autocmd BufWrite * :silent !pgrep -f flutter_tool | xargs kill -s USR1 " Hot Reload when file save

" ced
call quickui#menu#install('Fl&utter', [
            \ [ '&commands', "CocList --input=flutter commands" ],
            \ [ '&emulators', "CocList FlutterEmulators" ],
            \ [ '&devices', "CocList FlutterDevices" ],
            \ ], '<auto>', 'dart')
