local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        if opts.desc then
            opts.desc = "keymaps.lua: " .. opts.desc
        end
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local function nmap(lhs, rhs, opts)
  map("n", lhs, rhs, opts)
end


nmap("<c-k>", ":wincmd k<CR>", {})
nmap("<c-j>", ":wincmd j<CR>", {})
nmap("<c-h>", ":wincmd h<CR>", {})
nmap("<c-l>", ":wincmd l<CR>", {})


