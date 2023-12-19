return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    config = function()
      local lsp = require("lsp-zero")

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr, preserve_mappings = false })
        lsp.buffer_autoformat()
      end)

      require("mason").setup {}
      require("mason-lspconfig").setup {
        ensure_installed = { "lua_ls", "rust_analyzer" },
        handlers = { lsp.default_setup }
      }
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "folke/neodev.nvim"
  }
}
