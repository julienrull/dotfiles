local lspconfig = require('lspconfig')
require("mason").setup()
require("mason-lspconfig").setup()
  -- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('mason-lspconfig').setup_handlers({
  function(server)
    lspconfig[server].setup({
        capabilities = capabilities
    })
  end,
})
