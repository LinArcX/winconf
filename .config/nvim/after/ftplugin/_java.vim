"function! JavaStartDebugCallback(err, port)
"  execute "cexpr! 'Java debug started on port: " . a:port . "'"
"  call vimspector#LaunchWithSettings({ "configuration": "Java Attach", "AdapterPort": a:port })
"endfunction
"
"function JavaStartDebug()
"  call CocActionAsync('runCommand', 'vscode.java.startDebugSession', function('JavaStartDebugCallback'))
"endfunction
" 
"" d
"call quickui#menu#install('Java', [
"            \ [ '&debug', "call JavaStartDebug()" ],
"            \ ], '<auto>', 'java')
