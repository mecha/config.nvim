return {
    {
        -- Surround text with pairs: (), [], {}, <>, "", '', ``
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {
            keymaps = {
                insert = "<C-g>s",
                insert_line = "<C-g>S",
                normal = ",s",
                normal_cur = ",ss",
                normal_line = ",S",
                normal_cur_line = ",SS",
                visual = "S",
                visual_line = "gS",
                delete = ",d",
                change = ",c",
                change_line = ",cS",
            },
        },
    },
}
