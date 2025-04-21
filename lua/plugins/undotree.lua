return {
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", ":UndotreeToggle<cr>", silent = true },
        },
        config = function()
            vim.g['undotree_WindowLayout'] = 3
            vim.g['undotree_ShortIndicators'] = 1
            vim.g['undotree_SplitWidth'] = 50
            vim.g['undotree_SetFocusWhenToggle'] = 1
            vim.g['undotree_DiffAutoOpen'] = 1
        end
    },
}
