local map = require("utils").map

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- ------- RELOAD LUA
map("n", "<leader>rc", ":luafile $MYVIMRC<cr>:source $HOME/.config/nvim/init.lua<cr>")

-- SIMPLE
map("n", ")", ";")
map("n", "(", ",")
map("n", ";", ":")

vim.cmd [[
vmap <localleader>cc :s/\%V\v<(.)(\w*)/\u\1\L\2/g<CR> \| `<
]]

map('n', '<leader>cd', ':cd %:h<CR>:pwd<CR>')
-- LSP REMAPS
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '<leader>cwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>')
map('n', '<leader>cwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>')
map('n', '<leader>cwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>')
map('n', '<leader>ct', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', '<leader>cn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('v', '<leader>cc', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
map('n', '<leader>cr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>cl', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
map('n', '<leader>cs', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map('n', '<leader>cc', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>cf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')


-- QOF Stuff
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "N", "Nzzzv")
map("n", "n", "nzzzv")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("i", "jj", "<ESC>")
map("i", "jk", "<ESC>")
--- SAVING AND QUITING
map("n", "<leader>x", ":qa!<cr>") -- Quit all windows
map("n", "<leader>q", ":w<cr>:bd<cr>") -- Quit and save buffer
-- Registers
map("n", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

-- BufferLine
map("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>")
map("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>")
map("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>")
map("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>")
map("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>")
map("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>")
map("n", "]b", ":BufferLineCycleNext<cr>")
map("n", "[b", ":BufferLineCyclePrev<cr>")
map("n", "<leader>w", ":BufferLinePickClose<cr>")
map("n", "<leader>Bl", ":BufferLineCloseRight<cr>")
map("n", "<leader>Bh", ":BufferLineCloseLeft<cr>")

-- Nvim Tree
map("n", "<leader><localleader>", "<cmd>Telescope file_browser<cr>")
map("n", "<C-n>", "<cmd>Telescope file_browser<cr>")
map("n", "<C-s>", ":sav ") -- Save current file as
-- map("n", "<C-t>", ":tabnew ") -- Open New Tab
map("n", "<leader><Tab>", "<C-6>")

-- ------- TagBar
map("n", "<leader>tt", "<cmd>TagbarToggle<cr><cmd>setlocal relativenumber<cr>")
-- map("n", "<leader>tc", "<cmd>TagbarOpenAutoClose<cr><cmd>setlocal relativenumber<cr>")
map("n", "<leader>tc", "<cmd>TagbarCurrentTag<cr><cmd>setlocal relativenumber<cr>")
map("n", "<leader>tj", "<cmd>TagbarJumpNext<cr><cmd>setlocal relativenumber<cr>")
map("n", "<leader>tk", "<cmd>TagbarJumpPrev<cr><cmd>setlocal relativenumber<cr>")
map("n", "<leader>ts", "<cmd>TagbarShowTag<cr><cmd>setlocal relativenumber<cr>")
--
--
-- -- Moving Between Screens & Resizing
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>+", "<C-w>5<")
map("n", "<leader>-", "<C-w>5>")
map("n", "<leader><", "<C-w>5+")
map("n", "<leader>>", "<C-w>5-")
-- map("n", "<leader>=", "<C-w>=")
-- map("n", "<leader>_", "<C-w>|")
--
-- ---- Terminal
map("n", "<localleader>0", "<cmd>lua require'toggleterm'.exec('tasksh')<cr>")
map("n", "<localleader><localleader>", "<cmd>lua require'toggleterm'.exec('tasksh')<cr>")
map("n", "<localleader>9", "<cmd>lua require'toggleterm'.exec('btop')<cr>")
map("n", "<localleader>1", "<cmd>lua require'toggleterm'.exec('python')<cr>")
map("n", "<localleader>2", "<cmd>lua require'toggleterm'.exec('python test.py')<cr>")
-- map("n", "<localleader>4", "lua _TASKWARRIOR_TOGGLE")

map("n", "<localleader>T", "<cmd>ToggleTerm size=40 dir=~/ direction=vertical<cr>")
map("n", "<C-t>", "<cmd>ToggleTerm size=40 dir=~/ direction=vertical<cr>")

map("n", "<C-\\>", "<cmd>ToggleTerm size=40 dir=~/ direction=float<cr>")
map("n", "<localleader>tf", "<cmd>ToggleTerm size=40 dir=~/ direction=float<cr>")

map("n", "<localleader>th", "<cmd>ToggleTerm size=40 dir=~/ direction=horizontal<cr>")
map("n", "<localleader>tt", "<cmd>ToggleTerm size=40 dir=~/ direction=tab<cr>")

map("n", "<localleader>te", "<cmd>TermExec cmd=\"python %\" size=40 direction=vertical<cr>")
map("n", "<leader>ts", "<cmd>ToggleTermSendCurrentLine<cr>")
map("v", "<leader>ts", "<cmd>ToggleTermSendVisualLines<cr>")
map("v", "<localleader>ts", "<cmd>ToggleTermSendVisualSelection<cr>")

map("t", "<C-t>", "<C-\\><C-N><C-w>j")
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
--
-- ---- F KEYS
-- ---- Telescope
map("n", "<leader>n", "<cmd>Telescope file_browser<cr>")
map("n", "<leader>fn", "<cmd>Telescope file_browser<cr>")
map("n", "<leader>ff", "<cmd>Telescope fd<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>f\"", "<cmd>Telescope marks<cr>")
-- map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>fr", "<cmd>Telescope registers<cr>")
-- map("n", "<leader>ft", "<cmd>Telescope tags<cr>")
map("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>")
map("n", "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>")
--
map("n", "<leader>un", "<cmd>Easypick uni<cr>")
map("n", "<leader>b", "<cmd>Easypick bookmarks<cr>")
map("n", "<leader>eb", ":e ~/Dropbox/.bookmarks")

map("n", "<leader>to", "<cmd>VimtexTocOpen<cr>")
map("n", "<leader>l", "<cmd>VimtexView<cr>")
map("n", "]n", "<Plug>(vimtex-]n)")
map("n", "[n", "<Plug>(vimtex-[n)")

-- ---- Clipboard-Image
map("n", "<leader>pi", ":w<cr> :!gscreenshot -sc<cr> <cmd>PasteImg<cr>")
-- map("n", "<leader>pi", "<cmd>PasteImg<cr>")

map("n", "<A-o>", "<cmd>lua require'jdtls'.organize_imports()<CR>")
map("n", "crv", "<cmd>lua require('jdtls').extract_variable()<cr>")
map("v", "crv", "<Esc><cmd>lua require('jdtls').extract_variable(true)<cr>")
map("n", "crc", "<cmd>lua require('jdtls').extract_constant()<cr>")
map("v", "crc", "<Esc><cmd>lua require('jdtls').extract_constant(true)<cr>")
map("n", "crm", "<cmd>lua require('jdtls').extract_method(true)<cr>")

map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>")
map("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>")
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>")
map("n", "<leader>dq", "<cmd>lua require'dap'.step_out()<CR>")
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
map("n", "<leader>ds", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
map("n", "<leader>dd", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>")



map("n", "<leader>cp", "<cmd>Copilot panel<CR>")
map("n", "<leader>cb", "<cmd>Copilot status<CR>")
map("n", "<M-m>", "<cmd>Copilot enable<CR>")
map("n", "<C-m>", "<cmd>Copilot disable<CR>")
map("n", "<leader>cb", "<cmd>Copilot disable<CR>")

vim.cmd [[ 
        imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
        let g:copilot_no_tab_map = v:true
]]


-- Other Maps  
-- *copilot-i_CTRL-]*
-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
-- -------------
-- *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
-- -------------
-- *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)
-- -------------
-- *copilot-i_ALT-\*
-- <M-\>                   Explicitly request a suggestion, even if Copilot
-- <Plug>(copilot-suggest) is disabled.
