vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
local install_path = vim.o.runtimepath
packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'}
    use { 'preservim/tagbar', cmd = 'TagbarToggle' }
    -- use { 'stevearc/aerial.nvim', }

    -- colorschemes
    use { "catppuccin/nvim",  as = 'catppuccin' }
    use { "folke/tokyonight.nvim" }
    use { "EdenEast/nightfox.nvim" }

    -- Better Typing Flow
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs' 
    use 'machakann/vim-sandwich'
    use 'tpope/vim-repeat' 
    use 'tpope/vim-unimpaired'

    use 'neovim/nvim-lspconfig' 
    use {'mfussenegger/nvim-jdtls' }
    use {'mfussenegger/nvim-dap' }
    -- use { 'kyazdani42/nvim-tree.lua', cmd = 'NvimTreeToggle'}
    use { 'kyazdani42/nvim-tree.lua' }

    -- QOF
    use 'kyazdani42/nvim-web-devicons'
    use 'wellle/context.vim' 

    -- Coding
    -- use { 'vimlab/split-term.vim', cmd = {'Term', 'VTerm'} }
    use { 'kassio/neoterm', cmd = 'Tnew' }
    use { 'p00f/cphelper.nvim', cmd = 'CphReceive' }

    use { 'ekickx/clipboard-image.nvim', cmd = 'PasteImg',
    config = function() 
        require("clipboard-image").setup({
            vimwiki = {
                img_dir = "img",
                img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
                affix = "[%s](file:%s)" -- Multi lines affix
            },
            markdown = {
                img_dir = "img", -- Use table for nested dir (New feature form PR #20)
                img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
                img_dir_txt = "img",
                affix = "[%s](file:%s)" -- Multi lines affix
            },
            latex = {
                img_dir = "img", -- Use table for nested dir (New feature form PR #20)
                img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
                img_dir_txt = "",
                affix = "\\includegraphics[scale=0.5]{%s}" -- Multi lines affix
            },
            tex = {
                img_dir = "img", -- Use table for nested dir (New feature form PR #20)
                img_name = function() return os.date('%Y-%m-%d-%H-%M') end,
                img_dir_txt = "",
                affix = "\\includegraphics[scale=0.5]{%s}" -- Multi lines affix
            }
        })
    end,
}


use {
    "max397574/better-escape.nvim",
    config = function()
        require("better_escape").setup()
    end,
}

----------- Vimwiki
    use { 'vimwiki/vimwiki', 
        ft = { 'markdown', 'vimwiki'}, 
        cmd = {'VimwikiIndex'},
        run = 'TSDisable highlight' 
    }

    ----------- Markdown & Latex
    use { 'godlygeek/tabular', ft = {'markdown', 'vimwiki'}}

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
        ft = { 'markdown', 'vimwiki' },
        cmd = "MarkdownPreview"
    })

    use { 'lervag/vimtex', ft = 'tex', run = 'TSDisable highlight' }

    use { 'jbyuki/nabla.nvim' , ft = { 'tex', 'markdown', 'vimwiki' }}

    -------------- - Telescope
    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', 
        tag = '0.1.0', }
    use {'axkirillov/easypick.nvim', 
        requires = 'nvim-telescope/telescope.nvim'}
    use {'smartpde/telescope-recent-files', 
        requires = 'nvim-telescope/telescope.nvim'}
    ------------- Completion & Snippets
    use { "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-cmdline",
            "uga-rosa/cmp-dictionary",
            "hrsh7th/cmp-nvim-lsp", -- nvim-cmp source for neovim builtin LSP client
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
          requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      }

      use {'akinsho/bufferline.nvim', 
          tag = "v2.*", 
          requires = 'kyazdani42/nvim-web-devicons'
      }

      use {'tiagovla/scope.nvim'}

      ------------- OTHER BS
      use {
          "folke/which-key.nvim",
          config = function()
              require("which-key").setup{}
          end
      }

      use {
          'sudormrfbin/cheatsheet.nvim',
          requires = {
              {'nvim-telescope/telescope.nvim'},
              {'nvim-lua/popup.nvim'},
              {'nvim-lua/plenary.nvim'},
          },
          cmd = "Cheatsheet"
      }

      use {
          'goolord/alpha-nvim',
          config = function ()
              config = function() require("config.alpha") end
          end
      }


end)



