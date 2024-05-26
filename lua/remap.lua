vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.keymap.set('i', 'jk', '<ESC>')
-- file tree now handled by nvim tree
-- vim.keymap.set('n', '<Leader>e', ':E<CR>')

-- For moving through splits(buffers)
vim.keymap.set('n', '<A-l>', '<C-w>l')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-h>', '<C-w>h')

-- Create vsplit
vim.keymap.set('n', '<A-t>', ':vsplit<CR>')

-- Focus on current buffer and remove the rest of them
vim.keymap.set('n', '<A-f>', '<C-w>o')























































