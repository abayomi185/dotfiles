" cycle through completions with tab and shift tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <enter> to select an item without adding a newline
inoremap <expr> <CR> pumvisible() ? "\<c-y>" : "\<CR>"

" Trigger completions
inoremap <silent><expr> <c-space> coc#refresh()
