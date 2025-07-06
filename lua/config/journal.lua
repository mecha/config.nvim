local mnt_dir = os.getenv("JOURNAL_MNT_DIR")

if mnt_dir == nil or mnt_dir == "" then
    return
end

local group = vim.api.nvim_create_augroup("journal_lsp", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    group = group,
    callback = function(args)
        if args.file:find(mnt_dir, 1, true) == 1 then
            vim.lsp.start({
                name = "journal-lsp",
                root_dir = mnt_dir,
                cmd = { mnt_dir .. "/lsp" },
            })
        end
    end,
})
