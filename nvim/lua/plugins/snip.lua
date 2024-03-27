return {
    "madskjeldgaard/cheeky-snippets.nvim",
    requires = {
        "L3MON4D3/LuaSnip"
    },
    config = function()
        local cheeky = require("cheeky")
        cheeky.setup({
            langs = {
                all = true,
                lua = true,
                rust = true,
                cpp = true,
                asm = true,
                cmake = true,
                markdown = true,
                supercollider = true
            },
        })
    end
}
