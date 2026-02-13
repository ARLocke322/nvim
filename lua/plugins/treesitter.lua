return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  config = function()
    local treesitter = require 'nvim-treesitter'
    treesitter.setup()
    treesitter.install { 'ruby', 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'ruby', 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
