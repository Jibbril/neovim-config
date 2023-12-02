-- --------------------------- General ---------------------------
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Leave insert mode
vim.keymap.set('i', 'jk', '<esc>')

-- Close buffer
vim.keymap.set('n', '<leader>c', ':bd<CR>')

-- Rebind window command
vim.keymap.set('n', '<leader>w', '<c-w>', { noremap = true })

-- Save and source file
vim.keymap.set('n', '<leader>s', ':w<Bar>so<CR>', { noremap = true })

-- Enable moving of selection
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

-- Enable line join without cursor movement
vim.keymap.set('n', 'J', 'mzJ`z')

-- Lock cursor in middle while jumping half pages
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

-- Paste over selection without  losing yank 
vim.keymap.set('x', '<leader>p', '"_dP')

--  Copy to clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('v', '<leader>y', '"+y')

-- Paste from clipboard
vim.keymap.set('n', '<leader>p', '"*p')

--  Delete to void
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Rename word under cursor
vim.keymap.set('n', '<leader>rn', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Add Empty line below
vim.keymap.set('n', '<CR>', 'o<esc>', { noremap = true })

-- Tab handling
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>')
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>')

-- Jump to start/end
vim.keymap.set('n', '<leader>h', '_')
vim.keymap.set('n', '<leader>l', '$')

-- Bracket shortcuts
vim.keymap.set('i', '<leader>cb', '{}<left>')
vim.keymap.set('i', '<leader>sb', '[]<left>')

-- Jump 5 rows at a time.
vim.keymap.set('n', 'K', '5k', { noremap = true, silent = true })
vim.keymap.set('n', 'J', '5j', { noremap = true, silent = true })


-- --------------------------- nvim-tree---------------------------
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>e', '::NvimTreeFocus<CR>')


