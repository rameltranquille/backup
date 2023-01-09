local mappings = {}
local actions = require "telescope.actions"
local config = require "telescope.config"
-- Load extensions
require("telescope").load_extension("recent_files")
-- shortcut to open the picker.
vim.api.nvim_set_keymap("n", "<Leader><Leader>",
  [[<cmd>lua require('telescope').extensions.recent_files.pick()<CR>]],
  {noremap = true, silent = true})

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- ["<a-j>"] = actions.move_selection_next,
        -- ["<a-k>"] = actions.move_selection_previous
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
      }, 
      n = { },
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- bookmarks = {
    --     selected_browser = 'qutebrowser',
    --
    --     -- Either provide a shell command to open the URL
    --     url_open_command = 'open',
    --
    --     -- Or provide the plugin name which is already installed
    --     -- Available: 'vim_external', 'open_browser'
    --     url_open_plugin = 'open_browser',
    --
    --     -- Show the full path to the bookmark instead of just the bookmark name
    --     full_path = true,
    --
    --     -- Provide a custom profile name for Firefox browser
    --     firefox_profile_name = nil,
    --
    --     -- Provide debug messages
    --     debug = true,
    -- }
    recent_files = { }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}




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
