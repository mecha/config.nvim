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

            vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<A-t>", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<A-s>", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<A-r>", function() harpoon:list():select(4) end)
            vim.keymap.set("n", "<A-f>", function() harpoon:list():select(5) end)
            vim.keymap.set("n", "<A-g>", function() harpoon:list():select(6) end)
            vim.keymap.set("n", "<A-v>", function() harpoon:list():select(7) end)
            vim.keymap.set("n", "<A-x>", function() harpoon:list():select(8) end)
        end
    }
}
