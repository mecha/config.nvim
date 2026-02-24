return {
    {
        "ariedov/android-nvim",
        config = function()
            local android = require("android-nvim")
            android.setup()

            vim.keymap.set("n", "<leader>ar", android.build_and_run)
            vim.keymap.set("n", "<leader>ab", android.build_release)
            vim.keymap.set("n", "<leader>ac", android.clean)
        end,
    },
}
