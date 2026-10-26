-- Plugins are managed by the built-in vim.pack: everything is installed and
-- loaded up front, then configured below. Build hooks (PackChanged) and
-- globals read by vimscript plugins at source time must precede vim.pack.add().

local gh = function(repo) return "https://github.com/" .. repo end

for _, p in ipairs({
    "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin",
    "vimball", "vimballPlugin", "2html_plugin", "logipat", "rrhelper",
    "spellfile_plugin", "tutor", "tohtml", "matchit", "matchparen",
}) do
    vim.g["loaded_" .. p] = 1
end

-- mini.icons stands in for nvim-web-devicons (which is not installed).
package.preload["nvim-web-devicons"] = function()
    package.loaded["nvim-web-devicons"] = {}
    require("mini.icons").mock_nvim_web_devicons()
    return package.loaded["nvim-web-devicons"]
end

vim.g.gutentags_project_root = { "package.json", ".git", ".notes" }
vim.g.gutentags_cache_dir = vim.fn.stdpath("cache") .. "ctags"
vim.g.gutentags_generate_on_new = true
vim.g.gutentags_generate_on_missing = true
vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_empty_buffer = true
vim.g.gutentags_ctags_exclude = { "*/qmk_firmware/*", ".Trash", "*.f90", "*.vim", "Makefile", "*/.pixi/*", "*.json" }
vim.g.gutentags_file_list_command = "rg --files"
vim.g.gutentags_exclude_project_root = { "/usr/local", "*/qmk_firmware/*", "*/.Trash/*" }
vim.g.table_mode_map_prefix = "<Leader>tm"

vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if kind ~= "install" and kind ~= "update" then
            return
        end
        if name == "nvim-treesitter" then
            if not ev.data.active then
                vim.cmd.packadd("nvim-treesitter")
            end
            vim.cmd("TSUpdate")
        elseif name == "mason.nvim" and vim.fn.exists(":MasonUpdate") == 2 then
            vim.cmd("MasonUpdate")
        end
    end,
})

vim.pack.add({
    gh("folke/tokyonight.nvim"),
    gh("folke/snacks.nvim"),
    gh("folke/noice.nvim"),
    gh("folke/todo-comments.nvim"),
    gh("nvim-mini/mini.nvim"),
    { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

    -- Completion
    { src = gh("Saghen/blink.cmp"), version = vim.version.range("1") },
    gh("rafamadriz/friendly-snippets"),
    gh("giuxtaposition/blink-cmp-copilot"),
    gh("zbirenbaum/copilot.lua"),

    -- LSP / tooling
    gh("neovim/nvim-lspconfig"),
    gh("williamboman/mason.nvim"),
    gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
    { src = gh("barreiroleo/ltex_extra.nvim"), version = "dev" },
    gh("stevearc/conform.nvim"),

    -- Editing / notes
    gh("tpope/vim-eunuch"),
    gh("dhruvasagar/vim-table-mode"),
    gh("OXY2DEV/markview.nvim"),
    gh("ray-x/yamlmatter.nvim"),
    { src = vim.fn.expand("~/srv/panotes"), name = "panotes" }, -- local dev plugin
    gh("ludovicchabant/vim-gutentags"),
    gh("olimorris/codecompanion.nvim"),

    -- Filetypes
    gh("heterophyllus/vscode-codev"),
    { src = gh("GuillaumeAllain/vim-codevmacro"), version = "dev" },

    -- Libraries
    gh("nvim-lua/plenary.nvim"),
    gh("MunifTanjim/nui.nvim"),
})

require("config.plugins.tokyonight")
require("config.plugins.mini")
require("config.plugins.blink")
require("config.lsp")
require("config.plugins.snacks")
require("config.plugins.noice")
require("config.plugins.todo-comments")
require("config.plugins.conform")
require("config.plugins.markview")
require("config.plugins.codecompanion")

-- Treesitter (main branch): highlighting is started per buffer.
vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)
        if lang then
            pcall(vim.treesitter.start, ev.buf, lang)
        end
    end,
})
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

require("yamlmatter").setup({})
require("panotes").setup({})
require("ltex_extra").setup({ load_langs = { "fr", "en-US" } })

vim.schedule(function()
    require("copilot").setup({ suggestion = { enabled = false }, panel = { enabled = false } })
    vim.fn.mkdir(vim.g.gutentags_cache_dir, "p")
    vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
end)
