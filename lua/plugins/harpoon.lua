return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local harpoon = require("harpoon")

            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true,
                },
            })

            local exts = require("harpoon.extensions")
            harpoon:extend(exts.builtins.highlight_current_file())

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-s>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-n>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<A-r>", function() harpoon:list():select(5) end)
            vim.keymap.set("n", "<A-m>", function() harpoon:list():select(6) end)
            vim.keymap.set("n", "<A-f>", function() harpoon:list():select(7) end)
            vim.keymap.set("n", "<A-p>", function() harpoon:list():select(8) end)

            vim.keymap.set("n", "<leader><A-h>", function() harpoon:list():replace_at(1) end)
            vim.keymap.set("n", "<leader><A-t>", function() harpoon:list():replace_at(2) end)
            vim.keymap.set("n", "<leader><A-s>", function() harpoon:list():replace_at(3) end)
            vim.keymap.set("n", "<leader><A-n>", function() harpoon:list():replace_at(4) end)
            vim.keymap.set("n", "<leader><A-r>", function() harpoon:list():replace_at(5) end)
            vim.keymap.set("n", "<leader><A-m>", function() harpoon:list():replace_at(6) end)
            vim.keymap.set("n", "<leader><A-f>", function() harpoon:list():replace_at(7) end)
            vim.keymap.set("n", "<leader><A-p>", function() harpoon:list():replace_at(8) end)
        end
    }
}
