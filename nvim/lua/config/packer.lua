vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
local install_path = vim.o.runtimepath
packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ThePrimeagen/vim-be-good', cmd = 'VimBeGood'}
    use { 'preservim/tagbar', cmd = 'TagbarToggle' }

    -- colorschemes
    -- use { "catppuccin/nvim",  as = 'catppuccin' }
    -- use { "folke/tokyonight.nvim" }
    use { "EdenEast/nightfox.nvim" }

    -- Better Typing Flow
    use 'numToStr/Comment.nvim'
    use 'windwp/nvim-autopairs' 
    use 'machakann/vim-sandwich'
    use 'tpope/vim-repeat' 
    use 'tpope/vim-unimpaired'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "jose-elias-alvarez/null-ls.nvim",
    }
    -- use {'mfussenegger/nvim-jdtls' }
    use {'mfussenegger/nvim-dap' }
    use { 'nvim-tree/nvim-tree.lua', cmd = 'NvimTreeToggle',
        config = function()
            require("nvim-tree").setup()
        end
    }

    -- QOF
    use 'nvim-tree/nvim-web-devicons'
    use 'wellle/context.vim' 

    -- Coding
    -- use { 'vimlab/split-term.vim', cmd = {'Term', 'VTerm'} }
    use {'GCBallesteros/jupytext.vim' }
    use { 'hkupty/iron.nvim', 
        config = function()
            -- require('GCBallesteros/jupytext.vim').setup()
            require("iron.core").setup({
                config = {
                    -- Whether a repl should be discarded or not
                    should_map_plug = false,
                    scratch_repl = true,
                    repl_definition = {
                      python = {
                        command = { "ipython" },
                        format = require("iron.fts.common").bracketed_paste,
                      },
                    },
                -- How the repl window will be displayed
                -- See below for more information
                -- repl_open_cmd = require('iron.view').split.vertical(50),
                },
                -- Iron doesn't set keymaps by default anymore.
                -- You can set them here or manually add keymaps to the functions in iron.core
                keymaps = {
                    send_motion = "<space>sc",
                    visual_send = "<space>sc",
                    send_file = "<space>sf",
                    send_line = "<space>sl",
                    send_mark = "<space>sm",
                    mark_motion = "<space>mc",
                    mark_visual = "<space>mc",
                    remove_mark = "<space>md",
                    cr = "<space>s<cr>",
                    interrupt = "<space>s<space>",
                    exit = "<space>sq",
                    clear = "<space>cl",
                },
                  -- If the highlight is on, you can change how it looks
                  -- For the available options, check nvim_set_hl
                  highlight = {
                    italic = true
                  },
                  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
            })
        end,
    }

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
      'AckslD/nvim-FeMaco.lua',
      config = 'require("femaco").setup()',
      cmd = {'FeMaco'}
    }

--------- Vimwiki
    use { 'vimwiki/vimwiki', 
        ft = { 'markdown', 'vimwiki'}, 
        cmd = {'VimwikiIndex'},
        run = 'TSDisable highlight' 
    } 
    
    use { 'michal-h21/vim-zettel', 
        ft = { 'markdown', 'vimwiki' },
        -- cmd = {'VimwikiIndex'},
        -- run = 'VimwikiIndex',
    }
    use { 'junegunn/fzf' }

    ----------- Markdown & Latex
    use { 'godlygeek/tabular', ft = {'markdown', 'vimwiki'}}

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
    use {'axkirillov/easypick.nvim', 
        requires = 'nvim-telescope/telescope.nvim',
        -- cmd = 'Easypick'
    }
    use {'nvim-telescope/telescope-file-browser.nvim', 
        requires = 'nvim-telescope/telescope.nvim',
        -- cmd = 'Easypick'
    }
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
          requires = { 'nvim-tree/nvim-web-devicons', opt = true },
      }

      use {'akinsho/bufferline.nvim', 
          tag = "v2.*", 
          requires = 'nvim-tree/nvim-web-devicons'
      }

      use {'tiagovla/scope.nvim'}

      ------------- OTHER BS
      use {
          "folke/which-key.nvim",
          config = function()
              require("which-key").setup{}
          end
      }

    use { 'mhinz/vim-startify' }
    


end)



