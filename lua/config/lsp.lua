local keyset = vim.keymap.set

local fidget = require("fidget")
fidget.setup({
    notification = { window = { winblend = 0 } },
    progress = {
        display = {
            done_style = "Type",
            progress_style = "Type",
            group_style = "String",
            icon_style = "String",
        },
    },
})

local capabilities = nil
if pcall(require, "cmp_nvim_lsp") then
    capabilities = require("cmp_nvim_lsp").default_capabilities()
end

local lspconfig = require("lspconfig")

local servers = {
    bashls = true,
    gopls = {
        manual_install = true,
        settings = {
            gopls = {
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        },
    },
    lua_ls = {
        server_capabilities = {
            semanticTokensProvider = vim.NIL,
        },
    },
    rust_analyzer = true,
    templ = true,
    intelephense = true,
    cssls = true,
    ts_ls = true,
    jsonls = {
        server_capabilities = {
            documentFormattingProvider = false,
        },
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    },
    yamlls = {
        settings = {
            yaml = {
                schemaStore = {
                    enable = false,
                    url = "",
                },
                schemas = require("schemastore").yaml.schemas(),
            },
        },
    },
    tailwindcss = {
        settings = {
            tailwindCSS = {
                experimental = {
                    classRegex = {
                        [[class: "([^"]*)]],
                        [[className="([^"]*)]],
                    },
                },
            },
        },
    },
}

for name, config in pairs(servers) do
    if config == true then
        config = {}
    end
    config = vim.tbl_deep_extend(
        "force",
        {},
        { capabilities = capabilities },
        config
    )

    lspconfig[name].setup(config)
end

local mason = require("mason")
mason.setup({
    ui = {
        keymaps = {
            apply_language_filter = "=",
        },
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

local masonToolInstaller = require("mason-tool-installer")
masonToolInstaller.setup({
    ensure_installed = {
        "bashls",
        "blade-formatter",
        "clangd",
        "cssls",
        "delve",
        "gopls",
        "html",
        "hyprls",
        "intelephense",
        "jsonls",
        "lemminx",
        "lua_ls",
        "marksman",
        "prettierd",
        "psalm",
        "sqlls",
        "stylua",
        "tailwindcss",
        "templ",
        "ts_ls",
        "yamlls",
        "zls",
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = assert(
            vim.lsp.get_client_by_id(args.data.client_id),
            "must have valid client"
        )

        local settings = servers[client.name]
        if type(settings) ~= "table" then
            settings = {}
        end

        local telescope_bi = require("telescope.builtin")

        vim.opt_local.omnifunc = "v:lua.vim.lsp.omnifunc"
        keyset("n", "gO", telescope_bi.lsp_document_symbols, { buffer = 0 })
        keyset("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Hover" })
        keyset("n", "gra", vim.lsp.buf.code_action, { buffer = 0 })
        keyset("n", "grA", function()
            vim.lsp.buf.code_action({
                context = {
                    only = { "source" },
                    diagnostics = {},
                },
            })
        end, { buffer = 0 })

        -- Override server capabilities
        if settings.server_capabilities then
            for k, v in pairs(settings.server_capabilities) do
                if v == vim.NIL then
                    ---@diagnostic disable-next-line: cast-local-type
                    v = nil
                end
                client.server_capabilities[k] = v
            end
        end
    end,
})

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
    underline = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.HINT] = "󰅚 ",
            [vim.diagnostic.severity.INFO] = " ",
        },
    },
})

require("lsp_lines").setup()

keyset("", "<leader>l", function()
    local config = vim.diagnostic.config() or {}
    if config.virtual_text then
        vim.diagnostic.config({
            virtual_text = false,
            virtual_lines = true,
        })
    else
        vim.diagnostic.config({
            virtual_text = true,
            virtual_lines = false,
        })
    end
end, { desc = "Toggle lsp_lines" })

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

local orig_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_open_floating_preview(contents, syntax, opts, ...)
end

require("typescript-tools").setup({
    settings = {
        expose_as_code_action = {
            "add_missing_imports",
            "remove_unused_imports",
            "organize_imports",
        },
    },
})
