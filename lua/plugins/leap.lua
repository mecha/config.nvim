return {
    {
        "ggandor/leap.nvim",
        config = function()
            local leap = require("leap")
            leap.opts = {
                highlight_unlabeled_phase_one_targets = true,
            }
            vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
            vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
            vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
        end,
    },
}
