colo ir_black
set guioptions-=T	"Remove the toolbar
set cursorline		"highlight the current line


"toggle tabpage editting
let notabs = 1
nnoremap <silent> <A-`> :let notabs=!notabs<Bar>:if notabs<Bar>:tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
