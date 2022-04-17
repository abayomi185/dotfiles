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

" open fzf without needing the command
nmap <F3> :FZF<CR>

" Copy to host clipboard
nnoremap Y "+y
vnoremap Y "+y
nnoremap yY ^"+y$

" Leader key
" map the leader to the space bar in normal mode
let mapleader = "\<Space>"
let maplocalleader = ";"

" Open file tree
let g:ranger_map_keys = 0
map <leader>t :Ranger<CR>

" Open fuzzy finder
nmap <leader>f :FZF<CR>
