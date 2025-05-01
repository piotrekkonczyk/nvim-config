return { -- You can easily change to a different colorscheme.
  'folke/tokyonight.nvim',
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }

    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
