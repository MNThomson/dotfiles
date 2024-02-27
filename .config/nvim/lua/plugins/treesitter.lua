return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    -- Hack: https://github.com/virchau13/tree-sitter-astro/issues/16#issuecomment-1627752052
    config = function()
      require('nvim-treesitter.configs').setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "css",
          "html",
          "http",
          "javascript",
          "jsdoc",
          "json",
          "lua",
          "luadoc",
          "luap",
          "markdown",
          "markdown_inline",
          "python",
          "query",
          "regex",
          "rust",
          "tsx",
          "typescript",
          "typst",
          "tsx",
          "vim",
          "vimdoc",
          "yaml",
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    version = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require('treesitter-context').setup({
        enable = true,
        max_lines = 3, -- How many lines the window should span. Values <= 0 mean no limit.
      })
    end,
  }
}
