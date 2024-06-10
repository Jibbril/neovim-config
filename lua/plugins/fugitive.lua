-- Automatically resize the :G status window to a custom height
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "fugitive://*",
    callback = function()
        if vim.bo.filetype == "fugitive" then
            -- vim.cmd("resize -20")
            vim.cmd("wincmd L")
        end
    end
})

