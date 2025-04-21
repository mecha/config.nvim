return {
    {
        -- git gutter status
        "lewis6991/gitsigns.nvim",
        event = "BufRead",
        opts = {
            signcolumn = true,
        },
        keys = {
            { "gb", ":Gitsigns blame_line<cr>", silent = true },
        },
    },
}
