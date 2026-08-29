vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.filetypes")
require("config.journal")
require("config.godot")

if vim.g.started_by_firenvim ~= true then
    vim.cmd("colorscheme viridescent")
end
