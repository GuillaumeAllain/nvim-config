return {
    "zegervdv/nrpattern.nvim",
    lazy = true,
    keys = { "<C-a>", "<C-x>", "g<C-a>", "g<C-x>"},
    config = function()
        require("nrpattern").setup()
        local patterns = require("nrpattern.default")
        patterns[{ "À faire", "Fait" }] = { priority = 2, filetype = { "Pandoc", "Markdown" } }
        require("nrpattern").setup(patterns)
    end,
}
