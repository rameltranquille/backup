-- ----------------------------------------------------------------
-- ----------------------Easy Pick---------------------------------
-- ----------------------------------------------------------------
local easypick = require("easypick")

-- only required for the example to work
local base_branch = "develop"

easypick.setup({
	pickers = {
		-- add your custom pickers here
		-- below you can find some examples of what those can look like
		-- list files inside current folder with default previewer
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "ls",
			-- the command to execute, output has to be a list of plain text entries
			command = "ls",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "important",
			-- the command to execute, output has to be a list of plain text entries
			command = "ls /home/ramel/Dropbox/important/",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "bookmarks",
			-- the command to execute, output has to be a list of plain text entries
			command = "cat /home/ramel/Dropbox/.bookmarks",
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},
	}
})


local M = {}
-- flex
-- vertical
-- cursor
-- bottom pane
-- horizaontal
-- vetical

function M.find_notes_lbs()
  require("telescope.builtin").find_files {
    prompt_title = " Find Law Notes",
    path_display = { "smart" },
    cwd = "~/Dropbox/lbs/",
    layout_strategy = "vertical",
    layout_config = { preview_width = 0.80, width = 0.50 },
  }
end

function M.find_notes_math()
  require("telescope.builtin").find_files {
    prompt_title = " Find Calc-II Notes",
    path_display = { "smart" },
    cwd = "~/Dropbox/calc2/",
    layout_strategy = "vertical",
    layout_config = { preview_width = 0.80, width = 0.50 },
  }
end

return M
