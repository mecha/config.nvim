vim.g.nvim_surround_no_mappings = true

return {
    {
        "kylechui/nvim-surround",
        version = "*",
        keys = {
            {
                desc = "Surround on motion",
                ",s",
                "<Plug>(nvim-surround-normal)",
            },
            {
                desc = "Surround current line",
                ",ss",
                "<Plug>(nvim-surround-normal-cur)",
            },
            {
                desc = "Surround on motion, on new lines",
                ",S",
                "<Plug>(nvim-surround-normal-line)",
            },
            {
                desc = "Surround current line, on new lines",
                ",SS",
                "<Plug>(nvim-surround-normal-cur-line)",
            },
            {
                desc = "Change surround pair on motion",
                ",c",
                "<Plug>(nvim-surround-change)",
            },
            {
                desc = "Delete surround pair on motion",
                ",d",
                "<Plug>(nvim-surround-delete)",
            },
            {
                mode = "x",
                desc = "Surround on motion",
                ",s",
                "<Plug>(nvim-surround-visual)",
            },
            {
                mode = "x",
                desc = "Surround current line",
                ",ss",
                "<Plug>(nvim-surround-visual-cur)",
            },
            {
                mode = "x",
                desc = "Surround on motion, on new lines",
                ",S",
                "<Plug>(nvim-surround-visual-line)",
            },
            {
                mode = "x",
                desc = "Surround current line, on new lines",
                ",SS",
                "<Plug>(nvim-surround-visual-cur-line)",
            },
        },
    },
}
