local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

-- vim.api.nvim_set_keymap("i", "<C-E>", "<Tab><Plug>luasnip-next-choice", {})
-- vim.api.nvim_set_keymap("s", "<C-E>", "<Tab><Plug>luasnip-next-choice", {})

ls.add_snippets("all", {

    --- Date
    s("year", { extras.partial(os.date, "%Y") }),
    s("day", { extras.partial(os.date, "%A") }),
    s("date", { extras.partial(os.date, "%m/%d") }),
    s("date_full", { extras.partial(os.date, "%m/%d/%Y") }),
    s("month", { extras.partial(os.date, "%B") }),
    s("time", { extras.partial(os.date, "%H:%I:%M") }),

    -------------------------
    ---AUTO
    -------------------------
    s({ priority = 100,
        trig = "teh", 
        snippetType = "autosnippet",
        regTrig = false,
        wordTrig = true, 
        }, 
        { t"the", i(0), }
    ),
    
    
    
})
