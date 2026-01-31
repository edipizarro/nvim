-- Extend nvim-lint with additional linters

return {
  'mfussenegger/nvim-lint',
  opts = function()
    local lint = require 'lint'
    lint.linters_by_ft['javascript'] = { 'eslint_d' }
    lint.linters_by_ft['typescript'] = { 'eslint_d' }
    lint.linters_by_ft['javascriptreact'] = { 'eslint_d' }
    lint.linters_by_ft['typescriptreact'] = { 'eslint_d' }
  end,
}
