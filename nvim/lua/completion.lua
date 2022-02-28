local lspkind = require "lspkind"

local lspconfig = require "lspconfig"

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  require('completion').on_attach()
end

local servers = {'zls', 'rust_analyzer'}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
		on_attach = on_attach,
  }
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require "cmp"

cmp.setup {
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
     	["<Tab>"] = function(fallback)
			  if cmp.visible() then
		      cmp.select_next_item()
			  else
			    fallback()
			  end
			end,
			["<S-Tab>"] = function(fallback)
			  if cmp.visible() then
			    cmp.select_prev_item()
			  else
			    fallback()
			  end
			end,
		},

    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },

		snippet = {
				expand = function(args) 
				    require("luasnip").lsp_expand(args.body)
				end,
		},

		formatting = {
		  format = lspkind.cmp_format {
		    with_text = true,
        menu = {
				  buffer = "[BUF]",
			 	  nvim_lsp = "[LSP]",
          nvim_lua = "[API]",
          path = "[path]",
          luasnip = "[snip]",
        },
      },
    },

		experimental = {
      native_menu = false,

			ghost_text = true,
		},
}
