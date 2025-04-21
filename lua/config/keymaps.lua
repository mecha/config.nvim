local set = vim.keymap.set

-- can't curb the habit
set({ "n", "v" }, "<C-s>", ":w<cr>", { desc = "Save", silent = true })
set("i", "<C-s>", "<esc>:w<cr>a", { desc = "Save", silent = true })

-- void register ops
vim.keymap.set("n", "_d", '"_d')
vim.keymap.set("v", "_p", '"_dP')

-- keep cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev result" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half-page" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half-page" })

-- line splitting
set("n", "L", "i<cr><esc><up>$", { desc = "Split line" })
set("n", "cL", "i<cr><esc><up>$a", { desc = "Split line & insert" })

-- actually useful help
set({ "n", "v", "i" }, "<F1>", "<esc>:Telescope help_tags<cr>", { desc = "help", silent = true })

-- window splitting
set("n", "<leader>H", ":vsplit<cr>", { desc = "Split vertically" })
set("n", "<leader>V", ":split<cr>", { desc = "Split horizontally" })

-- moving lines up/down
vim.keymap.set("n", "<A-Up>", "V:m .-2<cr>==gv<esc>", { desc = "Move line up" })
vim.keymap.set("n", "<A-Down>", "V:m .+1<cr>==gv<esc>", { desc = "Move line down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("i", "<A-Up>", "<esc>V:m .-2<cr>==gi", { desc = "Move up" })
vim.keymap.set("i", "<A-Down>", "<esc>V:m .+1<cr>==gi", { desc = "Move down" })

-- moving lines left/right
vim.keymap.set("n", "<A-Left>", "<<", { desc = "Indent left" })
vim.keymap.set("n", "<A-Right>", ">>", { desc = "Indent right" })
vim.keymap.set("v", "<A-Left>", "<gv", { desc = "Indent left" })
vim.keymap.set("v", "<A-Right>", ">gv", { desc = "Indent right" })
vim.keymap.set("i", "<A-Left>", "<esc><<a", { desc = "Indent left" })
vim.keymap.set("i", "<A-Right>", "<esc>>>a", { desc = "Indent right" })

-- interactive search and replace
local function interactiveReplace(whole_file)
    vim.ui.input({ prompt = "Search: " }, function(search)
        if search == nil then return end
        vim.ui.input({ prompt = "Replace: " }, function(replace)
            if replace == nil then return end
            local pre = whole_file and "%" or ""
            vim.cmd(pre .. "s/" .. search .. "/" .. replace .. "/g")
        end)
    end)
end
set("n", "<leader>rl", function() interactiveReplace(false) end)
set("n", "<leader>rf", function() interactiveReplace(true) end)

-- git history of current file
vim.keymap.set("n", "<leader>gh", function()
    vim.fn.execute("!tmux popup -y 0 -w 100\\% -h 94\\% -E lazygit -f %", "silent")
end, { silent = true })

-- gypical golang experience described in 1 line
vim.keymap.set("n", "<leader>ee", "oif err != nil {<cr>}<esc>Oreturn err<esc><left><left>")
