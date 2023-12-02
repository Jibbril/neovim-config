-- --------------------------- general ---------------------------
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


-- --------------------------- nvim-tree ---------------------------
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>e', '::NvimTreeFocus<CR>')


-- --------------------------- nvim-tree---------------------------
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })
