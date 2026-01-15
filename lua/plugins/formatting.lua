return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
                css = { "prettierd" },
                html = { "prettierd" },
                javascript = { "prettierd" },
                javascriptreact = { "prettierd" },
                typescript = { "prettierd" },
                typescriptreact = { "prettierd" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            formatters = {
                clang_format = {
                    prepend_args = { "--style=file", "--fallback-style=LLVM" },
                },
            },
        },
        keys = {
            {
                "<F3>",
                function()
                    require("conform").format({ async = true })
                end,
            },
        },
    },
}
