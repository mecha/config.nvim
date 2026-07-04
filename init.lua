vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.autocmds")
require("config.filetypes")
require("config.journal")
require("config.godot")

vim.cmd("colorscheme viridescent")
