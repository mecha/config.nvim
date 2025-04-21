return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local ts = require("nvim-treesitter.configs")
            ts.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "go", "javascript", "typescript", "php", "html", "css", "json", "yaml" },
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                modules = {},
                indent = {
                    enable = true
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["as"] = { query = "@scope", query_group = "locals", desc = "Scope" },
                            ["if"] = "@function.inner",
                            ["af"] = "@function.outer",
                            ["ic"] = "@class.inner",
                            ["ac"] = "@class.outer",
                            ["ib"] = "@block.inner",
                            ["ab"] = "@block.outer",
                            ["ir"] = "@frame.inner",
                            ["ar"] = "@frame.outer",
                            ["il"] = "@loop.inner",
                            ["al"] = "@loop.outer",
                            ["i/"] = "@comment.inner",
                            ["a/"] = "@comment.outer",
                            ["im"] = "@parameter.inner",
                            ["am"] = "@parameter.outer",
                            ["ii"] = "@call.inner",
                            ["ai"] = "@call.outer",
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<S-M-Right>"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<S-M-Left>"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = { query = "@function.outer", desc = "Next function (start)" },
                            ["]c"] = { query = "@class.outer", desc = "Next class (start)" },
                        },
                        goto_next_end = {
                            ["]F"] = { query = "@function.outer", desc = "Next function (end)" },
                            ["]C"] = { query = "@class.outer", desc = "Next class (end)" },
                        },
                        goto_previous_start = {
                            ["[f"] = { query = "@function.outer", desc = "Prev function (start)" },
                            ["[c"] = { query = "@class.outer", desc = "Prev class (start)" },
                        },
                        goto_previous_end = {
                            ["[F"] = { query = "@function.outer", desc = "Prev function (end)" },
                            ["[C"] = { query = "@class.outer", desc = "Prev class (end)" },
                        },
                    },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "vih",
                        node_incremental = "+",
                        node_decremental = "-",
                        scope_incremental = "`",
                    },
                },
            })

            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    underline = true,
                    virtual_text = {
                        spacing = 5,
                        min = "severe",
                        -- severity_limit = "Warning",
                    },
                    update_in_insert = true,
                }
            )
        end
    },
    -- Show treesitter AST
    { "nvim-treesitter/playground" },
    -- Add selection objects for classes, functions, params, args, etc.
    { "nvim-treesitter/nvim-treesitter-textobjects" },
}
