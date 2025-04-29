local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- 示例按键
            vim.keymap.set(
                "n",
                "<Leader>hh",
                rt.hover_actions.hover_actions,
                { buffer = bufnr }
            )
        end,
        settings = { ["rust-analyzer"] = { cargo = { allFeatures = true } } },
    },
    tools = { inlay_hints = { auto = true } },
})
