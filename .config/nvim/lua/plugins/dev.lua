return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>h",  desc = "+harpoon" },
      {
        "<leader>hh",
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list(),
            { ui_max_width = 60, ui_width_ratio = 0.4 })
        end,
        desc = "Show harpoon marks"
      },
      { "<leader>hm", function() require("harpoon"):list():add() end,     desc = "Mark file with harpoon" },
      { "<leader>hf", function() require("harpoon"):list():select(1) end, desc = "Go to 1st harpoon mark" },
      { "<leader>hd", function() require("harpoon"):list():select(2) end, desc = "Go to 2nd harpoon mark" },
      { "<leader>hs", function() require("harpoon"):list():select(3) end, desc = "Go to 3rd harpoon mark" },
      { "<leader>ha", function() require("harpoon"):list():select(4) end, desc = "Go to 4th harpoon mark" },
      { "<leader>hv", function() require("harpoon"):list():select(5) end, desc = "Go to 5th harpoon mark" },
      { "<leader>hc", function() require("harpoon"):list():select(6) end, desc = "Go to 6th harpoon mark" },
      { "<leader>hx", function() require("harpoon"):list():select(7) end, desc = "Go to 7th harpoon mark" },
      { "<leader>hz", function() require("harpoon"):list():select(8) end, desc = "Go to 8th harpoon mark" },
    }
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      default_merge_method = "squash",
      default_to_projects_v2 = true,
    }

  }

}
