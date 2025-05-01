-- Oil.nvim
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
vim.keymap.set('n', '_', ':Oil .<CR>', { desc = 'Open CWD directory' })
