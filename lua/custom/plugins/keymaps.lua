-- Custom utility keymaps

return {
  -- This is a "virtual" plugin just to set up keymaps
  {
    'folke/which-key.nvim',
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { '<leader>g', group = '[G]it' },
      })
    end,
    keys = {
      {
        '<leader>cp',
        function()
          local path = vim.fn.expand '%:p'
          vim.fn.setreg('+', path)
          print('Copied: ' .. path)
        end,
        desc = '[C]opy file [P]ath',
      },
    },
  },
}
