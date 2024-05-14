return {
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    opts = {
      result_split_horizontal = true,
      result_split_in_place = true
    },
    config = function()
      vim.api.nvim_create_user_command('Restrun', require('rest-nvim').run, {})
    end
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
    keys = {
      { "<leader>h",  desc = "+harpoon" },
      { "<leader>hm", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Mark file with harpoon" },
      { "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          desc = "Go to next harpoon mark" },
      { "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          desc = "Go to previous harpoon mark" },
      { "<leader>hh", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
      { "<leader>hf", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Go to 1st harpoon mark" },
      { "<leader>hd", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Go to 2nd harpoon mark" },
      { "<leader>hs", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Go to 3rd harpoon mark" },
      { "<leader>ha", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Go to 4th harpoon mark" },
      { "<leader>hv", "<cmd>lua require('harpoon.ui').nav_file(5)<cr>",         desc = "Go to 5th harpoon mark" },
      { "<leader>hc", "<cmd>lua require('harpoon.ui').nav_file(6)<cr>",         desc = "Go to 6th harpoon mark" },
      { "<leader>hx", "<cmd>lua require('harpoon.ui').nav_file(7)<cr>",         desc = "Go to 7th harpoon mark" },
      { "<leader>hz", "<cmd>lua require('harpoon.ui').nav_file(8)<cr>",         desc = "Go to 8th harpoon mark" },
    }
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
