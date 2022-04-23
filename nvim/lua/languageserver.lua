local lspconfig = require('lspconfig')

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('cmp').on_attach()
end

local servers = {'zls', 'rust_analyzer', 'clangd'}
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
  		on_attach = on_attach,
    }
end
