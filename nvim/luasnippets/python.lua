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

vim.api.nvim_set_keymap("i", "<C-E>", "<Tab><Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Tab><Plug>luasnip-next-choice", {})

ls.add_snippets("python", {

    s({
        priority = 500,
        trig = "for", 
        wordTrig = true,
    }, 
    {
        t"for", i(1, "i"), t"in", i(2, "lst"), 
        t({"", "\t"}), i(0)
    }),

    s({
        priority = 500,
        trig = "forr", 
        wordTrig = true,
    }, 
    {
        t"for", i(1, "i"), t"in range(len(", i(2, "lst"), t")):",
        t({"", "\t"}), i(0)
    }),

    s({
        priority = 500,
        trig = "while", 
        wordTrig = true,
    }, 
    {
        t"while ", i(1, "n = expression"), t":", 
        t({"", "\t"}), i(0)
    }),

    s({
        priority = 500,
        trig = "if", 
        wordTrig = true,
    }, 
    {
        t"if ", i(1, "expression"), t":",
        t({"", "\t"}), i(0)
    }),

    s({
        priority = 500,
        trig = "ifeli", 
        wordTrig = true,
    }, 
    {
        t"if ", i(1, "expression"), t":", 
        t({"", "\t"}), i(2, "pass"), 
        t({"", "elif "}), i(3, "expression"), t":",
        t({"", "\t"}), i(0)
    }),

    s({
        priority = 500,
        trig = "ifelse", 
        wordTrig = true,
    }, 
    {
        t"if ", i(1, "expression"), t":", 
        t({"", "\t"}), i(2, "pass"), 
        t({"", "else:"}), 
        t({"", "\t"}), i(0)
    }),

    s({
        priority = 500,
        trig = "ifelel", 
        wordTrig = true,
    }, 
    {
        t"if ", i(1, "expression"), t":", 
        t({"", "\t"}), i(2, "pass"), 
        t({"", "elif "}), i(3, "expression"), t":",
        t({"", "\t"}), i(4, "pass"),
        t({"", "else:"}),
        t({"", "\t"}), i(0)
    }),

    -- s({
    --     priority = 500,
    --     trig = "deffunc", 
    --     wordTrig = true,
    -- }, 
    -- {
    --     t"def ", i(1, "func"), t"(", i(2, "args"), t"):",
    --     t({"", "\t"}), i(0)
    -- }),

    s({
        priority = 500,
        trig = "def", 
        wordTrig = true,
    }, 
    {
        t"def ", i(1, "func"), t"(", i(2, "args"), t"):",
        t({"", "\t"}), i(0, "pass")
    }),

})



