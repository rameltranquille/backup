vim.g.vimwiki_list = { {
    path = '/home/ramel/Dropbox',
    syntax = 'markdown',
    index = 'index',
    auto_toc = 1,
    ext = '.md'
} }

vim.g.vimwiki_conceallevel = 2
vim.g.vimwiki_hl_cb_checked = 2
vim.g.vimwiki_folding = 'expr'
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_autowriteall = 1


vim.g.zettel_format = "%y%m%d-%H%M-%title-%file_no"
vim.g.zettel_options = { {}, { path = '/home/ramel/Dropbox/personal/' }, { path = '/home/ramel/Dropbox/uni/' },
    { path = '/home/ramel/Dropbox/projects/' } }

--- TASK WIKI
-- vim.g.taskwiki_disable_concealcursor=yes

-- vim.opt.conceallevel = 2
