return {
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    opts = {
      result_split_horizontal = true,
      result_split_in_place = true
    },
    config = function()
      vim.api.nvim_create_user_command('Restrun' , require('rest-nvim').run, {})
    end
  }
}
