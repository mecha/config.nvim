return {
    {
        -- List for diagnostics, references, quick fixes, locations, telescope results, etc.
        "folke/trouble.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", opts = {} },
        },
        cmd = "Trouble",
        keys = {
            { "<leader>xx", ":Trouble diagnostics<cr>",          desc = "Diagnostics (Trouble)",      silent = true },
            { "<leader>xq", ":Trouble qflist<cr>",               desc = "Quickfix list (Trouble)",    silent = true },
            { "<leader>xl", ":Trouble loclist<cr>",              desc = "Location list (Trouble)",    silent = true },
            { "grr",        ":Trouble lsp_references<cr>",       desc = "References (Trouble)",       silent = true },
            { "gd",         ":Trouble lsp_definitions<cr>",      desc = "Definitions (Trouble)",      silent = true },
            { "gtd",        ":Trouble lsp_type_definitions<cr>", desc = "Type definitions (Trouble)", silent = true },
            { "[x",         ":Trouble prev<cr>",                 desc = "Prev diagnostic (Trouble)",  silent = true },
            { "]x",         ":Trouble next<cr>",                 desc = "Next diagnostic (Trouble)",  silent = true },
        },
        opts = {
            use_diagnostic_signs = true,
            auto_jump = true,
            focus = true,
            pinned = true,
            restore = true,
            follow = false,
            auto_refresh = false
        },
    },
}
