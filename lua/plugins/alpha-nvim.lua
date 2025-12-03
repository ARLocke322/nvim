return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'
    -- Set custom header (ASCII art)
    -- Define colors
    vim.api.nvim_set_hl(0, 'AlphaHeader1', { fg = '#cbd5f7' }) -- Light color
    vim.api.nvim_set_hl(0, 'AlphaHeader2', { fg = '#8dd8ff' }) -- Cyan
    vim.api.nvim_set_hl(0, 'AlphaHeader3', { fg = '#8cb4f9' }) -- Blue
    vim.api.nvim_set_hl(0, 'AlphaHeader4', { fg = '#c8aef9' }) -- Blue

    -- Split header into colored sections
    local header = {
      type = 'group',
      val = {
        {
          type = 'text',
          val = {
            '                                                     ',
            '                                                     ',
            '                                                     ',
            '                                                     ',
          },
          opts = { hl = 'AlphaHeader1', position = 'center' },
        },
        {
          type = 'text',
          val = {
            '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
          },
          opts = { hl = 'AlphaHeader1', position = 'center' },
        },
        {
          type = 'text',
          val = {
            '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
            '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
            '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
          },
          opts = { hl = 'AlphaHeader2', position = 'center' },
        },
        {
          type = 'text',
          val = {
            '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
          },
          opts = { hl = 'AlphaHeader3', position = 'center' },
        },
        {
          type = 'text',
          val = {
            '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
            '                                                     ',
          },
          opts = { hl = 'AlphaHeader4', position = 'center' },
        },
      },
    }

    -- Replace your dashboard.section.header with this
    dashboard.section.header = header
    vim.api.nvim_set_hl(0, 'AlphaFooter', { fg = '#8dd8ff' })
    -- 8b
    dashboard.section.footer.opts.hl = 'AlphaFooter'
    -- Set menu buttons
    dashboard.section.buttons.val = {
      dashboard.button('f', '    Find file', ':Telescope find_files <CR>'),
      dashboard.button('n', '    New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('r', '    Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('c', '    Config', ':e ~/.config/nvim/init.lua <CR>'),
      dashboard.button('s', '    Restore session', ':lua require("persistence").load() <CR>'),
      dashboard.button('q', '  󰈆  Quit', ':qa<CR>'),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.cursor = 5 -- Cursor starts after the icon (adjust as needed)
      button.opts.width = 50
      button.opts.hl = 'AlphaButtons'
      button.opts.hl_shortcut = 'AlphaShortcut'
    end
    -- Set footer
    local function footer()
      return '© Alex Locke 2025'
    end

    dashboard.section.footer.val = footer()
    local config = {
      layout = {
        { type = 'padding', val = 2 },
        header,
        { type = 'padding', val = 2 },
        dashboard.section.buttons,
        { type = 'padding', val = 1 },
        dashboard.section.footer,
      },
      opts = {
        margin = 5,
      },
    }

    -- Setup alpha with custom config
    alpha.setup(config)
    -- Send config to alpha
    --      alpha.setup(dashboard.config)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
