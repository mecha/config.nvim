return {
    {
        "hrsh7th/nvim-cmp",
        lazy = false,
        priority = 100,
        dependencies = {
            "onsails/lspkind.nvim", -- icons in cmp menu
            "hrsh7th/cmp-nvim-lsp", -- lsp completions
            "hrsh7th/cmp-path", -- path completions
            "hrsh7th/cmp-buffer", -- buffer completions
            "roobert/tailwindcss-colorizer-cmp.nvim", -- tailwind color completions
            "saadparwaiz1/cmp_luasnip", -- snippet completions (from luasnip plugin)
        },
        config = function()
            local lspkind = require("lspkind")
            lspkind.init({
                symbol_map = {
                    Copilot = "",
                },
            })

            local tw_colorizer = require("tailwindcss-colorizer-cmp")
            tw_colorizer.setup { color_square_width = 2 }

            local cmp = require("cmp")
            local types = require("cmp.types")

            cmp.setup {
                sources = {
                    { name = "lazydev", group_index = 0 },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer", group_index = 100, max_item_count = 5 },
                },
                mapping = {
                    ["<C-Space>"] = {
                        i = cmp.mapping.complete(),
                    },
                    ["<C-n>"] = cmp.mapping.select_next_item {
                        behavior = types.cmp.SelectBehavior.Insert,
                    },
                    ["<C-p>"] = cmp.mapping.select_prev_item {
                        behavior = types.cmp.SelectBehavior.Insert,
                    },
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-y>"] = cmp.mapping(
                        cmp.mapping.confirm {
                            select = true,
                            behavior = types.cmp.SelectBehavior.Insert,
                        },
                        { "i", "c" }
                    ),
                },
                formatting = {
                    expandable_indicator = true,
                    format = function(entry, item)
                        local lspkind_format = lspkind.cmp_format {
                            mode = "symbol",
                            menu = {
                                buffer = "[buf]",
                                luasnip = "[snip]",
                                nvim_lsp = "[LSP]",
                                nvim_lua = "[api]",
                                path = "[path]",
                            },
                        }

                        item = lspkind_format(entry, item)
                        item = tw_colorizer.formatter(entry, item)
                        return item
                    end,
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                sorting = {
                    priority_weight = 2,
                    comparators = {
                        cmp.offset,
                        cmp.exact,
                        -- cmp.scopes,
                        cmp.score,
                        cmp.recently_used,
                        cmp.locality,
                        cmp.kind,
                        cmp.sort_text,
                        cmp.length,
                        cmp.order,
                    },
                },
            }

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })

            -- fix tab sending ^I in cmdline after using completions for "/" or "?"
            -- https://www.reddit.com/r/neovim/comments/ucze6k/comment/i6eomr5/
            vim.keymap.set("c", "<tab>", "<C-z>", { silent = false })
        end,
    },
}
