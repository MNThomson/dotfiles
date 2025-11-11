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
                    "go",
                    "html",
                    "http",
                    "javascript",
                    "jsdoc",
                    "json",
                    "ledger",
                    "lua",
                    "luadoc",
                    "luap",
                    "markdown_inline",
                    "markdown",
                    "python",
                    "query",
                    "regex",
                    "rust",
                    "tsx",
                    "tsx",
                    "typescript",
                    "typst",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
            })
            vim.treesitter.query.set('ledger', 'highlights',
                ';; extends\n(negative_quantity) @ledger.negative_quantity\n(quantity) @ledger.quantity')
            vim.api.nvim_set_hl(0, '@ledger.negative_quantity', { link = 'DiagnosticError' })
            vim.api.nvim_set_hl(0, '@ledger.quantity', { link = 'DiagnosticWarn' })
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
    },

    {
        "ledger/vim-ledger",
        version = false,
        ft = "ledger",
        init = function()
            vim.g.ledger_bin = "hledger"
            vim.g.ledger_fuzzy_account_completion = 1
            vim.g.ledger_date_format = "%Y-%m-%d"
            vim.g.ledger_align_at = 40
            vim.cmd([[
        function LedgerSort() range
          execute a:firstline .. ',' .. a:lastline .. '! hledger -f - -I print'
          execute a:firstline .. ',' .. a:lastline .. 's/^    /  /g'
          execute a:firstline .. ',' .. a:lastline .. 'LedgerAlign'
        endfunction
        command -range LedgerSort :<line1>,<line2>call LedgerSort()
      ]])
        end,
        opt = {},
    },
}
