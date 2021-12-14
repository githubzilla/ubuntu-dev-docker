syntax on
"== show relative line number
set number relativenumber
"== highlight the word at cursor in obvious way
set termguicolors
"== expand tab to space
set expandtab
set shiftwidth=4
"== mouse 
set mouse=a

call plug#begin()

"== vim-startify
Plug 'mhinz/vim-startify'

"== autosave
Plug '907th/vim-auto-save'

"== nerdtree
Plug 'preservim/nerdtree'

"== ranger.vim
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

"== nvim-tree
"Plug 'kyazdani42/nvim-web-devicons'  for file icons
"Plug 'kyazdani42/nvim-tree.lua'

"== vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

"== nerdcommenter
Plug 'preservim/nerdcommenter'

"== autopair
Plug 'chun-yang/auto-pairs'

"== tabular
Plug 'godlygeek/tabular'

"== markdown
Plug 'tpope/vim-markdown'
"== markdown-preview
Plug 'JamshedVesuna/vim-markdown-preview'
"== open-browser
Plug 'tyru/open-browser.vim'

"== dash
Plug 'rizzatti/dash.vim'

"== telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-raw.nvim'

"== treesitter, disabled since it's not work under coc.vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

"== lsp signature, disabled since it not work under coc.vim
Plug 'ray-x/lsp_signature.nvim'

"Plug plantuml-syntax
Plug 'aklt/plantuml-syntax'

"== sneak
Plug 'justinmk/vim-sneak'

"== file local history
Plug 'dinhhuy258/vim-local-history', {'branch': 'master', 'do': ':UpdateRemotePlugins'}

"== rust-tools
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
" See hrsh7th's other plugins for more completion sources!
" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" Snippet engine
Plug 'hrsh7th/vim-vsnip'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Debug -- don't use dap, it's kind of premature
"Plug 'mfussenegger/nvim-dap'
"Plug 'rcarriga/nvim-dap-ui'
" navigator - conflict with other lsp plugins
"Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
"Plug 'ray-x/navigator.lua'

" vimspector
Plug 'puremourning/vimspector'

"== rust.vim
Plug 'rust-lang/rust.vim'

"== which key
Plug 'folke/which-key.nvim'

"== vista function/variable outline
Plug 'liuchengxu/vista.vim'

"== ctrlspace
Plug 'vim-ctrlspace/vim-ctrlspace'

"== unimpaired
Plug 'tpope/vim-unimpaired'

"== vim-clap
" Build the extra binary if cargo exists on your system.
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }


call plug#end()

"== autosave.vim ==
silent! source ~/.config/nvim/autosave.vim

"== vim-airline.vim ==
silent! source ~/.config/nvim/vim-airline.vim

"== nerdtree
silent! source ~/.config/nvim/nerdtree.vim

"== nvim tree ==
"source ~/.config/nvim/nvim-tree.vim

"== ranger.vim ==
silent! source ~/.config/nvim/ranger.vim

"== nerdcommenter ==
silent! source ~/.config/nvim/nerdcommenter.vim

"== dash.vim ==
silent! source ~/.config/nvim/dash.vim

"== telescope.vim ==
silent! source ~/.config/nvim/telescope.vim

"== treesitter ==
silent! source ~/.config/nvim/treesitter.vim

"== sneak ==
silent! source ~/.config/nvim/sneak.vim

"== mundo ==
silent! source ~/.config/nvim/localhistory.vim

"== rust-tools.vim
silent! source ~/.config/nvim/rust-tools.vim

"== nvim-lspconfig
silent! source ~/.config/nvim/lspconfig.vim

"== lsp signature
silent! source ~/.config/nvim/lsp_signature.vim

"== nvim-cmp.vim
silent! source ~/.config/nvim/nvim-cmp.vim

"== navigator.vim
"silent! source ~/.config/nvim/navigator.vim

"== ccls.vim
"source ~/.config/nvim/ccls.vim

"==basic vim settings in vim.vim ==
silent! source ~/.config/nvim/vim.vim

"== which key
silent! source ~/.config/nvim/which_key.vim

"== ctrlspace
silent! source ~/.config/nvim/vim-ctrlspace.vim

"== vista
source ~/.config/nvim/vista.vim

"== vim-dap-ui
"source ~/.config/nvim/dapui.vim
"== vimspector
source ~/.config/nvim/vimspector.vim
