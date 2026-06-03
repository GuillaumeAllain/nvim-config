-- Central plugin loader (vim.pack).
--
-- Replaces lazy.nvim. vim.pack is intentionally minimal: no opts/config/
-- dependencies/build/lazy-loading sugar. We install + load everything up front
-- with a single vim.pack.add(), then run each plugin's setup in a controlled
-- order. Build steps (TSUpdate, MasonUpdate) run via PackChanged autocmds, which
-- MUST be registered before the vim.pack.add() that installs the plugin.
--
-- See the bottom of this file for recipes to re-add on-demand lazy-loading.

local gh = function(repo) return "https://github.com/" .. repo end

-- a) Reproduce lazy.nvim's performance.rtp.disabled_plugins -----------------
for _, p in ipairs({
    "gzip", "zip", "zipPlugin", "tar", "tarPlugin", "getscript", "getscriptPlugin",
    "vimball", "vimballPlugin", "2html_plugin", "logipat", "rrhelper",
    "spellfile_plugin", "tutor", "tohtml", "matchit", "matchparen",
}) do
    vim.g["loaded_" .. p] = 1
end

-- b) mini.icons mock: must be set BEFORE anything requires nvim-web-devicons.
--    (nvim-web-devicons itself is not installed; mini.icons stands in for it.)
package.preload["nvim-web-devicons"] = function()
    package.loaded["nvim-web-devicons"] = {}
    require("mini.icons").mock_nvim_web_devicons()
    return package.loaded["nvim-web-devicons"]
end

-- c) vim.g for vimscript plugins that read globals at *source* time.
--    vim.pack.add() sources plugins immediately, so these must be set first.
vim.g.gutentags_project_root = { "package.json", ".git", ".notes" }
vim.g.gutentags_cache_dir = vim.fn.expand(vim.fn.stdpath("cache") .. "ctags")
vim.g.gutentags_generate_on_new = true
vim.g.gutentags_generate_on_missing = true
vim.g.gutentags_generate_on_write = true
vim.g.gutentags_generate_on_empty_buffer = true
vim.g.gutentags_ctags_exclude =
    { "*/qmk_firmware/*", ".Trash", "*.f90", "*.vim", "Makefile", "*/.pixi/*", "*.json" }
vim.g.gutentags_file_list_command = "rg --files"
vim.g.gutentags_exclude_project_root = { "/usr/local", "*/qmk_firmware/*", "*/.Trash/*" }

-- d) Build hooks, registered BEFORE vim.pack.add() (guide requirement) -------
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
        elseif name == "mason.nvim" then
            if not ev.data.active then
                vim.cmd.packadd("mason.nvim")
            end
            -- :MasonUpdate only exists once mason's plugin files are sourced;
            -- guard so a fresh install doesn't error.
            if vim.fn.exists(":MasonUpdate") == 2 then
                vim.cmd("MasonUpdate")
            end
        end
    end,
})

-- e) Install + load every plugin --------------------------------------------
vim.pack.add({
    -- Colorscheme / UI
    gh("folke/tokyonight.nvim"),
    gh("folke/snacks.nvim"),
    gh("folke/noice.nvim"),
    gh("folke/which-key.nvim"),
    gh("folke/trouble.nvim"),
    gh("folke/flash.nvim"),
    gh("folke/todo-comments.nvim"),
    gh("nvim-lualine/lualine.nvim"),

    -- mini.nvim (indentscope, comment, snippets, icons)
    gh("nvim-mini/mini.nvim"),

    -- Treesitter (main branch; parsers updated via PackChanged -> :TSUpdate)
    { src = gh("nvim-treesitter/nvim-treesitter"), version = "main" },

    -- Completion (blink, pinned to 1.x) + sources
    { src = gh("Saghen/blink.cmp"), version = vim.version.range("1") },
    gh("Saghen/blink.compat"),
    gh("rafamadriz/friendly-snippets"),
    gh("jc-doyle/cmp-pandoc-references"),
    gh("giuxtaposition/blink-cmp-copilot"),
    gh("zbirenbaum/copilot.lua"),

    -- LSP / tooling
    gh("neovim/nvim-lspconfig"),
    gh("williamboman/mason.nvim"),
    gh("williamboman/mason-lspconfig.nvim"),
    gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
    { src = gh("barreiroleo/ltex_extra.nvim"), version = "dev" },
    gh("stevearc/conform.nvim"),

    -- Editing
    gh("m4xshen/hardtime.nvim"),
    gh("windwp/nvim-autopairs"),
    gh("wellle/targets.vim"),
    gh("tpope/vim-eunuch"),
    gh("machakann/vim-sandwich"),
    gh("dhruvasagar/vim-table-mode"),

    -- Git
    gh("lewis6991/gitsigns.nvim"),
    gh("sindrets/diffview.nvim"),

    -- Markdown / notes / prose
    gh("OXY2DEV/markview.nvim"),
    gh("ray-x/yamlmatter.nvim"),
    { src = vim.fn.expand("~/srv/panotes"), name = "panotes" }, -- local dev plugin
    gh("ludovicchabant/vim-gutentags"),

    -- AI
    gh("olimorris/codecompanion.nvim"),

    -- Testing
    gh("nvim-neotest/neotest"),
    gh("nvim-neotest/nvim-nio"),
    gh("antoinemadec/FixCursorHold.nvim"),
    gh("nvim-neotest/neotest-python"),

    -- Project / filetypes
    gh("ahmedkhalf/project.nvim"),
    gh("heterophyllus/vscode-codev"),
    { src = gh("GuillaumeAllain/vim-codevmacro"), version = "dev" },

    -- Shared libraries
    gh("nvim-lua/plenary.nvim"),
    gh("MunifTanjim/nui.nvim"),
})

-- f) Run setups in order ----------------------------------------------------
-- Early-render first file as fast as possible (was utils.lazy_file()).
require("utils").lazy_file()

require("config.plugins.tokyonight") -- colorscheme first
require("config.plugins.mini")
require("config.plugins.treesitter")
require("config.plugins.blink")
require("config.lsp") -- lspconfig setup (pcall's blink, order-tolerant)

require("config.plugins.snacks")
require("config.plugins.noice")
require("config.plugins.lualine")
require("config.plugins.which-key")
require("config.plugins.flash")
require("config.plugins.trouble")
require("config.plugins.todo-comments")

require("config.plugins.gitsigns")
require("config.plugins.autopairs")
require("config.plugins.hardtime")
require("config.plugins.conform")
require("config.plugins.diffview")
require("config.plugins.markview")
require("config.plugins.yamlmatter")
require("config.plugins.table-mode")
require("config.plugins.sandwich")
require("config.plugins.ltex_extra")
require("config.plugins.codecompanion")
require("config.plugins.panotes")
require("config.plugins.project")
require("config.plugins.mason")

-- Heavy / non-interactive: each defers its own body via vim.schedule.
require("config.plugins.copilot")
require("config.plugins.gutentags")
require("config.plugins.neotest")

-----------------------------------------------------------------------------
-- Lazy-loading recipes (NOT active). vim.pack has no event/ft/cmd/keys sugar;
-- reach for these only if startup regresses for a specific heavy plugin.
--
-- On first insert (e.g. to defer copilot):
--   vim.api.nvim_create_autocmd("InsertEnter", { once = true, callback = function()
--     vim.pack.add({ "https://github.com/zbirenbaum/copilot.lua" })
--     require("copilot").setup({ suggestion = { enabled = false }, panel = { enabled = false } })
--   end })
--
-- On a filetype:
--   vim.api.nvim_create_autocmd("FileType", {
--     pattern = { "markdown", "pandoc" },
--     once = true,
--     callback = function() require("config.plugins.markview") end,
--   })
--
-- Register-but-don't-load now, then :packadd <name> on demand:
--   vim.pack.add({ "https://github.com/owner/foo" }, { load = function() end })
--   -- later: vim.cmd.packadd("foo"); require("foo").setup({})
-----------------------------------------------------------------------------
