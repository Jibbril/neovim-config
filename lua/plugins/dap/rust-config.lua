local rt = require("rust-tools")
local dap = require("dap")

-- Set up the codelldb adapter path
local mason_data = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
local codelldb_path = mason_data .. "adapter/codelldb"
local liblldb_path  = mason_data .. "lldb/lib/liblldb.so"  

-- Configure nvim-dap adapter
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = codelldb_path,
    args = { "--port", "${port}" },
    -- detached = false,
  }
}

-- Configure launch configurations for Rust
dap.configurations.rust = {
  {
    name = "Launch Rust executable",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
  },
}

-- Initialize rust-tools with the dap adapter
rt.setup({
  dap = {
    adapter = dap.adapters.codelldb,
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
    hover_actions = {
      auto_focus = true
    }
  }
})

