return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>f",  desc = "+file" },
      { "<leader>ff", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", desc = "Find Files (root dir)" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",                                            desc = "Live Grep (root dir)" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>",                                           desc = "status" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>",                                          desc = "commits" },
    },
    config = function()
      require('telescope').setup {
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
          theme = "center",
          sorting_strategy = "ascending",
          border_chars = {},
          layout_config = {
            horizontal = {
              prompt_position = "top",
            }
          }
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
      { "<leader>g",   desc = "+git" },
      { "<leader>gb",  "<cmd>Gitsigns blame_line<CR>",                                                            desc = "blame line" },
      { "<leader>gl",  "<cmd>Gitsigns setloclist<CR>",                                                            desc = "show jump list" },
      { "<leader>gh",  desc = "+hunk" },
      { "<leader>ghs", function() require("gitsigns").stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end,      mode = { "n", "v" },    desc = "stage hunk" },
      { "<leader>ghu", function() require("gitsigns").undo_stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end, mode = { "n", "v" },    desc = "unstage hunk" },
      { "<leader>ghr", function() require("gitsigns").reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end,      mode = { "n", "v" },    desc = "reset hunk" },
      { "<leader>ghn", "<cmd>Gitsigns next_hunk<CR>",                                                             desc = "next hunk" },
      { "<leader>ghp", "<cmd>Gitsigns prev_hunk<CR>",                                                             desc = "next hunk" },
    }
  },

  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      signs = false
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      theme = 'gruvbox',
      sections = {
        lualine_c = {
          { 'filename', path = 1 },
        },
      },
    }
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },

  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return name == ".git"
        end,
      },
    },
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>fe", "<cmd>Oil<cr>", desc = "Explore (Oil)" },
    },
  },


  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      --notify = { enabled = false },
      --messages = { enabled = false },
      lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },

      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      timeout = 2000,
      stages = "static",
    }
  },

  --[[{
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = { char = "|" },
        }
    }]] --
}
