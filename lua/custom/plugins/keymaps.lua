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

    -- Jump to marks using 'M' instead of the single quote key
    -- This avoids "dead key" issues on Spanish keyboard layouts
    vim.keymap.set('n', 'M', "'", { desc = 'Jump to Mark (Line)' })
    vim.keymap.set('n', 'gM', '`', { desc = 'Jump to Mark (Exact)' })
  end,
})

-- Add missing LSP keymaps on LspAttach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('custom-lsp-keymaps', { clear = true }),
  callback = function(event)
    local buf = event.buf
    local telescope = require 'telescope.builtin'

    -- Missing gr* keymaps
    vim.keymap.set('n', 'grd', telescope.lsp_definitions, { buffer = buf, desc = '[G]oto [D]efinition' })
    vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { buffer = buf, desc = '[G]oto [D]eclaration' })
    vim.keymap.set('n', 'gO', telescope.lsp_document_symbols, { buffer = buf, desc = 'Document Symbols' })
    vim.keymap.set('n', 'gW', telescope.lsp_dynamic_workspace_symbols, { buffer = buf, desc = 'Workspace Symbols' })

    -- Diagnostic keymaps
    vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, { buffer = buf, desc = '[L]int [E]rror (diagnostic)' })
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { buffer = buf, desc = '[L]int [Q]uickfix list' })
  end,
})

-- Extend which-key with custom groups
return {
  'folke/which-key.nvim',
  opts = function(_, opts)
    opts.spec = opts.spec or {}
    vim.list_extend(opts.spec, {
      { '<leader>g', group = '[G]it' },
      { '<leader>l', group = '[L]int/LSP' },
      { 'M', group = 'Jump to Mark' },
    })
  end,
}
