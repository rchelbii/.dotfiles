return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "rust-analyzer",
      "eslint-lsp",
      "prettier",
      "tailwindcss-language-server",
      "typescript-language-server",
      "asm-lsp",
    },
  },
}
