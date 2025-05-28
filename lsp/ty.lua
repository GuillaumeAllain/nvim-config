return {
    -- settings = {
    --     ["ty"] = {},
    -- },
    cmd = { "ty", "server" },
    root_markers = { ".git", "pyproject.toml", "pixi.toml", "ty.toml" },
    filetypes = { "python" },
    capabilities = {
        textDocument = {
            rename = {
                enable = true,
            },
        },
    },
}
