-- Open nvdash when delete all buffer https://github.com/NvChad/NvChad/discussions/2896
--
vim.api.nvim_create_autocmd({ "BufEnter", "BufDelete", "FileType" }, {
  callback = function(args)
    if args.event == "FileType" then
      vim.o.showtabline = vim.bo.ft == "nvdash" and 0 or 2
      return
    end

    local buf = args.buf

    if not vim.bo[buf].buflisted then
      return
    end

    vim.schedule(function()
      if #vim.t.bufs == 1 and vim.api.nvim_buf_get_name(buf) == "" then
        vim.cmd "Nvdash"
      end
    end)
  end,
})
