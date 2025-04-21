return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-smart-history.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        lazy = false,
        keys = {
            { "<leader><space>", ":Telescope find_files<cr>",  silent = true },
            { "<leader>sa",      ":Telescope<cr>",             silent = true },
            { "<leader>st",      ":Telescope live_grep<cr>",   silent = true },
            { "<leader>ss",      ":Telescope treesitter<cr>",  silent = true },
            { "<leader>sc",      ":Telescope grep_string<cr>", silent = true },
            { "<leader>sb",      ":Telescope buffers<cr>",     silent = true },
            { "<leader>sh",      ":Telescope help_tags<cr>",   silent = true },
            { "<leader>sg",      ":Telescope git_files<cr>",   silent = true },
            { "<leader>su",      ":Telescope resume<cr>",      silent = true },
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local themes = require("telescope.themes")
            local config = require("telescope.config")
            local trouble_telescope = require("trouble.sources.telescope")

            -- Clone the default Telescope configuration
            local vimgrep_args = { unpack(config.values.vimgrep_arguments) }
            table.insert(vimgrep_args, "--hidden")
            table.insert(vimgrep_args, "-g")
            table.insert(vimgrep_args, "!**/.git/*")

            telescope.setup({
                defaults = {
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.75,
                        height = 0.85,
                        vertical = {
                            prompt_position = "top",
                            mirror = true,
                            preview_cutoff = 30,
                            preview_height = 0.55,
                        },
                    },
                    vimgrep_arguments = vimgrep_args,
                    mappings = {
                        i = {
                            ["<C-t>"] = trouble_telescope.open,
                            ["<Esc>"] = actions.close,
                        },
                        n = {
                            ["<C-t>"] = trouble_telescope.open,
                        },
                    },
                },
                extensions = {
                    ["fzf"] = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    ["ui-select"] = { themes.get_dropdown {} },
                },
                pickers = {
                    find_files = {
                        find_command = { "rg", "--files", "--hidden", "-g", "!**/.git/*" },
                    },
                    live_grep = {
                        additional_args = function()
                            return { "--hidden", "-g", "!**/.git/*" }
                        end
                    },
                    grep_string = {
                        additional_args = function()
                            return { "--hidden", "-g", "!**/.git/*" }
                        end
                    },
                    colorscheme = {
                        enable_preview = true,
                        layout_config = {
                            preview_height = 0,
                        },
                    },
                },
            })

            telescope.load_extension("fzf")
            telescope.load_extension("ui-select")
        end
    },
}
