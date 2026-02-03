local keymap = function(desc, mode, key, action)
    vim.keymap.set(mode, key, action, { desc = desc, silent = true })
end

keymap("Save™ Classic Pro Max", "n", "<C-s>", ":update<cr>")

keymap("Delete into void reg", { "n", "v" }, "_d", '"_d')
keymap("Paste re-yank into void reg", "v", "_p", '"_dP')

-- keep cursor in the middle of the screen
keymap("Next result", "n", "n", "nzzzv")
keymap("Prev result", "n", "N", "Nzzzv")
keymap("Up half-page", "n", "<C-u>", "<C-u>zz")
keymap("Down half-page", "n", "<C-d>", "<C-d>zz")

keymap("Split line", "n", "L", "i<cr><esc><up>$")
keymap("Split line & insert", "n", "cL", "i<cr><esc><up>$a")

keymap("help", { "n", "v", "i" }, "<F1>", "<esc>:Telescope help_tags<cr>")

keymap("Split vertically", "n", "<leader>H", ":vsplit<cr>")
keymap("Split horizontally", "n", "<leader>V", ":split<cr>")

keymap("Move line up", "n", "<A-Up>", "V:m .-2<cr>==gv<esc>")
keymap("Move line down", "n", "<A-Down>", "V:m .+1<cr>==gv<esc>")
keymap("Move selection up", "v", "<A-Up>", ":m '<-2<CR>gv=gv")
keymap("Move selection down", "v", "<A-Down>", ":m '>+1<CR>gv=gv")
keymap("Move up", "i", "<A-Up>", "<esc>V:m .-2<cr>==gi")
keymap("Move down", "i", "<A-Down>", "<esc>V:m .+1<cr>==gi")

keymap("Indent left", "n", "<A-Left>", "<<")
keymap("Indent left", "v", "<A-Left>", "<gv")
keymap("Indent left", "i", "<A-Left>", "<esc><A-Left>a")
keymap("Indent right", "n", "<A-Right>", ">>")
keymap("Indent right", "v", "<A-Right>", ">gv")
keymap("Indent right", "i", "<A-Right>", "<esc><A-Right>a")

-- interactive search and replace
local function iReplace(whole_file)
    vim.ui.input({ prompt = "Search: " }, function(search)
        if search == nil then
            return
        end
        vim.ui.input({ prompt = "Replace: " }, function(replace)
            if replace == nil then
                return
            end
            local pre = whole_file and "%" or ""
            vim.cmd(pre .. "s/" .. search .. "/" .. replace .. "/g")
        end)
    end)
end
keymap("Replace in line", "n", "<leader>rl", function()
    iReplace(false)
end)
keymap("Replace in file", "n", "<leader>rf", function()
    iReplace(true)
end)

keymap(
    "Commit history",
    "n",
    "<leader>gh",
    ":!tmux popup -y 0 -w 100\\% -h 94\\% -E lazygit -f %<cr>"
)

keymap("Open floating diagnostic", "n", "<leader>xf", vim.diagnostic.open_float)

-- the golang experience
keymap(
    "[GO] Return error",
    "n",
    "<leader>ee",
    "oif err != nil {<cr>}<esc>Oreturn err<esc><left><left>"
)
keymap(
    "[GO] Fatal error",
    "n",
    "<leader>ef",
    "oif err != nil {<cr>}<esc>Olog.Fatal(err)<esc><left><left>"
)
