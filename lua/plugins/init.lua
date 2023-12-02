-- lazy.vim configuration
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)


-- Lazy load plugins
require('lazy').setup({
    -- Git
    'tpope/vim-fugitive',

    -- Set tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- nvim-tree
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',

    -- One Dark theme
    {
        'navarasu/onedark.nvim',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'onedark'
        end,
    },

    -- Lualine status bar
    'nvim-lualine/lualine.nvim',

    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration
            'folke/neodev.nvim',
        },
    },

    -- Autocompletion/snippets
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    -- Useful plugin to show you pending keybinds.
    { 'folke/which-key.nvim', opts = {} },

    -- Git signs
    'lewis6991/gitsigns.nvim',

    -- indent-blankline
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- See `:help ibl`
        main = 'ibl',
        opts = {},
    },

    -- Comment plugin
    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                return vim.fn.executable 'make' == 1
                end,
            },
        },
    },
})

require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.nvim-tree')
require('plugins.onedark')
require('plugins.lualine')
require('plugins.ibl')
require('plugins.comment')
require('plugins.which-key')
require('plugins.lsp')
require('plugins.nvim-cmp')
