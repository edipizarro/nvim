-- nvim-ufo - better folding with preview

return {
  'kevinhwang91/nvim-ufo',
  dependencies = { 'kevinhwang91/promise-async' },
  event = 'BufRead',
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    { 'zK', function() require('ufo').peekFoldedLinesUnderCursor() end, desc = 'Peek folded lines' },
  },
  opts = {
    provider_selector = function() return { 'treesitter', 'indent' } end,
  },
  init = function()
    vim.opt.foldcolumn = '0'
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true
  end,
}
