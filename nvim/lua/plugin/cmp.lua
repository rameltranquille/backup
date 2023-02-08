-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,noinsert,noselect'
local cmp = require 'cmp'
local compare = require 'cmp.config.compare'

local kind_mapper = { 15, 2, 3, 4, 5, 6, 7, 1, 8, 9, 10, 11, 12, 13, 14 }
local kind_mapper = require("cmp.types").lsp.CompletionItemKind
local kind_score = {
    Snippet = 1,
    Variable = 2,
    Class = 3,
    Method = 4,
    Keyword = 5,
}

cmp.setup({
    -- completion = {
    --     completeopt = 'menu,longest','noinsert'
    -- },
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    formatting = {
        format = function(entry, vim_item)

            local source = entry.source.name
            vim_item.menu = ({
                buffer = "[Buff]",
                luasnip = "[LuaSnip]",
                nvim_lsp = "[LSP]",
                latex_symbols = "[Latex]",
                -- dictionary = "[Dictionary]",
                nvim_lua = "[Lua]",
                nvim_calc = "[calc]",
                treesitter = "[TS]"
            })[entry.source.name]

            -- if source == "luasnip" or source == "nvim_lsp" or source == "dictionary" then
            if source == "luasnip" or source == "nvim_lsp" then
                vim_item.dup = 0
            end

            return vim_item
        end
    },
    sources = cmp.config.sources(
        {
        {name = 'luasnip'},
        {name = 'buffer', keyword_length = 3},
        {name = 'nvim_lsp'}, 
        },

        {
        {name = 'nvim_lua'}, 
        {name = 'path'},
        {name = 'treesitter'},
        {name = 'calc'}, 
        }
    ),

    sorting = {
        comparators = {
            compare.exact,
            compare.recently_used,
            compare.locality,
            
            -- compare.length,
            function(entry1, entry2)
                local kind1 = kind_score[kind_mapper[entry1:get_kind()]] or 100
                local kind2 = kind_score[kind_mapper[entry2:get_kind()]] or 100

                if kind1 < kind2 then 
                    return true
                end 
            end 
        },
    },
    experimental = {
        -- ghost_text = true,
    }

})

-- Require function for tab to work with LUA-SNIP
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end
local luasnip = require("luasnip")

cmp.setup({
    mapping = {
        -- ['<C-E>'] = cmp.mapping.complete(),
        ['<C-p>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"})

    }
})

-- require("cmp_dictionary").setup({
--     dic = {
--         ["markdown"] = { "/home/ramel/.config/nvim/spell/my.dict" },
--         ["vimwiki"] = { "/home/ramel/.config/nvim/spell/my.dict" },
--         ["latex"] = { "/home/ramel/.config/nvim/spell/my.dict" },
--         ["tex"] = { "/home/ramel/.config/nvim/spell/my.dict" },
--     }
-- })
