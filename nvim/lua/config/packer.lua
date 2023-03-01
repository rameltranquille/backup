-- vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
-- local install_path = vim.o.runtimepath
-- packer_bootstrap = vim.fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
--         install_path })

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'

        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
            config = function()
                require("plugin.treesitter")
            end
        }

        use { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood' }
        use { 'preservim/tagbar', cmd = 'TagbarToggle' }

        use { "EdenEast/nightfox.nvim" }
        use { "rebelot/kanagawa.nvim" }

        -- Better Typing Flow
        use 'numToStr/Comment.nvim'
        use { 'Pocco81/true-zen.nvim',
            config = function()
                require("plugin.true-zen")
            end
        }

        use 'lewis6991/impatient.nvim'
        use 'windwp/nvim-autopairs'
        use 'machakann/vim-sandwich'
        use 'tpope/vim-repeat'
        use 'tpope/vim-eunuch'
        use 'tpope/vim-unimpaired'

        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "ray-x/lsp_signature.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            requires = { "williamboman/mason.nvim" },
        }
        use { 'mfussenegger/nvim-jdtls', ft = 'java' }
        use { 'mfussenegger/nvim-dap' }
        use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
        -- use {'mfussenegger/nvim-dap-python' }

        -- QOF
        use 'nvim-tree/nvim-web-devicons'
        use 'wellle/context.vim'

        -- Coding
        use { 'GCBallesteros/jupytext.vim' }
        use { 'hkupty/iron.nvim',
            config = function()
                require("plugin.iron")
            end,
        }

        use { 'akinsho/toggleterm.nvim',
            config = function()
                require("plugin.toggleterm")
            end
        }
        use { 'p00f/cphelper.nvim', cmd = 'CphReceive' }

        use { 'ekickx/clipboard-image.nvim', cmd = 'PasteImg',
            config = function()
                require("")
            end,
        }


        use {
            'AckslD/nvim-FeMaco.lua',
            config = 'require("femaco").setup()',
            cmd = { 'FeMaco' }
        }

        --------- Vimwiki
        use {
            'vimwiki/vimwiki',
            'michal-h21/vim-zettel',
            cmd = { 'VimwikiIndex', 'ZettelNew' },
            ft = { 'markdown', 'vimwiki' },
            run = 'TSDisable highlight',
            config = function()
                require("plugin.vimwiki")
            end
        }

        use { 'junegunn/fzf' }

        ----------- Markdown & Latex
        use { 'godlygeek/tabular', ft = { 'markdown', 'vimwiki' } }

        use({
            "iamcco/markdown-preview.nvim",
            run = function() vim.fn["mkdp#util#install"]() end,
            ft = { 'markdown', 'vimwiki' },
            cmd = "MarkdownPreview"
        })

        use { 'lervag/vimtex', ft = 'tex', run = 'TSDisable highlight' }

        -------------- - Telescope
        use 'nvim-lua/plenary.nvim'
        use { 'nvim-telescope/telescope.nvim',
            tag = '0.1.0', }
        use { 'axkirillov/easypick.nvim',
            requires = 'nvim-telescope/telescope.nvim',
            config = function()
                require("plugin.easypick")
            end
        }
        use { 'nvim-telescope/telescope-file-browser.nvim',
            requires = 'nvim-telescope/telescope.nvim',
            -- cmd = 'Easypick'
        }
        use { 'smartpde/telescope-recent-files',
            requires = 'nvim-telescope/telescope.nvim' }
        ------------- Completion & Snippets
        use { "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-cmdline",
                "uga-rosa/cmp-dictionary",
                "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
                "ray-x/lsp_signature.nvim",
                "hrsh7th/cmp-nvim-lua", -- nvim-cmp source for nvim lua
                "hrsh7th/cmp-buffer", -- nvim-cmp source for buffer words.
                "hrsh7th/cmp-path", -- nvim-cmp source for filesystem paths.
                "hrsh7th/cmp-calc", -- nvim-cmp source for math calculation.
                "ray-x/cmp-treesitter" --nvim-cmp source for treesitter
            },
            config = [[ require('plugin.cmp') ]]
        }
        use 'saadparwaiz1/cmp_luasnip' -- luasnip completion source for nvim-cmp

        use {
            "L3MON4D3/LuaSnip",
            requires = {
                "hrsh7th/nvim-cmp",
                "rafamadriz/friendly-snippets"
            },
            config = [[ require('plugin.luasnip') ]]
        }

        use { "rafamadriz/friendly-snippets",
            requires = {
                "L3MON4D3/LuaSnip",
            },
        }

        ----------- Tabs & Buffers
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons', opt = true },
            config = function()
                require("plugin.lualine")
            end
        }

        use { 'akinsho/bufferline.nvim',
            tag = "v2.*",
            requires = 'nvim-tree/nvim-web-devicons'
        }

        use { 'tiagovla/scope.nvim' }

        ------------- OTHER BS
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {}
            end
        }

        use { 'mhinz/vim-startify' }

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
