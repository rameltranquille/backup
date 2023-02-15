require("clipboard-image").setup({
    vimwiki = {
        img_dir = "img",
        img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
        affix = "[%s](file:%s)" -- Multi lines affix
    },
    markdown = {
        img_dir = "img", -- Use table for nested dir (New feature form PR #20)
        img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
        img_dir_txt = "img",
        affix = "[%s](file:%s)" -- Multi lines affix
    },
    latex = {
        img_dir = "img", -- Use table for nested dir (New feature form PR #20)
        img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
        img_dir_txt = "",
        affix = "\\includegraphics[scale=0.5]{%s}" -- Multi lines affix
    },
    tex = {
        img_dir = "img", -- Use table for nested dir (New feature form PR #20)
        img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
        img_dir_txt = "",
        affix = "\\includegraphics[scale=0.5]{%s}" -- Multi lines affix
    }
})
