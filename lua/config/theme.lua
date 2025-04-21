local bamboo = require("bamboo")

local palette = {
    base = "#232828",
    surface = "#2c3333",
}

local newTheme = {
    a100 = os.getenv("THEME_A_100"),
    a200 = os.getenv("THEME_A_200"),
    a300 = os.getenv("THEME_A_300"),
    a400 = palette.base,
    a500 = os.getenv("THEME_A_500"),

    b100 = os.getenv("THEME_B_100"),
    b200 = os.getenv("THEME_B_200"),
    b300 = os.getenv("THEME_B_300"),
    b400 = os.getenv("THEME_B_400"),
    b500 = os.getenv("THEME_B_500"),
}

local theme = {
    White = "#e0ead5",
    Pastel = "#6d8257",
    Faded = "#677756",
    Bright = "#7aa34c",
    Faint = "#484e45",
    Dim = "#434a40",
    Dimmer = palette.surface,
    Dark = palette.base,
    Black = "#212819",
    -- new
    Jungle = "#303e2d",
    Light = "#e0edb6"
}

bamboo.setup({
    style = "multiplex",
    transparent = true,
    colors = {
        fg = theme.Light,
        bg1 = palette.base,
        bg2 = palette.base,
        bg3 = palette.base,
    },
    highlights = {
        ["MsgArea"] = { bg = palette.base },
        ["CursorLine"] = { bg = palette.base },
        ["ColorColumn"] = { bg = palette.base },
        ["IndentBlanklineChar"] = { fg = palette.base },
        ["Visual"] = { bg = newTheme.a300 },
        ["NormalFloat"] = { bg = palette.base },
        ["@comment"] = { fg = theme.Faded },
        ["FloatBorder"] = { bg = theme.Dark },
        ["Pmenusel"] = { bg = newTheme.a300 },
        -- Lualine
        ["lualine_b_normal"] = { bg = palette.base },
        ["lualine_b_inactive"] = { bg = palette.base },
        ["StatusLine"] = { bg = palette.base },
        ["StatusLineNC"] = { bg = palette.base },
        ["TabLine"] = { bg = palette.base },
        ["TabLineFill"] = { bg = palette.base },
        -- NeoTree
        ["NeoTreeNormal"] = { bg = palette.surface },
        ["NeoTreeNormalNC"] = { bg = palette.surface },
        ["NeoTreeWinSeparator"] = { fg = theme.Pastel, bg = palette.surface },
        ["NeoTreeFloatBorder"] = { fg = theme.Pastel, bg = palette.surface },
        ["NeoTreeVertSplit"] = { fg = theme.Pastel, bg = palette.surface },
        ["NeoTreeExpander"] = { fg = theme.Pastel },
        -- Telescope
        ["TelescopeNormal"] = { fg = theme.White, bg = theme.Dark },
        ["TelescopeBorder"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopePreviewBorder"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopePromptBorder"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopeResultsBorder"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopePreviewTitle"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopePromptTitle"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopeResultsTitle"] = { fg = theme.Pastel, bg = theme.Dark },
        ["TelescopeMatching"] = { fg = theme.Black, bg = theme.Bright },
        ["TelescopeSelection"] = { fg = theme.White, bg = theme.Dim },
        ["TelescopeSelectionCaret"] = { fg = theme.Bright },
    },
})

bamboo.load()

vim.cmd.colorscheme("bamboo")
