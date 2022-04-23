local lspconfig = require('lspconfig')

local on_attach = function(cl, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('completion').on_attach(cl, bufnr)
end

local servers = {'zls', 'rust_analyzer'}
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
  		on_attach = on_attach,
    }
end
