-- --------------------------- general ---------------------------
-- Remap leader
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Leave insert mode
vim.keymap.set('i', '<c-c>', '<esc>')
vim.keymap.set('i', 'jk', '<esc>')
vim.keymap.set('i', 'fd', '<esc>')

-- Remove F1 key since it's never used and keyboard layout causes issues
-- when trying to use ESC
vim.keymap.set('', '<F1>', '<ESC>', { noremap = true, silent = true })
vim.keymap.set('i', '<F1>', '<ESC>', { noremap = true, silent = true })

-- Bracket shortcuts
vim.keymap.set('i', '<c-k>', '{}<left><CR><ESC>ko', { desc = 'Curly brackets' })
vim.keymap.set('i', '<c-j>', '[]<left>', { desc = 'Square brackets' })
vim.keymap.set('i', '<c-l>', '()<left>', { desc = 'Parenthesis' })

-- Enter normal mode when in terminal
vim.keymap.set('t', 'jkl', '<C-\\><C-n>')
vim.keymap.set('n', 'ts', ':terminal<CR>', { desc = '[t]erminal [s]tart' })
vim.keymap.set('n', '<leader>nt', ':rightbelow vsplit | terminal bash --login<CR><C-w>l:startinsert<CR>', { desc = '[n]ew [t]erminal' })

-- Buffer split
vim.keymap.set('n', '<leader>vs', ':vsplit<CR><C-w>l', { desc = '[V]ertical [S]plit' })

----------------------------- nvim-tree ---------------------------
vim.keymap.set('n', '<leader>E', ':NvimTreeFindFileToggle<CR>')
vim.keymap.set('n', '<leader>e', '::NvimTreeFocus<CR>')

----------------------------- trouble ---------------------------
local trouble = require('trouble')
vim.keymap.set(
  "n",
  "<leader>xw",
  function() trouble.toggle("diagnostics") end,
  { desc = 'Toggle workspace trouble tab.' }
)

vim.keymap.set(
  "n",
  "<leader>xn",
  function() 
    trouble.next("diagnostics") 
    trouble.jump("diagnostics")
  end,
  { desc = 'Skip to next trouble item' }
)

vim.keymap.set(
  "n",
  "<leader>xp",
  function() 
    trouble.prev("diagnostics") 
    trouble.jump("diagnostics")
  end,
  { desc = 'Skip to previous trouble item' }
)

-- --------------------------- telescope -------------------------
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
-- ir.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })


-- --------------------------- dap-ui ---------------------------
local dap, dapui = require('dap'), require('dapui')
vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Continue debugging' })
vim.keymap.set('n', '<F6>', dap.terminate, { desc = 'Stop debugging' })
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = 'Debug: See last session result.' })
vim.keymap.set('n', '<F9>', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B',
  function() require('dap').set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
  { desc = 'Set breakpoint with condition.' }
)
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Step Into' })

--------------------------- lsp ---------------------------
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
local formatter = require('utils.error-formatter').wrap_error

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local build_opts = function(opts)
      local res = { buffer = ev.buf }
      for k, v in pairs(opts) do
        res[k] = v
      end
      return res
    end

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, build_opts({ desc = '[g]o to [D]eclaration' }))
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, build_opts({ desc = '[g]o to [d]efinition' }))
    vim.keymap.set('n', 'ge', vim.lsp.buf.hover, build_opts({ desc = 'Hover information' }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, build_opts({ desc = '[g]et [i]mplementation' }))
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, build_opts({ desc = '[r]e[n]ame' }))
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, build_opts({ desc = '[c]ode [a]ctions' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, build_opts({ desc = '[g]et [r]eferences' }))
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, build_opts({ desc = '[f]ormat' }))

    -- open hover window for errors etc in code
    vim.keymap.set('n', 'gh', function()
      vim.diagnostic.open_float({
        --max_width = 70,
        border = 'rounded',
        source = 'always',
        format = function(diagnostic)
          return formatter(diagnostic.message, 70)
        end
      })
    end, { desc = 'Hover diagnostics' })
  end,
})

--------------------------- luasnip ---------------------------
local ls = require 'luasnip';

vim.keymap.set("i", "<A-l>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
end
end, { silent = true })


vim.keymap.set("i", "<A-h>", function()
  if ls.jumpable() then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<A-k>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

vim.keymap.set("i", "<A-j>", function()
  if ls.choice_active() then
    ls.change_choice(-1)
  end
end, { silent = true })

