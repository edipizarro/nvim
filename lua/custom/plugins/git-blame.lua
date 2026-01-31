-- Git Blame - show inline blame for each line

return {
  'f-person/git-blame.nvim',
  event = 'VeryLazy',
  opts = {
    enabled = true,
    message_template = ' <summary> • <date> • <author> • <<sha>>',
    date_format = '%d-%m-%Y %H:%M:%S',
    virtual_text_column = 1,
  },
  keys = {
    {
      '<leader>gb',
      function()
        local file = vim.fn.shellescape(vim.fn.expand '%')
        vim.cmd('vsplit | terminal git blame ' .. file)
      end,
      desc = '[G]it [B]lame full file',
    },
  },
}
