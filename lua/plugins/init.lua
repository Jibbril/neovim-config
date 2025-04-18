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

  -- Trouble, displays a tab of lsp diagnostics errors
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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

  -- Treesitter
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    run = ':TSUpdate',
  },

  -- vim easymotion/hop
  'smoka7/hop.nvim',

  -- Debug adapter protocol
  'simrat39/rust-tools.nvim',
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-dap-python',
  'jay-babu/mason-nvim-dap.nvim',
  'rcarriga/nvim-dap-ui',
  'nvim-neotest/nvim-nio',

  -- Illuminate (highlights usages of word under cursor
  'RRethy/vim-illuminate',

  -- Improve visual layout of inputs boxes
  'stevearc/dressing.nvim',

  -- Scrollbar/Minimap
  "petertriho/nvim-scrollbar",

  -- Autosave
  "Pocco81/auto-save.nvim",

  -- Rainbow csv
  {
    'cameron-wags/rainbow_csv.nvim',
    config = true,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    },
    cmd = {
      'RainbowDelim',
      'RainbowDelimSimple',
      'RainbowDelimQuoted',
      'RainbowMultiDelim'
    }
  },

  -- Nvim autotag
  "windwp/nvim-ts-autotag",

  -- Undotree
  'mbbill/undotree',

  -- Neoscroll
  'karb94/neoscroll.nvim'
})

require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.nvim-tree')
require('plugins.onedark')
require('plugins.lualine')
require('plugins.treesitter')
require('plugins.ibl')
require('plugins.comment')
require('plugins.which-key')
require('plugins.lsp')
require('plugins.nvim-cmp')
require('plugins.luasnip')
require('plugins.trouble')
require('plugins.hop')
require('plugins.dap')
require('plugins.illuminate')
require('plugins.dressing')
require('plugins.nvim-scrollbar')
require('plugins.autosave')
require('plugins.nvim-ts-autotag')
require('plugins.fugitive')
require('plugins.neoscroll')

-- vim: ts=2 sts=2 sw=2 et
