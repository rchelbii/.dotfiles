return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup {
      symbol_in_winbar = {
        enable = true,
      },
      ui = {
        enable = false,
      },
      code_action = {
        enable = false,
      },
    }
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons",     -- optional
  },
}
