return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- load the plugin before saving
    opts = require "configs.conform",
  },
  -- For Nvim's Naive LSP's Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "go",
        "python",
      },
      highlight = {
        enable = true, -- false will disable the whole extension
      },
    },
  },
  -- Markdown Preview on Browser
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
