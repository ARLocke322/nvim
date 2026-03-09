-- lazy.nvim
return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    lazygit = {
      -- your lazygit configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      -- your picker configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    dashboard = {
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
  },
  init = function()
    vim.keymap.set('n', '<Leader>gd', function()
      Snacks.picker.lsp_definitions()
    end, { desc = 'Goto Definition' })
    vim.keymap.set('n', '<Leader>gD', function()
      Snacks.picker.lsp_declarations()
    end, { desc = 'Goto Declaration' })
    vim.keymap.set('n', '<Leader>gr', function()
      Snacks.picker.lsp_references()
    end, { desc = 'References', nowait = true })
    vim.keymap.set('n', '<Leader>gI', function()
      Snacks.picker.lsp_implementations()
    end, { desc = 'Goto Implementation' })
    vim.keymap.set('n', '<Leader>gy', function()
      Snacks.picker.lsp_type_definitions()
    end, { desc = 'Goto T[y]pe Definition' })
    vim.keymap.set('n', '<Leader>gai', function()
      Snacks.picker.lsp_incoming_calls()
    end, { desc = 'Calls Incoming' })
    vim.keymap.set('n', '<Leader>gao', function()
      Snacks.picker.lsp_outgoing_calls()
    end, { desc = 'Calls Outgoing' })
    vim.keymap.set('n', '<Leader><leader>ss', function()
      Snacks.picker.lsp_symbols()
    end, { desc = 'LSP Symbols' })
    vim.keymap.set('n', '<Leader><leader>sS', function()
      Snacks.picker.lsp_workspace_symbols()
    end, { desc = 'LSP Workspace Symbols' })
    vim.keymap.set('n', '<Leader>lg', function()
      Snacks.lazygit.open()
    end, { desc = 'Open LazyGit' })
  end,
}
