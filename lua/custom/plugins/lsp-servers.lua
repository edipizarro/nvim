-- Custom LSP servers configuration
-- Adds: gopls, pyright, ruff, terraformls

return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason-org/mason.nvim' },
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- LSP servers (use Mason package names, not lspconfig names)
        'gopls',
        'pyright',
        'ruff',
        'terraform-ls', -- Mason name for terraformls
        -- Linters
        'eslint_d',
        'markdownlint',
        -- Formatters
        'prettierd',
        'isort',
      })
    end,
  },

  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
      -- Configure additional LSP servers after lspconfig loads
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        once = true,
        callback = function()
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
      })
    end,
  },
}
