return {
    "zegervdv/nrpattern.nvim",
    config=function()
        require("nrpattern").setup()
        local patterns = require("nrpattern.default")
        patterns[{ "À faire", "Fait" }] = { priority = 2, filetype = { "Pandoc", "Markdown" } }
        require("nrpattern").setup(patterns)
    end

}
