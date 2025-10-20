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

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = function()
        require("nvim-treesitter").install(treesitter_ft):wait(300000)
    end,
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            desc = "User: enable treesitter highlighting",
            callback = function(ctx)
                -- highlights
                local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

                -- indent
                local noIndent = {}
                if hasStarted and not vim.list_contains(noIndent, ctx.match) then
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
