-- Custom LSP servers configuration
-- Adds: gopls, pyright, ruff, terraformls

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        'gopls',
        'pyright',
        'ruff',
        'terraformls',
        'eslint_d', -- For linting JS/TS
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    opts = function()
      -- Configure and enable additional LSP servers
      local servers = {
        gopls = {},
        pyright = {},
        ruff = {},
        terraformls = {},
      }

      local capabilities = require('blink.cmp').get_lsp_capabilities()

      for name, server in pairs(servers) do
        server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
        vim.lsp.config(name, server)
        vim.lsp.enable(name)
      end
    end,
  },
}
