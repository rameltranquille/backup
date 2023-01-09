-- ALPHA
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
require'alpha'.setup(require'alpha.themes.startify'.config)
vim.cmd[[autocmd User AlphaReady echo 'ready']]


-- Theme
vim.opt.background = "dark"
-- vim.cmd[[colorscheme nightfox]]
vim.cmd[[colorscheme carbonfox]]

-- vim.g.catppuccin_flavour = "macchiato"
-- require("catppuccin").setup()
-- vim.cmd [[colorscheme catppuccin]]

-- vim.cmd [[colorscheme tokyonight-moon]]
-- vim.cmd [[colorscheme tokyonight-night]]
-- vim.cmd [[colorscheme tokyonight-storm]]
-- vim.cmd [[colorscheme tokyonight-day]]

-- Nvim Tree
-- require("nvim-tree").setup() 
vim.cmd[[
    au BufWinEnter NvimTree setlocal rnu
]]
-- Vim Sandwich
vim.g['sandwich#recipes'] = vim.g['sandwich#recipes']

vim.opt.termguicolors = true
require("bufferline").setup{}
require("scope").setup{}

--  Competitive Porgramming 
vim.g.cphlang = "java"
vim.g.cphdir = "~/Dropbox/codeForces/"
vim.g.cph_vsplit = true

