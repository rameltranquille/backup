---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
-- This bundles definition is the same as in the previous section (java-debug installation)
-- local bundles = {
--   vim.fn.glob("/home/ramel/.config/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", 1),
-- };

-- This is the new part
-- vim.list_extend(bundles, vim.split(vim.fn.glob("/home/ramel/.config/vscode-java-test/server/*.jar", 1), "\n"))
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`

-- require('lspconfig').setup()
-- require('lspconfig')['jdtls'].setup{
--     on_attach = function(client, bufnr)
--         require'jdtls.setup'.add_commands()
--         require'jdtls'.setup_dap()
--     end,
--         
--     flags = lsp_flags,
--     init_options = {
--         bundles = bundles,
--     }
-- }

---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
-- require('lspconfig')['pyright'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
--

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {}
    end,
    -- Next, you can provide a dedicated handler for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["jdtls"] = function ()
    --     require('lspconfig')['jdtls'].setup{
    --         on_attach = function(client, bufnr)
    --             require'jdtls.setup'.add_commands()
    --             require'jdtls'.setup_dap()
    --         end,
    --             
    --         flags = lsp_flags,
    --         init_options = {
    --             bundles = bundles,
    --         }
    --     }
    -- end
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
        spacing = 4,
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    signs = function(namespace, bufnr)
        return vim.b[bufnr].show_signs == true
    end,
    -- Disable a feature
    update_in_insert = false,
    }
)

local on_attach = function(client, bufnr)

    require'lsp_signature'.on_attach(client)

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>cf",
                       "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<leader>cf",
                       "<cmd>lua vim.lsp.buf.range_format { async = true }<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end
