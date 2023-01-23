vim.opt.guicursor = "" 
vim.opt.cursorline=true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.conceallevel = 2
vim.opt.ignorecase = true
vim.opt.title = true 
vim.opt.laststatus = 3 
vim.opt.smartcase = true 
vim.opt.undofile = true
vim.opt.timeoutlen = 400

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.icm = 'split'
vim.opt.scrolloff = 8

vim.opt.winbar = "%f"

-- vim.api.nvim_command[[
--     let g:tagbar_type_tex = {'ctagstype' : 'latex','kinds' : ['s:sections','g:graphics:0:0', 'l:labels','r:refs:1:0','p:pagerefs:1:0'],'sort': 0}
-- ]]

vim.api.nvim_command[[
    autocmd ColorScheme * highlight CursorLine gui=underline 
]]

vim.api.nvim_command[[
    autocmd ColorScheme * highlight LineNr guifg=lightgrey ctermfg=lightgrey
]]
vim.api.nvim_command[[
    autocmd ColorScheme * highlight CursorLineNr guifg='#f39237' 
]]
