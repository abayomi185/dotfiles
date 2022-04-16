"============ info and reference ================
" :map -> command is mapped everywhere
" :nmap -> command is mapped only in normal mode
" :vmap -> command is mapped only in visual mode
" :imap -> command is mapped only in insert mode
" :[ivn]noremap -> forbid the remapping of the target
"   expression to avoid nested and recursive mappings

" Map WQ and W, Q so they are actually useful
:command WQ wq
:command Wq wq
:command W w
:command Q q
