-- disable vim plugins
-- local disabled_built_ins = {
--     "gzip",
--     "zip",
--     "zipPlugin",
--     "tar",
--     "tarPlugin",
--     "getscript",
--     "getscriptPlugin",
--     "vimball",
--     "vimballPlugin",
--     "2html_plugin",
--     "logipat",
--     "rrhelper",
--     "spellfile_plugin",
--     "sql_completion",
--     "syntax_completion",
--     "matchit",
-- }

-- for _, plugin in pairs(disabled_built_ins) do
--     vim.g["loaded_" .. plugin] = 1
-- end
vim.o.guifont = "SFmono Nerd Font:h15"

vim.opt.background = vim.fn.system("head -1 " .. vim.fn.expand("$XDG_CACHE_HOME/kitty/nvim_theme.conf")):gsub("\n", ""):
    sub(3)
vim.g.node_prog_host = "/usr/local/opt/node@16/bin"
vim.filetype.add({
    filename = {
        [".notes"] = "pandoc",
    },
    extension = {
        seq = "codev",
        md = "pandoc",
        liseq = "codevlisp",
        tikz = "tikz",
    },
})

vim.cmd.helptags(vim.fn.stdpath("config") .. "/doc/")

vim.opt.termguicolors = true
vim.opt.splitkeep = "screen"
vim.opt.pumheight = 10
vim.opt.timeoutlen = 200
vim.opt.scl = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 100
vim.opt.scl = "auto"
if vim.loop.os_uname().sysname == "Darwin" then
    vim.g.clipboard = {
        name = "macOS-clipboard",
        copy = {
            ["+"] = "pbcopy",
            ["*"] = "pbcopy",
        },
        paste = {
            ["+"] = "pbpaste",
            ["*"] = "pbpaste",
        },
        cache_enabled = 0,
    }
end
vim.opt.clipboard = "unnamed"
vim.opt.fixeol = false

vim.opt.completeopt = "menu,menuone,noinsert,noselect"
vim.opt.shortmess = "a" .. vim.o.shortmess .. "c" .. "I"
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.cmdheight = 1
vim.opt.wildmode = "longest,full"
vim.opt.showtabline = 0
vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
vim.opt.fillchars:append({ eob = " ", fold = " " })
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

vim.opt.ssop = "blank,buffers,curdir,help,terminal"

vim.opt.undofile = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.spelllang = "fr"

vim.g.mapleader = " "
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 1
vim.g.python3_host_prog = vim.fn.expand(os.getenv("HOME") .. "/miniconda3/bin/python")

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.pyindent_searchpair_timeout = 10
vim.g.netrw_winsize = 20
vim.opt.laststatus = 3

vim.cmd.cnoreabbrev("<expr>", "w", 'getcmdtype() == ":" && getcmdline()=="w" ? "silent w" : "w"')
vim.cmd.au({ "BufWritePre", "/tmp/*", "setlocal", "noundofile", bang = true })
vim.cmd.au({ "User", "Startified", "setlocal", "buflisted", bang = true })
vim.cmd.au({ "Filetype", "help", ":wincmd L | :vert resize 90", bang = true })
vim.cmd.au({ "TextYankPost", "*", "silent! lua vim.highlight.on_yank{timeout=75,bang=true}", bang = true })
vim.g["$MANPAGER"] = "nvr +Man! -"
vim.opt.path = vim.opt.path + ".,**"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true
vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
})
vim.diagnostic.config({
    virtual_text = false,
})
