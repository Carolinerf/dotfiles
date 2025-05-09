require("nvchad.options")

local o = vim.o
local opt = vim.opt
local g = vim.g

-- Windows Shell
o.shell = "nu"

-- Indenting
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4

opt.number = true
opt.relativenumber = true

opt.cursorline = true

opt.colorcolumn = "80"

opt.hlsearch = true
opt.incsearch = true

-- o.cursorlineopt ='both' -- to enable cursorline!

-- set filetype for .CBL COBOL files.
-- vim.cmd([[ au BufRead,BufNewFile *.CBL set filetype=cobol ]])

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "YankHighlight",
            timeout = 200,
            on_visual = true,
        })
    end,
})
