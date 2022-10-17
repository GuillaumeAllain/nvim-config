local m = {}
function m.setup()
    require("nrpattern").setup()
    local patterns = require("nrpattern.default")
    patterns[{ "À faire", "Fait" }] = { priority = 2, filetype = { "Pandoc", "Markdown" } }
    require("nrpattern").setup(patterns)
end

m.setup()

return m
