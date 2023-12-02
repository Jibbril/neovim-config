-- Disable netrw (we are using nvim-tree) 
vim.g.loaded_netrw = 1 
vim.g.loaded_netrwPlugin = 1

-- UI options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- Enable sane backspace handling
vim.opt.backspace = '2'

-- Always enable window status lines
vim.opt.laststatus = 2

-- use spaces for tabs and whatnot
vim.opt.expandtab = true
vim.opt.smartindent = true

-- No vim backups, let undotree handle
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true


-- Add minium lines to top and bottom of editor
vim.opt.scrolloff = 6

-- Controls the small column to the left of the numbers of the buffer where
-- signs are displayed (debug points etc).
vim.opt.signcolumn = 'yes'

--  Modifies characters recognized as part of file names.
vim.opt.isfname:append('@-@')

-- Reduce updatetime for writing to swapfiles and the CursorHold event
vim.opt.updatetime = 60

-- Set bars at 80 and 120 characters
vim.opt.colorcolumn = '80,120'

