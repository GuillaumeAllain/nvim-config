local treesitter_ft = {
    "css",
    "html",
    "javascript",
    "latex",
    "rust",
    "norg",
    "scss",
    "svelte",
    "tsx",
    "typst",
    "vue",
    "regex",
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
    "query",
    "vimdoc",
    "r",
    "typst",
}

print("Attempting to require nvim-treesitter.configs")
local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
    print("Failed to require nvim-treesitter.configs: " .. tostring(configs))
    os.exit(1)
end

print("Attempting to setup nvim-treesitter.configs")
local ok2, err = pcall(configs.setup, {
    ensure_installed = treesitter_ft,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
})

if not ok2 then
    print("Failed to setup nvim-treesitter.configs: " .. tostring(err))
    os.exit(1)
end

print("Success!")
