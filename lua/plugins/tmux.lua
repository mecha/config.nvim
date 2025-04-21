return {
    {
        -- seamless tmux and neovim pane navigation
        "alexghergh/nvim-tmux-navigation",
        opts = {
            disable_when_zoomed = true,
            no_wrap = true,
            keybindings = {
                up = "<C-Up>",
                down = "<C-Down>",
                left = "<C-Left>",
                right = "<C-Right>",
                next = "<C-Enter>",
            },
        }
    },
}
