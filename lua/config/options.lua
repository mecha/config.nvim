-- globals

vim.g.editorconfig = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- opts

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true

vim.opt.timeoutlen = 3000

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.foldmethod = "manual"

vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append "c"

vim.opt.more = false

-- don't add comment prefix when using 'o'
vim.opt.formatoptions:remove "o"
