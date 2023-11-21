return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>f", desc = "+file" },
      { "<leader>ff", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", desc = "Find Files (root dir)" },
      { "<leader>fe", "<cmd>Explore<cr>", desc = "Explore (Netrw)"},
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep (root dir)" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
    },
    config = function()
      require('telescope').setup{
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--ignore-vcs',
          },
        }
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    keys = {
      { "<leader>g", desc = "+git" },
      { "<leader>gh", desc = "+hunk" },
      { "<leader>ghs", "<cmd>Gitsigns stage_hunk<CR>", desc = "stage hunk" },
      { "<leader>ghu", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "unstage hunk" },
    }
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        theme = 'gruvbox'
      }
    end,
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  }
}
