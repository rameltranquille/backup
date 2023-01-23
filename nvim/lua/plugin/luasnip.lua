local ls = require("luasnip")
local sn = ls.snippet_node
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local s = ls.snippet
local i = ls.insert_node
local r = require("luasnip.extras").rep

-- Every unspecified option will be set to the default.
ls.config.set_config({
    history = false, -- not sure if this is a good change
    update_events = "TextChanged,TextChangedI",
    ext_base_prio = 200,
    ext_prio_increase = 1,
    enable_autosnippets = true,
    region_check_events = 'InsertEnter',
})

rec_ls = function()
	return sn(nil, {
		c(1, {
			t({""}),
			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
		}),
	});
end
    
-- require("luasnip.loaders.from_lua").load({path = "~/.config/nvim/lua/luasnippets/"})
require("luasnip.loaders.from_lua").load()
require("luasnip.loaders.from_vscode").load({ exclude = {"markdown", "latex", "tex", "md"}, include = {"java", "sh", "python"} })

-- require'luasnip'.filetype_extend("ruby", {"rails"})

-- require("luasnip.loaders.from_vscode").lazy_load()

local date_input = function(args, snip, old_state, fmt)
	local fmt = fmt or "%Y-%m-%d"
	return sn(nil, i(1, os.date(fmt)))
end
