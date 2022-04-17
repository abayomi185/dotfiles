call plug#begin('~/.config/nvim/autoload/plugged')

" Better Syntax support
Plug 'sheerun/vim-polyglot'


" Auto inline and block commenting
Plug 'KarimElghamry/vim-auto-comment'


" File Explorer
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'


" Theming for status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" ALE - Asynchronous Linting Engine
" Language server client
Plug 'dense-analysis/ale'


" Rust Syntax Highligting
Plug 'rust-lang/rust.vim'


" Discord rich presence
Plug 'andweeb/presence.nvim'


" coc.nvim language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" GitHub CoPilo
Plug 'github/copilot.vim'

" LSP (Language Server Protocol) for nvim
"Plug 'neovim/nvim-lspconfig'


" Another File Explorer
Plug 'tpope/vim-vinegar' " netrw enhancer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" -----------------------------

" General configs
exe 'source' '~/.config/nvim/conf.d/general.vim'

" Mappings configs
exe 'source' '~/.config/nvim/conf.d/mappings.vim'

" Configure airline
exe 'source' '~/.config/nvim/conf.d/airline.vim'

" Configure ALE
exe 'source' '~/.config/nvim/conf.d/ale.vim'

" Set color scheme
exe 'source' '~/.config/nvim/conf.d/appearance.vim'

" Config for inbuilt File Explorer for Neovim
exe 'source' '~/.config/nvim/conf.d/netrw.vim'

" Config for CoC
exe 'source' '~/.config/nvim/conf.d/coc.vim'
