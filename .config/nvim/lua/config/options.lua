vim.g.mapleader = " "

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }


local opt = vim.opt

opt.expandtab = true      -- Use spaces instead of tabs
opt.tabstop = 4           -- Number of spaces tabs count for
opt.shiftwidth = 4        -- Size of an indent
opt.smartcase = true      -- Don't ignore case with capitals
opt.smartindent = true    -- Insert indents automatically
opt.scrolloff = 3
opt.cmdheight = 0         -- Hide the command bar by default
opt.number = true         -- Print line number
opt.relativenumber = true -- Relative line numbers
opt.mouse = ""            -- Enable mouse mode

vim.fn.matchadd('errorMsg', [[\s\+$]])

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            timeout = 25
        })
    end,
})
