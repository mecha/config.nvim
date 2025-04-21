return {
    {
        -- Debug Adapter Protocol
        "mfussenegger/nvim-dap",
        dependencies = {
            { "nvim-telescope/telescope-dap.nvim" },               -- DAP integration for Telescope
            { "theHamsta/nvim-dap-virtual-text",  config = true }, -- Virtual text for DAP (var defs, hightlights, etc.)
            { "leoluz/nvim-dap-go",               config = true }, -- Go extension for DAP
            {
                "rcarriga/nvim-dap-ui",
                dependencies = { "nvim-neotest/nvim-nio" },
                opts = {
                    layouts = {
                        {
                            position = "left",
                            size = 40,
                            elements = {
                                {
                                    id = "console",
                                    size = 0.25,
                                },
                                {
                                    id = "repl",
                                    size = 0.25,
                                },
                                {
                                    id = "watches",
                                    size = 0.25,
                                },
                                {
                                    id = "breakpoints",
                                    size = 0.25,
                                },
                            },
                        },
                        {
                            position = "bottom",
                            size = 10,
                            elements = {
                                {
                                    id = "stack",
                                    size = 0.3,
                                },
                                {
                                    id = "scopes",
                                    size = 0.7,
                                },
                            },
                        }
                    },
                },
            },
        },
        keys = {
            { "<F5>",  ":DapContinue<cr>",         silent = true },
            { "<F6>",  ":DapToggleBreakpoint<cr>", silent = true },
            { "<F7>",  ":DapStepInto<cr>",         silent = true },
            { "<F8>",  ":DapStepOver<cr>",         silent = true },
            { "<F9>",  ":DapStepOut<cr>",          silent = true },
            { "<F10>", ":DapTerminate<cr>",        silent = true },
        },
        config = function()
            local dap = require('dap')
            local dapui = require("dapui")

            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { os.getenv('HOME') .. '/dev/devtools/vscode-php-debug/out/phpDebug.js' }
            }
            dap.configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9003,
                    pathMappings = {
                        ["/var/www/html"] = "${workspaceFolder}"
                    }
                },
            }

            vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
            vim.fn.sign_define('DapStopped', { text = '🠲', texthl = '', linehl = '', numhl = '' })

            dap.listeners.after.event_initialized["dapui_config"] = dapui.open
            dap.listeners.before.event_terminated["dapui_config"] = dapui.close
            dap.listeners.before.disconnect["dapui_config"] = dapui.close
            dap.listeners.before.event_exited["dapui_config"] = dapui.close
        end,
    },
}
