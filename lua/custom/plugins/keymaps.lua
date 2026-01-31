-- Custom utility keymaps
-- Sets up keymaps on VeryLazy to ensure they're available after startup

vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  once = true,
  callback = function()
    -- Copy file path to clipboard
    vim.keymap.set('n', '<leader>cp', function()
      local path = vim.fn.expand '%:p'
      vim.fn.setreg('+', path)
      print('Copied: ' .. path)
    end, { desc = '[C]opy file [P]ath' })
  end,
})

-- Extend which-key with custom groups
return {
  'folke/which-key.nvim',
  opts = function(_, opts)
    opts.spec = opts.spec or {}
    vim.list_extend(opts.spec, {
      { '<leader>g', group = '[G]it' },
    })
  end,
}
