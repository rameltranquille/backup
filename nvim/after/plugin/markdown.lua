-- vim.g.vim_markdown_folding_level = 3
-- vim.g.vim_markdown_emphasis_multiline = 3
-- vim.g.vim_markdown_folding_level = 5
-- vim.g.vim_markdown_edit_url_in = 'tab'
-- vim.g.vim_markdown_follow_anchor = 1
-- vim.g.vim_markdown_no_extensions_in_markdown = 0
-- vim.g.vim_markdown_math = 1
-- vim.g.vim_markdown_autowrite = 1
-- vim.g.vim_markdown_toc_autofit = 1

vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 0
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_browser = 'chromium'
vim.g.mkdp_theme = 'dark'

-- VimTex
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_fold_manual = 1
vim.g.vimtex_view_quickfix_ignore_filters = { 'Underfull', 'Overfull' }
vim.g.vimtex_compiler_method = 'latexmk'

vim.g.tex_conceal='abdmg'
vim.g.vimtex_toc_split = below
vim.g.vimtex_toc_config = {
    split_pos = "botright",
    split_width = 15,
}



