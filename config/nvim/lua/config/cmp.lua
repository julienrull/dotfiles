require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright" },
  automatic_installation = true,
})

local lspconfig = require("lspconfig")

-- Setup Pyright with minimal distraction
require("mason-lspconfig").setup {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.documentFormattingProvider = false
      end,
      settings = {},
    }
  end,
}
-- Turn off diagnostics clutter
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
  update_in_insert = false,
})

local cmp = require('cmp')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Let LSP use cmp's capabilities
local lspconfig = require("lspconfig")
lspconfig.pyright.setup({
  capabilities = capabilities,
})
