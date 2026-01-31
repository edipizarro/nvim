-- TypeScript Tools - more memory efficient than ts_ls
-- Provides better TypeScript/JavaScript LSP support

return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
  opts = {
    settings = {
      tsserver_max_memory = 16384, -- 16GB max memory
    },
  },
}
