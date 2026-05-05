local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    python = { "ruff_organize_imports", "ruff_format" },
  },
  -- Format on save config
  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    -- Only enable for these filetypes
    local ft = vim.bo[bufnr].filetype
    local enable_ft = { "lua", "css", "html" } -- Add filetypes to enable
    if vim.tbl_contains(enable_ft, ft) then
      return { timeout_ms = 500, lsp_fallback = true }
    end
  end,
}

return options
