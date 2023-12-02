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
})

require('plugins.nvim-tree')
