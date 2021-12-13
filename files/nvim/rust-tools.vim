" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" rust-tools setup combined into lspconfig.=vim

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
"lua <<EOF
"require('rust-tools').setup()
"EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
"lua <<EOF
"local cmp = require'cmp'
"cmp.setup({
  "-- Enable LSP snippets
  "snippet = {
    "expand = function(args)
        "vim.fn["vsnip#anonymous"](args.body)
    "end,
  "},
  "mapping = {
    "['<C-p>'] = cmp.mapping.select_prev_item(),
    "['<C-n>'] = cmp.mapping.select_next_item(),
    "-- Add tab support
    "['<S-Tab>'] = cmp.mapping.select_prev_item(),
    "['<Tab>'] = cmp.mapping.select_next_item(),
    "['<C-d>'] = cmp.mapping.scroll_docs(-4),
    "['<C-f>'] = cmp.mapping.scroll_docs(4),
    "['<C-Space>'] = cmp.mapping.complete(),
    "['<C-e>'] = cmp.mapping.close(),
    "['<CR>'] = cmp.mapping.confirm({
      "behavior = cmp.ConfirmBehavior.Insert,
      "select = true,
    "})
  "},

  "-- Installed sources
  "sources = {
    "{ name = 'nvim_lsp' },
    "{ name = 'vsnip' },
    "{ name = 'path' },
    "{ name = 'buffer' },
  "},
"})
"EOF

" Code navigation shortcuts
"nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
"nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
"nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
"nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
"nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
"nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
"nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
"nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
"nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Code action
"nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
"set updatetime=300
" Show diagnostic popup on cursor hold
"autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()

" Goto previous/next diagnostic warning/error
"nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

