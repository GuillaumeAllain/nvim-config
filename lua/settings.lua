-- disable vim plugins
local disabled_built_ins = {
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "sql_completion",
    "syntax_completion",
    "matchit",
    -- "netrwPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
-- use nathom/filetype.nvim
vim.g.did_load_filetypes = 1

-- vim.g.vimsyn_embed  = 1

vim.opt.timeoutlen = 200
vim.opt.scl = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 1000
if vim.loop.os_uname().sysname=="Darwin" then
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
      cache_enabled = 0
   }
end
vim.opt.clipboard = "unnamed"

vim.opt.completeopt = "menuone,noselect"
vim.opt.shortmess = vim.o.shortmess .. "c" .. "I"
vim.opt.hidden = true
vim.opt.expandtab = true
-- vim.opt.title = true
-- vim.opt.titlestring = ""
vim.opt.wildmode = "longest,full"
vim.opt.showtabline = 0
vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
-- vim.cmd([[set fillchars=fold:\ ,eob:\ ]])
vim.opt.fillchars:append({ eob = " ", fold = " " })
vim.wo.foldnestmax = 3
vim.wo.foldminlines = 1

vim.opt.ssop = "blank,buffers,curdir,help,terminal"

-- vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.lazyredraw = true

vim.opt.undofile = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.spelllang = "fr"

vim.g.mapleader = " "
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.python3_host_prog = vim.fn.expand(os.getenv("HOME").."/miniconda3/bin/python")

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.pyindent_searchpair_timeout = 10
vim.g.netrw_winsize = 20
vim.opt.laststatus = 2
-- vim.opt.inccommand="split"

vim.cmd([[
command! -nargs=* W w
au BufWritePre /tmp/* setlocal noundofile
au User Startified setlocal buflisted
au! FileType help :wincmd L | :vert resize 90
au TermOpen * setlocal nonumber norelativenumber | startinsert
au TextYankPost * silent! lua vim.highlight.on_yank{timeout=75}
let $MANPAGER='nvr +Man! -'
]])

vim.opt.foldmethod = "expr"
vim.opt.background = "light"
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
