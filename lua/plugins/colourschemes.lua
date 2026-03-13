return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      vim.cmd 'colorscheme rose-pine-moon'

      vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#908caa' }) -- lines above cursor
      vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#908caa' }) -- lines below cursor
      vim.api.nvim_set_hl(0, 'LineNr', { fg = '#e0def4' }) -- current line number
    end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
        transparent = false,
        on_highlights = function(h1, colors)
          h1.LineNrAbove = { fg = '#7aa2f7' }
          h1.CursorLineNr = { fg = '#ffffff', bold = true }
          h1.LineNrBelow = { fg = '#7aa2f7' }
        end,
      }
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },
  {
    'f4z3r/gruvbox-material.nvim',
    name = 'gruvbox-material',
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
