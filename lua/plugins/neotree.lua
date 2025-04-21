return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            { "nvim-tree/nvim-web-devicons", opts = {} },
            { "nvim-lua/plenary.nvim" },
            { "MunifTanjim/nui.nvim" },
        },
        keys = {
            { mode = "n", "<leader>p",  ":Neotree filesystem position=current reveal_force_cwd toggle<CR>", silent = true },
            { mode = "n", "<leader>ft", ":Neotree filesystem right reveal_force_cwd toggle<CR>",            silent = true },
            { mode = "n", "<leader>gs", ":Neotree reveal_force_cwd right document_symbols toggle<CR>",      silent = true }
        },
        opts = {
            sources = { "filesystem", "buffers", "document_symbols" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
            close_if_last_window = true,
            source_selector = {
                winbar = false,
                statusline = false,
            },
            filesystem = {
                bind_to_cwd = true,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                },
                window = {
                    mappings = {
                        ["u"] = function(state)
                            local node = state.tree:get_node()
                            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                        end,
                    }
                },
            },
            window = {
                mappings = {
                    ["<space>"] = "toggle_node",
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_empty = "󰜌",
                    folder_empty_open = "󰜌",
                },
                git_status = {
                    symbols = {
                        renamed = "󰁕",
                        unstaged = "󰄱",
                    },
                },
            },
        },
    },
}
