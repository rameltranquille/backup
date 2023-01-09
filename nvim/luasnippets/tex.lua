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

local in_mathzone = function()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- local tex_utils = {}
-- tex_utils.in_mathzone = function()  -- math context detection
--   return vim.fn['vimtex#syntax#in_mathzone']() == 1
-- end
-- tex_utils.in_text = function()
--   return not tex_utils.in_mathzone()
-- end
-- tex_utils.in_comment = function()  -- comment detection
--   return vim.fn['vimtex#syntax#in_comment']() == 1
-- end
-- tex_utils.in_env = function(name)  -- generic environment detection
--     local is_inside = vim.fn['vimtex#env#is_inside'](name)
--     return (is_inside[1] > 0 and is_inside[2] > 0)
-- end
-- -- A few concrete environments---adapt as needed
-- tex_utils.in_equation = function()  -- equation environment detection
--     return tex_utils.in_env('equation')
-- end
-- tex_utils.in_itemize = function()  -- itemize environment detection
--     return tex_utils.in_env('itemize')
-- end
-- tex_utils.in_tikz = function()  -- TikZ picture environment detection
--     return tex_utils.in_env('tikzpicture')
-- end


ls.add_snippets("tex", {

    ls.parser.parse_snippet({trig = "\\"}, "\\$\\$\n\t $1 \n\\$\\$\n$0"),
    
    ls.parser.parse_snippet({trig = "**", wordTrig = true}, "\\textbf{$1}$2"),
    ls.parser.parse_snippet({trig = "bf", wordTrig = true}, "\\textbf{$1}$2"),
    ls.parser.parse_snippet({trig = "it", wordTrig = true}, "\\textit{$1}$2"),
    ls.parser.parse_snippet({trig = "*", wordTrig = true}, "\\textit{$1}$2"),
    ls.parser.parse_snippet({trig = "_", wordTrig = true}, "\\underline{$1}$2"),
    ls.parser.parse_snippet({trig = "under", wordTrig = true}, "\\underline{$1}$2"),
    ls.parser.parse_snippet({trig = "over", wordTrig = true}, "\\overline{$1}$2"),
    ls.parser.parse_snippet({trig = "emph", wordTrig = true}, "\\emph{$1}$2"),
    -- ls.parser.parse_snippet({trig = "it", wordTrig = true}, "\\item $1"),

    ls.parser.parse_snippet({trig = "beg", wordTrig = true}, "\\begin{$1}\n\t$2\n\\end{$1}"),
    ls.parser.parse_snippet({trig = "beq", wordTrig = true}, "\\begin{equation*}\n\t$1\n\\end{equation*}"),
    ls.parser.parse_snippet({trig = "bal", wordTrig = true}, "\\begin{aligned}\n\t$1\n\\end{aligned}"),
    ls.parser.parse_snippet({trig = "ab", wordTrig = true}, "\\langle $1 \\rangle"),
    ls.parser.parse_snippet({trig = "lra", wordTrig = true}, "\\leftrightarrow"),
    ls.parser.parse_snippet({trig = "la", wordTrig = true}, "\\leftarrow"),
    ls.parser.parse_snippet({trig = "ra", wordTrig = true}, "\\rightarrow"),
    ls.parser.parse_snippet({trig = "ra", wordTrig = true}, "\\rightarrow"),

    ls.parser.parse_snippet({trig = "frac", wordTrig = true}, "\\frac{$1}{$2}"),
    ls.parser.parse_snippet({trig = "frac1", wordTrig = true}, "\\frac{1}{$1}"),

    ls.parser.parse_snippet({trig = "pdv", wordTrig = true}, "\\frac{\\partial$1}{\\partial$2} $3"),
    ls.parser.parse_snippet({trig = "ddt", wordTrig = true}, "\\frac{d}{dt}"),
    ls.parser.parse_snippet({trig = "dv", wordTrig = true}, "\\frac{d$1}{d$2} $3"),
    ls.parser.parse_snippet({trig = "..", wordTrig = true}, "\\dots"),
    ls.parser.parse_snippet({trig = "dot", wordTrig = true}, "\\cdot"),
    ls.parser.parse_snippet({trig = "*", wordTrig = true}, "\\times"),
    -- ls.parser.parse_snippet({trig = "int", wordTrig = true}, "\\int $1 d$2"),
    ls.parser.parse_snippet({trig = "intd", wordTrig = true}, "\\int_{$1}^{$2} $3 \\diff$4"),
    
    ls.parser.parse_snippet({trig = "su", wordTrig = true}, "\\sum"),
    ls.parser.parse_snippet({trig = "sum", wordTrig = true}, "\\sum^{$1}_{$2} $3"),
    ls.parser.parse_snippet({trig = "sumi", wordTrig = true}, "\\sum^{\\infty}_{n=$1} $2"),

    ls.parser.parse_snippet({trig = "lim", wordTrig = true}, "\\lim_{n\\to\\infty} $1"),
    ls.parser.parse_snippet({trig = "inf", wordTrig = true}, "\\infty"),

    ls.parser.parse_snippet({trig = "it", wordTrig = true}, "\\item $1"),
    ls.parser.parse_snippet({trig = "contents", wordTrig = true}, "\\tableofcontents"),

    -- ls.parser.parse_snippet({trig = "abs", wordTrig = true}, "\\|$1\\|"),
    ls.parser.parse_snippet({trig = "part", wordTrig = true}, "\\part{$1}\n\\label{part:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sec", wordTrig = true}, 
        "\\section{$1}\n\\label{sec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sec*", wordTrig = true}, 

        "\\addtocontents{toc}{section}{$1}\\section*{$1}\n\\label{sec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "cha*", wordTrig = true}, 
        "\\addtocontents{toc}{chapter}{$1}\\chapter*{$1}\n\\label{cha:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sub*", wordTrig = true}, 
        "\\addtocontents{toc}{section}{$1}\\subsection*{$1}\n\\label{ssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "ssub*", wordTrig = true}, 
        "\\addtocontents{toc}{subsection}{$1}\\subsection*{$1}\n\\label{ssec:$1}\n$2"),

    ls.parser.parse_snippet({trig = "cha", wordTrig = true}, "\\chapter{$1}\n\\label{cha:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sub", wordTrig = true}, "\\subsection{$1}\n\\label{ssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "ssub", wordTrig = true}, "\\subsection{$1}\n\\label{ssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "sssub", wordTrig = true}, "\\subsubsection{$1}\n\\label{sssec:$1}\n$2"),
    ls.parser.parse_snippet({trig = "quest", wordTrig = true}, "\\question{$1}{\t$2}\n$3"),
    ls.parser.parse_snippet({trig = "prop", wordTrig = true}, "\\prop{$1}{\t\n$2}\n$3"),

    s("template", { 
        t({" \\documentclass[11pt]{report}",
        "\\usepackage{amsmath,amssymb,amsthm}",
        "\\usepackage{graphicx}",
        "\\usepackage{xcolor}",
        "\\usepackage{titlesec}",
        "\\usepackage[margin=1in]{geometry}",
        "\\usepackage{fancyhdr}",
        "\\graphicspath{ {./img/} }",
        "\\setlength{\\parskip}{5pt plus 1pt}",
        "\\setlength{\\headheight}{13.6pt}",
        "\\definecolor{navyblue}{rgb}{0.0, 0.2, 0.5}",
        "\\definecolor{black}{rgb}{0.0, 0.0, 0.0}",
        "\\definecolor{darkred}{rgb}{1.44, 0.41, 0.35}",
        "\\newcommand\\prop[2]{\\vspace{.25in}\\vspace{.5em}\\hrule\\color{navyblue}\\textbf{#1: }\\color{black} #2\\vspace{.5em}\\hrule\\vspace{.10in}}",
        "% \\newcommand\\prop[2]{\\vspace{.5em}\\color{navyblue}\\textbf{#1: }\\color{black} #2\\vspace{.5em}}",
        "\\newcommand\\question[2]{\\vspace{0.5em}\\textbf{#1: }#2 \\vspace{1.2in}}",
        "\\newcommand\\runtime{\\vspace{.10in}\\textbf{Running time: }}",
        "\\pagestyle{fancyplain}",
        "\\lhead{\\textbf{\\NAME\\ }}",
        "\\chead{\\textbf{Calculus II Fall 2022}}",
        "\\rhead{Professor Oveys}",
        "% \\titleformat{\\section}",
        "% {\\Large\\uppercase\\bfseries}{\\section}{1em}{}",
        "\\titleformat*{\\section}{\\pagebreak\\huge\\bfseries\\color{darkred}}",
        "\\titleformat*{\\subsection}{\\Large\\bfseries\\color{darkred}}",
        "\\titleformat",
        "{\\chapter} % command",
        "{\\bfseries\\Huge\\itshape} % format",
        "{\\Large} % label",
        "{0.5ex} % sep",
        "{ \\centering } % before-code",
        "[",
        "\\vspace{-2.5ex}%",
        "\\rule{\\textwidth}{0.3pt}",
        "] % after-code",
        "\\setcounter{tocdepth}{0}",
        "\\setcounter{secnumbdepth}{0}",
        "\\begin{document}",
        "\\newcommand\\NAME{Ramel Tranquille}",
        "\\tableofcontents",
        "\\end{document}"
        }),
        i(0),
    }),


    s("ls", {
        t({"\\begin{itemize}",
            "\t\\item "}), i(1), d(2, rec_ls, {}),
        t({"", "\\end{itemize}"}), 
        i(0)
    }),
    s("enum", {
        t({"\\begin{enumerate}",
            "\t\\item "}), i(1), d(2, rec_ls, {}),
        t({"", "\\end{enumerate}"}), 
        i(0)
    }),

    ls.parser.parse_snippet({trig = "imgnorm", wordTrig = true}, "\\includegraphics[scale=0.5\\textwidth]{$1}"),

    s("img", {
        t"\\begin{center}",
        t"\t\\includegraphics[scale=", 
        i(1, "0.5"), t"]{", 
        i(2), t".png}",
        t"\\end{center}",
        i(0)
    }),

    s("imgcap", {
        t"\\begin{center}",
        t"\t\\caption{", i(3),t"}",
        t"\t\\includegraphics[scale=", i(1), t"]{", i(2), t"}",
        t({"", "\\end{center}"}),
        i(0)
    }),

    --- MATHS
    s("int", {
        t"\\int ",
        c(1, {
            t(" "),  
            sn(nil, {i(1),  t(" \\diff x ")}),
            sn(nil, {t("_{"), i(1), t("}^{"), i(2), t("} \\diff"), i(3)}),
            sn(nil, {t"_{0}^{\\infty} ", i(1), t"\\diff x"})
        }),
        i(0),
    },
    {condition = in_mathzone}),

    s({
        priority = 100,
        trig = "bi", 
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
    }, 
    {
        t"\\bigcap", i(0)
    }, {condition = in_mathzone}),

    s({
        priority = 100,
        trig = "bu", 
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
    }, 
    {
        t"\\bigcup", i(0)
    }, {condition = in_mathzone}),

    s({
        priority = 100,
        trig = "in", 
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
    }, 
    {
        t"\\cap", i(0)
    }, {condition = in_mathzone}),

    s({
        priority = 100,
        trig = "un", 
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
    }, 
    {
        t"\\cup", i(0)
    }, {condition = in_mathzone}),

    s({
        priority = 100,
        trig = "(^)", 
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
    }, 
    {
        t"^{", i(1, "superscript"), t"} ", i(0),
    }, {condition = in_mathzone}),

    s({
        priority = 100,
        trig = "(_)", 
        snippetType = "autosnippet",
        regTrig = true,
        wordTrig = false,
    }, 
    {
        t"_{", i(1, "subscript"), t"} ", i(0),
    }, {condition = in_mathzone}),

    -- leq/geq/text{}
    s({trig = "le", 
        wordTrig = false, 
        regTrig = true, 
        snippetType = "autosnippet", 
        priority = 100
    }, 
        t"\\leq", 
    {condition = in_mathzone}),

    s({trig = "ge", 
        wordTrig = false, 
        regTrig = true, 
        snippetType = "autosnippet", 
        priority = 100
    }, 
        t"\\geq", 
    {condition = in_mathzone}),

    s({trig = "te", 
        wordTrig = false,
        regTrig = true, 
        snippetType = "autosnippet", 
        priority = 100
    }, 
    {
        t"\\text{ ",
        i(1),
        t" } ",
        i(0),
    },
    {condition = in_mathzone}),

    s({trig = "bin", 
        wordTrig = true,
        priority = 200
    }, 
    {
        t"\\binom{ ",
        i(1),
        t" }{ ",
        i(2),
        t" } ",
        i(0),
    },
    {condition = in_mathzone}),


    ls.parser.parse_snippet({trig = "mm", wordTrig = true}, "\\($1\\)$0"),
    ls.parser.parse_snippet({trig = "\\(", wordTrig = true}, "\\$$1\\$$0"),

    ls.parser.parse_snippet({trig = "=>", wordTrig = true}, "\\geq"),

    ls.parser.parse_snippet({trig = "=<", wordTrig = true}, "\\leq", {condition = in_mathzone}),

    ls.parser.parse_snippet({trig = "!=", wordTrig = true}, "\\neq", {condition = in_mathzone}),
    ls.parser.parse_snippet({trig = "neq", wordTrig = true}, "\\neq", {condition = in_mathzone}),

    ls.parser.parse_snippet({trig = "imp", wordTrig = true}, "\\implies", {condition = in_mathzone}),
    ls.parser.parse_snippet({trig = "impb", wordTrig = true}, "\\impliedby", {condition = in_mathzone}),

    ls.parser.parse_snippet({trig = "thm", wordTrig = true}, "\\begin{thm}[$1]\n\t$2\n\\end{thm}"),
    ls.parser.parse_snippet({trig = "co", wordTrig = true}, "\\code{$1}$2"),
    ls.parser.parse_snippet({trig = "me", wordTrig = true}, "\\meth{$1}$2"),
    ls.parser.parse_snippet({trig = "cl", wordTrig = true}, "\\begin{lstlisting}[language=$1]\n\t$2\n\\end{lstlisting}\n"),
    ls.parser.parse_snippet({trig = "cli", wordTrig = true}, "\\begin{lstlisting}[language=$1]\n\t{$2}\n\\end{lstlisting}\n"),
    ls.parser.parse_snippet({trig = "definition", wordTrig = true}, "\\begin{definition}[$1]\n\t$2\n\\end{definition}\n"),

})



