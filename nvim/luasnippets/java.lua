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

vim.api.nvim_set_keymap("i", "<C-p>", "<Tab><Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Tab><Plug>luasnip-next-choice", {})


ls.add_snippets("java", {

    ls.parser.parse_snippet({trig = "\\"}, "\\$\\$\n\t $1 \n\\$\\$\n$0"),
    

    ls.parser.parse_snippet({trig = "cha", wordTrig = true}, "\\chapter{$1}\n\\label{cha:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sub", wordTrig = true}, "\\subsection{$1}\n\\label{ssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "ssub", wordTrig = true}, "\\subsection{$1}\n\\label{ssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sssub", wordTrig = true}, "\\subsubsection{$1}\n\\label{sssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "quest", wordTrig = true}, "\\question{$1}{\t$2}\n$3"),
    ls.parser.parse_snippet({trig = "prop", wordTrig = true}, "\\prop{$1}{\t\n$2}\n$3"),

    s("impb", { 
        t({
        "import java.util.BufferedReader;",
        "import java.util.StringTokenizer;",
        }),
        i(0),
    }),

    ls.parser.parse_snippet({trig = "newbuff", wordTrig = true}, "BufferedReader inp = new BufferedReader(new InputStreamReader(System.in));"),
    ls.parser.parse_snippet({trig = "readint", wordTrig = true}, "int x = Integer.parseInt(inp.nextToken());"),
    ls.parser.parse_snippet({trig = "readintl", wordTrig = true}, "int y = Integer.parseInt(inp.readline());"),
    ls.parser.parse_snippet({trig = "readstr", wordTrig = true}, "String strA = br.readline();"),
    ls.parser.parse_snippet({trig = "strtoken", wordTrig = true}, "StringTokenizer str = new StringTokenizer(br.readline());"),

    -- s({
    --     priority = 100,
    --     trig = "bi", 
    --     snippetType = "autosnippet",
    --     regTrig = true,
    --     wordTrig = false,
    -- }, 
    -- {
    --     t"\\bigcap", i(0)
    -- }, {condition = in_mathzone}),
    --
    -- s({
    --     priority = 100,
    --     trig = "bu", 
    --     snippetType = "autosnippet",
    --     regTrig = true,
    --     wordTrig = false,
    -- }, 
    -- {
    --     t"\\bigcup", i(0)
    -- }, {condition = in_mathzone}),

})




