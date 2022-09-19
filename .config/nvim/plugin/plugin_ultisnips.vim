"------------=[ Trigger configuration ]=---------------"
" Do not use <tab> if you use YouCompleteMe or coc.nvim.
let g:UltiSnipsExpandTrigger="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<S-b>"
let g:UltiSnipsJumpBackwardTrigger="<S-z>"
let g:UltiSnipsEditSplit="vertical" " If you want :UltiSnipsEdit to split your window.

"let g:UltiSnipsListSnippets="<C-y>"
"let g:UltiSnips#SnippetsInCurrentScope="<c-y>"

"let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
"inoremap <silent> <c-u> <c-r>=cm#sources#ultisnips#trigger_or_popup("\<Plug>(ultisnips_expand)")<cr>

"nnoremap <C-y> :call GetAllSnippets()<CR>

"function! ExpandPossibleShorterSnippet()
"  if len(UltiSnips#SnippetsInCurrentScope()) == 1 "only one candidate...
"    let curr_key = keys(UltiSnips#SnippetsInCurrentScope())[0]
"    normal diw
"    exe "normal a" . curr_key
"    exe "normal a "
"    return 1
"  endif
"  return 0
"endfunction
"inoremap <silent> <C-L> <C-R>=(ExpandPossibleShorterSnippet() == 0? '': UltiSnips#ExpandSnippet())<CR>
"
"function! GetAllSnippets()
"  call UltiSnips#SnippetsInCurrentScope(1)
"  let list = []
"  for [key, info] in items(g:current_ulti_dict_info)
"    let parts = split(info.location, ':')
"    call add(list, {
"      \"key": key,
"      \"path": parts[0],
"      \"linenr": parts[1],
"      \"description": info.description,
"      \})
"  endfor
"  return list
"endfunction
