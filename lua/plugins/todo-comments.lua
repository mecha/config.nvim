return {
    {
        -- highlight keywords in comments: TODO, NOTE, FIXME, etc.
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        lazy = false,
        opts = {},
        keys = {
            { "gtt",        ":TodoTrouble<cr>",   desc = "TODOs (Trouble)" },
            { "<leader>sT", ":TodoTelescope<cr>", desc = "TODOs (Telescope)" },
        },
    },
}
