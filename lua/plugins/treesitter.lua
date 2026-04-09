return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        init = function()
            -- Enable treesitter-based indentation
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
        config = function()
            local ts = require("nvim-treesitter")
            ts.install({
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "go",
                "javascript",
                "typescript",
                "php",
                "html",
                "css",
                "json",
                "yaml",
            })

            require("nvim-treesitter-textobjects").setup({
                select = {
                    lookahead = true,
                },
                move = {
                    set_jumps = true,
                },
            })

            ---------------
            -- SELECTION --
            ---------------

            local ts_select = require("nvim-treesitter-textobjects.select")

            local function ts_textobject_keymap(char, textobject)
                vim.keymap.set({ "x", "o" }, "i" .. char, function()
                    ts_select.select_textobject(
                        textobject .. ".inner",
                        "textobjects"
                    )
                end)
                vim.keymap.set({ "x", "o" }, "a" .. char, function()
                    ts_select.select_textobject(
                        textobject .. ".outer",
                        "textobjects"
                    )
                end)
            end

            vim.keymap.set({ "x", "o" }, "as", function()
                ts_select.select_textobject("@local.scope", "locals")
            end)

            ts_textobject_keymap("f", "@function")
            ts_textobject_keymap("c", "@class")
            ts_textobject_keymap("b", "@block")
            ts_textobject_keymap("r", "@frame")
            ts_textobject_keymap("l", "@loop")
            ts_textobject_keymap("m", "@parameter")
            ts_textobject_keymap("i", "@call")
            ts_textobject_keymap("/", "@comment")

            --------------
            -- SWAPPING --
            --------------

            local ts_swap = require("nvim-treesitter-textobjects.swap")

            vim.keymap.set("n", "<S-M-Right>", function()
                ts_swap.swap_next("@parameter.inner")
            end)
            vim.keymap.set("n", "<S-M-Left>", function()
                ts_swap.swap_previous("@parameter.inner")
            end)

            -----------------
            -- MOVE (JUMP) --
            -----------------

            local ts_move = require("nvim-treesitter-textobjects.move")

            local function ts_move_keymap(char, query)
                vim.keymap.set({ "n", "x", "o" }, "[" .. char, function()
                    ts_move.goto_previous_start(query, "textobjects")
                end)
                vim.keymap.set({ "n", "x", "o" }, "]" .. char, function()
                    ts_move.goto_next_start(query, "textobjects")
                end)

                local CHAR = string.upper(char)
                vim.keymap.set({ "n", "x", "o" }, "[" .. CHAR, function()
                    ts_move.goto_previous_end(query, "textobjects")
                end)
                vim.keymap.set({ "n", "x", "o" }, "]" .. CHAR, function()
                    ts_move.goto_next_end(query, "textobjects")
                end)
            end

            ts_move_keymap("f", "@function.outer")
            ts_move_keymap("c", "@class.outer")
            ts_move_keymap("l", "@loop.outer")
            ts_move_keymap("m", "@parameter.outer")
            ts_move_keymap("i", "@call.outer")
            ts_move_keymap("/", "@call.outer")

            local ts_repeat_move =
                require("nvim-treesitter-textobjects.repeatable_move")

            -- repeat textobject movement with ; and ,
            vim.keymap.set(
                { "n", "x", "o" },
                ";",
                ts_repeat_move.repeat_last_move
            )
            vim.keymap.set(
                { "n", "x", "o" },
                ",",
                ts_repeat_move.repeat_last_move_opposite
            )

            -- make builtin f, F, t, T also repeatable with ; and ,
            vim.keymap.set(
                { "n", "x", "o" },
                "f",
                ts_repeat_move.builtin_f_expr,
                { expr = true }
            )
            vim.keymap.set(
                { "n", "x", "o" },
                "F",
                ts_repeat_move.builtin_F_expr,
                { expr = true }
            )
            vim.keymap.set(
                { "n", "x", "o" },
                "t",
                ts_repeat_move.builtin_t_expr,
                { expr = true }
            )
            vim.keymap.set(
                { "n", "x", "o" },
                "T",
                ts_repeat_move.builtin_T_expr,
                { expr = true }
            )

            -- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            --     vim.lsp.diagnostic.on_publish_diagnostics,
            --     {
            --         underline = true,
            --         virtual_text = {
            --             spacing = 5,
            --             min = "severe",
            --             -- severity_limit = "Warning",
            --         },
            --         update_in_insert = true,
            --     }
            -- )
        end,
    },
    -- Add selection objects for classes, functions, params, args, etc.
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
    -- Show context at the top of the buffer (function, class, loop, etc.)
    {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
            enable = true,
            mode = "topline",
            line_numbers = true,
            multiline_threshold = 1,
        },
    },
}
