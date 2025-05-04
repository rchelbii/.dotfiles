-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "rust_analyzer",
  "zls",
  "pyright",
  "html",
  "cssls",
  "ts_ls",
  "tailwindcss",
  "eslint",
  "clangd",
  "gopls",
  "asm_lsp",
  "terraformls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig.rust_analyzer.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   filetypes = { "rust" },
--   settings = {
--     ["rust_analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- }
