local handlers = require('nvim-autopairs.completion.handlers')
require('nvim-autopairs').setup({
    enable_check_bracket_line = true, -- Don't add pairs if it already have a close pairs in same line
    disable_filetype = {"TelescopePrompt", "vim"}, --
    enable_afterquote = false, -- add bracket pairs after quote
    enable_moveright = true
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', 
    cmp_autopairs.on_confirm_done({
        filetypes = {
        -- "*" is a alias to all filetypes
            ["*"] = {
                ["("] = {
                kind = {
                    cmp.lsp.CompletionItemKind.Function,
                    cmp.lsp.CompletionItemKind.Method,
                },
                handler = handlers["*"]
                }
            }
        }
    })
)
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')
local cond = require('nvim-autopairs.conds')

npairs.add_rules {

    -- before   insert  after
    --  (|)     ( |)	( | )
    Rule(' ', ' '):with_pair(function(opts)
        local pair = opts.line:sub(opts.col - 1, opts.col)
        return vim.tbl_contains({'()', '[]', '{}'}, pair)
    end), Rule('( ', ' )'):with_pair(function() return false end):with_move(
        function(opts) return opts.prev_char:match('.%)') ~= nil end):use_key(
        ')'),
    Rule('{ ', ' }'):with_pair(function() return false end):with_move(
        function(opts) return opts.prev_char:match('.%}') ~= nil end):use_key(
        '}'),
    Rule('[ ', ' ]'):with_pair(function() return false end):with_move(
        function(opts) return opts.prev_char:match('.%]') ~= nil end):use_key(
        ']'), --[===[
  arrow key on javascript
      Before 	Insert    After
      (item)= 	> 	    (item)=> { }
  --]===] Rule('%(.*%)%s*%=>$', ' {  }',
               {'typescript', 'typescriptreact', 'javascript'}):use_regex(true)
        :set_end_pair_length(2)
}

-- npairs.add_rule(Rule("$","$",{"tex", "markdown"}))
npairs.add_rules({
  -- Rule("$", "$",{"tex", "latex", "markdown"})
  Rule("$", "$",{"markdown"})
    -- don't add a pair if the next character is %
    :with_pair(cond.not_after_regex("%%"))
    -- don't add a pair if  the previous character is xxx
    :with_pair(cond.not_before_regex("xxx", 3))
    -- don't move right when repeat character
    -- :with_move(cond.none())
    -- don't delete if the next character is xx
    -- :with_del(cond.not_after_regex("xx"))
    -- disable adding a newline when you press <cr>
    :with_cr(cond.none())
  })
