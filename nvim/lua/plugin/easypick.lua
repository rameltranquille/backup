-- ----------------------------------------------------------------
-- ----------------------Easy Pick---------------------------------
-- ----------------------------------------------------------------
local easypick = require("easypick")

-- only required for the example to work

local list = [[
<< EOF
:PackerInstall
:Telescope lsp_references
:Telescope lsp_incoming_calls
:Telescope lsp_outgoing_calls
:Telescope lsp_definitions
:Telescope lsp_implementations
:Telescope lsp_type_definitions
:Telescope find_files
:Git blame
EOF
]]

easypick.setup({
	pickers = {
		-- add your custom pickers here
		-- below you can find some examples of what those can look like
		-- list files inside current folder with default previewer
		{
			-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
			name = "uni",
			-- the command to execute, output has to be a list of plain text entries
			command = 'find /home/ramel/Dropbox/uni | grep -E ".md"',
			-- specify your custom previwer, or use one of the easypick.previewers
			previewer = easypick.previewers.default()
		},
        {
			name = "command_palette",
			command = "cat " .. list,
                        -- pass a pre-configured action that runs the command
			action = easypick.actions.nvim_command(),
                        -- you can specify any theme you want, but the dropdown looks good for this example =)
			opts = require('telescope.themes').get_dropdown({})
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

