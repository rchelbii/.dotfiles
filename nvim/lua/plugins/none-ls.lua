return {
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  opts = function()
    return require "configs.none"
  end,
}
