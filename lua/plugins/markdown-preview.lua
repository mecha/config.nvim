return {
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install && git restore .",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        keys = {
            { "<leader>mp", ":MarkdownPreviewToggle<cr>", ft = "markdown", silent = true },
        },
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            vim.g.mkdp_port = 9000
            vim.g.mkdp_auto_close = 0
            vim.g.mkdp_echo_preview_url = 1
        end,
    },
}
