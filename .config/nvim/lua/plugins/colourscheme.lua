return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
        vim.o.background = "dark"
        local colors = require("gruvbox").palette
        require("gruvbox").setup({
            overrides = {
                TelescopePromptNormal = { bg = colors.dark1 },
                TelescopePromptBorder = { fg = colors.dark1, bg = colors.dark1 },
                TelescopePromptTitle = { fg = colors.dark1, bg = colors.bright_orange, bold = true },
                TelescopeResultsNormal = { bg = colors.dark0_hard },
                TelescopeResultsBorder = { fg = colors.dark0_hard, bg = colors.dark0_hard },
                TelescopePreviewNormal = { bg = colors.dark0_hard },
                TelescopePreviewBorder = { fg = colors.dark0_hard, bg = colors.dark0_hard },
            }
        })
        vim.cmd([[colorscheme gruvbox]])
    end
}
