return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pylsp", "pyright", "clangd", "rust_analyzer"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                filetypes = { "lua" },
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                filetypes = { "python" },
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                filetypes = { "cpp", "c" },
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                filetypes = { "rs", "rust" },
                settings = {
                    ['rust-analyzer'] = {},
                },
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
        end,
    },
}
