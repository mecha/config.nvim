local group = vim.api.nvim_create_augroup("mecha_yank_highlight", { clear = true })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = group,
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 150 })
    end,
})
