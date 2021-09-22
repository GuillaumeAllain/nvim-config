local m = {}

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.org = {
--     install_info = {
--         url = "https://github.com/milisims/tree-sitter-org",
--         revision = "main",
--         files = { "src/parser.c", "src/scanner.cc" },
--     },
--     filetype = "org",
-- }

-- require("nvim-treesitter.configs").setup({
--     -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
--     highlight = {
--         enable = true,
--         -- disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
--         additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
--     },
--     ensure_installed = { "org" }, -- Or run :TSUpdate org
-- })

function m.setup(treesitter_ft)
    require("nvim-treesitter.configs").setup({
        ensure_installed = treesitter_ft,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
        },

        incremental_selection = {
            enable = true,
        },

        refactor = {
            highlight_definitions = { enable = true },
        },

        context = {
            enable = true,
        },
    })
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.wo.foldtext =
        [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
    vim.cmd[[set fillchars=fold:\ ,eob:\ ]]
    vim.wo.foldnestmax = 3
    vim.wo.foldminlines = 1
    -- vim.cmd[[hi! EndOfBuffer guibg=none ctermbg=none]]
    -- vim.cmd[[hi! SignColumn guibg=none ctermbg=none]]
end

return m
