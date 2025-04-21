return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", opts = {} }
        },
        opts = {
            options = {
                theme = "auto",
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "filename", "branch", "diagnostics" },
                lualine_c = {},
            },
        },
    },
}
