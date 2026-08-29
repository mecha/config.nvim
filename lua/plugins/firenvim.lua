return {
    {
        "glacambre/firenvim",
        build = ":call firenvim#install(0)",
        config = function()
            vim.g.firenvim_config = {
                globalSettings = {
                    alt = "all",
                },
                localSettings = {
                    [".*"] = {
                        cmdline = "neovim",
                        takeover = "never",
                    },
                },
            }
        end,
    },
}
