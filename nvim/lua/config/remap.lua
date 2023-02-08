local map = require("utils").map

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- ------- RELOAD LUA 
map("n", "<leader>rc", ":luafile $MYVIMRC<cr>:source $HOME/.config/nvim/init.lua<cr>")

-- SIMPLE
map("n", ")", ";")
map("n", "(", ",")
map("n", ";", ":")
-- map("v", "<leader>cc", ":s/\%V\v<(.)(\w*)/\u\1\L\2/g<CR> \| `<")

vim.cmd[[
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
map('n', '<leader>crf', '<cmd>lua vim.lsp.buf.references()<CR>')
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
map("n", "<leader>x", ":qa!<cr>")  -- Quit all windows
map("n", "<leader>q", ":w<cr>:bd<cr>")  -- Quit and save buffer
map("n", "<leader>w", ":qwa<cr>")  -- Save & Quit all windows
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

-- Nvim Tree
map("n", "<leader><localleader>", ":Ex<cr>:set relativenumber<cr>")
map("n", "<C-m>", "<cmd>NvimTreeFindFileToggle<cr><cmd>setlocal relativenumber<cr>")
map("n", "<C-n>", "<cmd>NvimTreeToggle<cr><cmd>setlocal relativenumber<cr>")

-- map("n", "<C-s>", ":sav ") -- Save current file as
-- map("n", "<C-t>", ":tabnew ") -- Open New Tab
-- map("n", "<leader>t1", "1gt")
-- map("n", "<leader>t2", "2gt")
-- map("n", "<leader>t3", "3gt")
-- map("n", "<leader>t4", "4gt")
-- map("n", "<leader>t5", "5gt")
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
map("n", "<leader>ts", ":split | Tnew<cr>")
map("n", "<leader>tv", ":vsplit | Tnew<cr>")
-- map("n", "<leader>tl", "<cmd>Tclear<cr>")
-- map("n", "<leader>t<leader>", ":T ")
-- -- map("n", "<leader>ts", "<cmd>vsp | terminal<cr>")
-- map("t", "jj", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-N><C-w>h")
map("t", "<C-j>", "<C-\\><C-N><C-w>j")
map("t", "<C-k>", "<C-\\><C-N><C-w>k")
map("t", "<C-l>", "<C-\\><C-N><C-w>l")
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
--
--
-- ---- Markdown & Vimtex
-- map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>")
-- map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>")
--
-- map("n", "<leader>lc", "<cmd>VimtexCompile<cr>")
-- map("n", "<leader>lt", "<cmd>VimtexTocOpen<cr>")
-- map("n", "<leader>lo", "<cmd>VimtexTocToggle<cr>")

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

-- PYTHON
map("n", "<leader>pp", "<cmd>TREPLSendFile<cr>")
map("n", "<leader>ps", "<cmd>TREPLSendSelection<cr>")
map("n", "<leader>pl", "<cmd>TREPLSendLine<cr>")
map("v", "<leader>pp", "<cmd>TREPLSendFile<cr>")
map("v", "<leader>ps", "<cmd>TREPLSendSelection<cr>")
map("v", "<leader>pl", "<cmd>TREPLSendLine<cr>")
map("n", "<leader>pt", "<cmd>T python %<cr>")





