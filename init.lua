vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.autocmds")
require("config.journal")
require("config.godot")

vim.cmd("colorscheme viridescent")
