return {
    {
        -- Highlight colors in buffer
        "NvChad/nvim-colorizer.lua",
        opts = {
            user_default_options = {
                names = false,
                tailwind = true,
            },
        },
    },
    {
        -- show tailwind color hints in cmp menu
        "roobert/tailwindcss-colorizer-cmp.nvim",
        opts = { color_square_width = 2 },
    },
}
