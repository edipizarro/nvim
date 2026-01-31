-- Extend nvim-lint with additional linters
-- Uses init to add linters before config runs

return {
  'mfussenegger/nvim-lint',
  init = function()
    -- Register additional linters after plugin loads
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        local lint = require 'lint'
        lint.linters_by_ft['javascript'] = { 'eslint_d' }
        lint.linters_by_ft['typescript'] = { 'eslint_d' }
        lint.linters_by_ft['javascriptreact'] = { 'eslint_d' }
        lint.linters_by_ft['typescriptreact'] = { 'eslint_d' }
      end,
    })
  end,
}
