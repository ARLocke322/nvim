return {
  'luckasRanarison/nvim-devdocs',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
  keys = {
    { '<leader>o', '<cmd>DevdocsOpen<cr>', desc = 'Open DevDocs' },
  },
}
