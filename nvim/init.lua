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

-- Set highlight groups

-- require("themes").setup {
--   integrations = {
--     native_lsp = { enabled = true },
--     treesitter = true,
--   },
--   highlight_overrides = {
--     all = function(colors)
--       return {
--         Cursor = { bg = colors.surface1, fg = "NONE" }, -- Keep text visible
--         iCursor = { bg = colors.blue, fg = "NONE" },    -- Use Catppuccin blue for insert mode
--       }
--     end,
--   },
-- }

-- Set cursor styles
-- vim.opt.guicursor = {
--   "n-v-c:block-Cursor",
--   "i:ver100-iCursor",
--   "n-v-c:blinkon0",
--   "i:blinkwait10",
-- }
--
--

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    -- This makes the cursor's foreground inherit the underlying text color
    -- while setting its background to a color of your choosing (here, using colors from Catppuccin).
    vim.api.nvim_set_hl(0, "Cursor", { fg = "NONE", bg = "#e1e1e1" })
  end,
})

-- set cursor
vim.opt.guicursor = "n-v-c:block-Cursor"
vim.opt.guicursor:append "i:ver100-iCursor"
vim.opt.guicursor:append "n-v-c:blinkon0"
vim.opt.guicursor:append "i:blinkwait10"
