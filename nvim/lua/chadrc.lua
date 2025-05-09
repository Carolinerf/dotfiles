-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "everforest",

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },

    hl_add = {
        YankHighlight = {
            reverse = true,
            fg = "NONE",
            bg = "NONE",
        },
    },
}

return M
