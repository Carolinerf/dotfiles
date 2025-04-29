local rt = require("rust-tools")
rt.setup({
    server = {
        settings = { ["rust-analyzer"] = { cargo = { allFeatures = true } } },
    },
    tools = { inlay_hints = { auto = true } },
})
