return {
    {
        "RRethy/vim-illuminate",
        config = function()
            require("illuminate").configure({
                delay = 250,
                min_count_to_highlight = 2,
                large_file_cutoff = 10000,
            })
        end
    }
}
