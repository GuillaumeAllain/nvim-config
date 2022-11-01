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
    "markdown",
    "markdown_inline",
    "comment",
    "vim",
    "query"
}

m.lsp_ft = {
    "python",
    "pandoc",
    "yaml",
    "fortran",
    "haskell",
    "lua",
    "julia",
    "apl",
    "fennel",
    "codevlisp"
}

-- local function get_ctags_ft()
--     local raw_ft_string = vim.fn.system("ctags --list-languages"):lower()
--     local raw_ft_table = {}
--     raw_ft_string:gsub("[^\r\n]+", function(c)
--         table.insert(raw_ft_table, c)
--     end)
--     return raw_ft_table
-- end

-- m.ctags_ft = get_ctags_ft()
m.ctags_ft = {"pandoc","markdown","codevlisp"}

return m
