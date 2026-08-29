return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", opts = {} }
        },
        enabled = function ()
            return vim.g.started_by_firenvim ~= true
        end,
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
