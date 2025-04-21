return {
    {
        "folke/zen-mode.nvim",
        opts = {
            window = {
                width = 100,
            },
        },
        keys = {
            { "<leader>z", ":ZenMode<cr>", desc = "Toggle zen mode" },
        },
    },
}
