local treesitter_ft = {
    "css",
    "html",
    "javascript",
    "latex",
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
}

return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = function()
        vim.cmd(":TSUpdate")
        require("nvim-treesitter").install(treesitter_ft)
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
    -- config = function()
    --     require("nvim-treesitter.configs").setup({
    --         ensure_installed = treesitter_ft,
    --         highlight = {
    --             enable = true,
    --             disable = function(lang, bufnr)
    --                 return vim.api.nvim_buf_get_name(bufnr):sub(-2) == ".f"
    --             end,
    --         },
    --         incremental_selection = {
    --             enable = true,
    --         },
    --         refactor = {
    --             highlight_definitions = { enable = true },
    --         },
    --         context = {
    --             enable = false,
    --         },
    --     })
    --     vim.treesitter.language.register("fennel", "codevlisp")
    --     vim.treesitter.language.register("markdown", "pandoc")
    --     vim.treesitter.language.register("latex", "tikz")
    --     -- require("nvim-treesitter.parsers").filetype_to_parsername.pandoc = "markdown"
    --     -- require("nvim-treesitter.parsers").filetype_to_parsername.codevlisp = "fennel"
    --     -- require("nvim-treesitter.parsers").filetype_to_parsername.tikz = "latex"
    --     -- require"nvim-treesitter.parsers".filetype_to_parsername.pandoc = "markdown"
    --     vim.g.markdown_folding = 1
    --
    --     -- vim.wo.foldtext =
    --     --     [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
    --     -- vim.cmd[[set fillchars=fold:\ ,eob:\ ]]
    --     -- vim.wo.foldnestmax = 3
    --     -- vim.wo.foldminlines = 1
    --
    --     -- vim.cmd[[hi! EndOfBuffer guibg=none ctermbg=none]]
    --     -- vim.cmd[[hi! SignColumn guibg=none ctermbg=none]]
    --     -- vim.cmd([[e .hidden_file.md|bd]])
    --     -- vim.treesitter.require_language("markdown")
    -- end,
}
