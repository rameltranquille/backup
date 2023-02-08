-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<space>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')

vim.g.jupytext_fmt = 'py'
-- vim.g.jupytext_style = 'hydrogen'

vim.keymap.set('n', ']x', 'ctrih/^# %%<CR><CR>')
