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




