-- --------------------------- general ---------------------------

-- Remap leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
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

-- Enable moving of lines using alt
vim.keymap.set('n', '<M-Up>', ':m .-2<CR>==')
vim.keymap.set('n', '<M-Down>', ':m .+1<CR>==')
vim.keymap.set('v', '<M-Up>', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', '<M-Down>', ':m \'>+1<CR>gv=gv')

-- Enable line join without cursor movement
vim.keymap.set('n', '<leader>j', 'mzJ`z')

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

-- Enter normal mode when in terminal
vim.keymap.set('t', '<esc>', '<C-\\><C-n>')


----------------------------- nvim-tree ---------------------------
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>e', '::NvimTreeFocus<CR>')


-- --------------------------- telescope ---------------------------
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


-- --------------------------- dap-ui ---------------------------
local dap, dapui = require('dap'), require('dapui')
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Continue' })
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })


--------------------------- hop ---------------------------
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('n', 'J', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = 0 })
end, { remap = true })

vim.keymap.set('n', 'K', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 0 })
end, { remap = true })


--------------------------- lsp ---------------------------
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'ge', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)

    local function custom_wrap(text, max_width)
      local lines = {}
      local line = ""

      for word in text:gmatch("[^%s]+") do -- Matches non-space sequences
        if #word > max_width then
          -- Add a new line before the long word if the current line is not empty
          if #line > 0 then
            table.insert(lines, line)
            table.insert(lines, "")     -- Empty line before the long word
            line = ""
          end

          while #word > max_width do
            table.insert(lines, word:sub(1, max_width))
            word = word:sub(max_width + 1)
          end

          if #word > 0 then
            table.insert(lines, word)     -- Add the remaining part of the long word
            table.insert(lines, "")       -- Empty line after the long word
          end
        else
          if #line + #word + 1 > max_width then
            if #line > 0 then
              table.insert(lines, line)
              line = ""
            end
          end

          if #line > 0 then
            line = line .. " "
          end
          line = line .. word
        end
      end

      if #line > 0 then
        table.insert(lines, line)
      end

      return "\n" .. table.concat(lines, "\n")
    end

    vim.keymap.set('n', 'gh', function()
      vim.diagnostic.open_float({
        --max_width = 70,
        border = 'rounded',
        source = 'always',
        format = function(diagnostic)
          return custom_wrap(diagnostic.message, 70)
        end
      })
    end)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  end,
})
