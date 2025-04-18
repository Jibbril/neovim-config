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
vim.opt.breakindent = true
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

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

-- Always enable mouse
vim.opt.mouse = 'a'

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Set spellchecking for Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text", "tex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end
})

-- Code folding 
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 2
vim.o.foldlevelstart = -1
vim.o.foldenable = true
vim.o.foldmethod="indent"
