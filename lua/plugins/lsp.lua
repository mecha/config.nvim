return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- show LSP diagnostics as virtual text
            "b0o/SchemaStore.nvim", -- provides schemas for LSPs (JSON, YAML)
            "j-hui/fidget.nvim", -- LSP status text
            "williamboman/mason.nvim", -- LSP installer
            "WhoIsSethDaniel/mason-tool-installer.nvim", -- ensure some tools are installed at startup, uses mason
            "williamboman/mason-lspconfig.nvim", -- configure mason-installed tools with lspconfig
            { "folke/lazydev.nvim", ft = "lua", opts = {} }, -- configure LSP for Neovim config & plugin development
            {
                "pmizio/typescript-tools.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        config = function()
            require("config.lsp")
        end,
    },
}
