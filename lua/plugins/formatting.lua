return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
                css = { "prettierd", stop_after_first = true },
                html = { "prettierd" },
                javascript = { "prettierd", stop_after_first = true },
                javascriptreact = { "prettierd", stop_after_first = true },
                typescript = { "prettierd", stop_after_first = true },
                typescriptreact = { "prettierd", stop_after_first = true },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
        },
        keys = {
            { "<F3>", function() require("conform").format() end },
        },
    }
}
