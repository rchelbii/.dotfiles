vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- ident-blankline setup
require("ibl").setup()

vim.schedule(function()
  require "mappings"
end)

vim.diagnostic.config {
  virtual_text = false,
}

-- custom init configs
--
require "custom.default-nvdash"

-- if vim.lsp.inlay_hint then
--   vim.lsp.inlay_hint.enable(true, { 0 })
-- end

-- zig-lsp configs

vim.g.zig_fmt_autosave = true
