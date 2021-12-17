local m = {}
m.treesitter_ft = {
    "python",
    "yaml",
    "bash",
    "c",
    "bibtex",
    "fortran",
    "haskell",
    "fennel",
    "html",
    "julia",
    "latex",
    "lua",
    "regex",
    "toml",
    "markdown"
}

m.lsp_ft = {
    "python",
    "pandoc",
    "yaml",
    "fortran",
    "haskell",
    "lua",
    "julia",
    "apl"
}

local function get_ctags_ft()
    local raw_ft_string = vim.fn.system("ctags --list-languages"):lower()
    local raw_ft_table = {}
    raw_ft_string:gsub("[^\r\n]+", function(c)
        table.insert(raw_ft_table, c)
    end)
    return raw_ft_table
end

m.ctags_ft = get_ctags_ft()

return m
