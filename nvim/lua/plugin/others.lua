-- ALPHA
-- local alpha = require("alpha")
-- require'alpha'.setup(require'alpha.themes.startify'.config)
-- vim.cmd[[autocmd User AlphaReady echo 'ready']]

-- Theme
-- vim.cmd[[colorscheme carbonfox]]
vim.cmd[[colorscheme kanagawa]]
vim.opt.background = "dark"
-- vim.cmd[[colorscheme nightfox]]
-- vim.g.catppuccin_flavour = "macchiato"
-- require("catppuccin").setup()
-- vim.cmd [[colorscheme catppuccin]]
-- vim.cmd [[colorscheme tokyonight-moon]]
-- vim.cmd [[colorscheme tokyonight-night]]
-- vim.cmd [[colorscheme tokyonight-storm]]
-- vim.cmd [[colorscheme tokyonight-day]]


-- Vim Sandwich
vim.g['sandwich#recipes'] = vim.g['sandwich#recipes']

vim.opt.termguicolors = true
require("bufferline").setup{}
require("scope").setup{}


--  Competitive Porgramming 
vim.g.cphlang = "java"
-- vim.g.cphdir = "~/Dropbox/codeForces/"
vim.g.cph_vsplit = true

vim.g.startify_session_autoload = 1
vim.g.startify_files_number = 5
vim.cmd [[ let g:startify_bookmarks = [{'s':'/home/ramel/.config/nvim/lua/config/packer.lua'}, {'s':'/home/ramel/Dropbox/uni/data_bootcamp/README.md'}, {'d':'/home/ramel/Dropbox/uni/info_tech/README.md'}, {'c':'/home/ramel/Dropbox/projects/ccc/README.md'}, {'a':'/home/ramel/Dropbox/uni/dma/README.md'}, {'b':'/home/ramel/Dropbox/uni/dim/README.md'}, {'c':'/home/ramel/Dropbox/uni/advanced_cf/README.md'} ] ]]

vim.g.netrw_bufsettings = 'noma nomod nu nobl nowrap ro'

