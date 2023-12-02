require('dapui').setup({
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
    icons = {
      pause = '⏸',
      play = '▶',
      step_into = '⏎',
      step_over = '⏭',
      step_out = '⏮',
      step_back = 'b',
      run_last = '▶▶',
      terminate = '⏹',
      disconnect = '⏏',
    },
  },
})

vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})

local dap, dapui = require('dap'), require('dapui')

-- Hook actions onto events
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end

dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end

dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

require('mason-nvim-dap').setup {
  automatic_setup = true,

  -- see mason-nvim-dap README for more information
  handlers = {},
  ensure_installed = {
    -- Update this to ensure that you have the debuggers for the langs you want
    'delve',
  },
}
