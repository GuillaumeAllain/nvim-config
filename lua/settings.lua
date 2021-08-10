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
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- vim.g.vimsyn_embed  = 1

vim.opt.laststatus = 0

vim.opt.timeoutlen = 200
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.updatetime = 1000
vim.opt.clipboard = 'unnamed'
vim.opt.completeopt = 'menuone,noselect'
vim.opt.shortmess = vim.o.shortmess.."c".."I"
vim.opt.hidden = true
vim.opt.expandtab = true
-- vim.opt.title = true
-- vim.opt.titlestring = ""
vim.opt.wildmode="longest,full"

vim.opt.ssop = "blank,buffers,curdir,help,terminal"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.lazyredraw = true

vim.opt.undofile = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.spelllang = "fr"

vim.g.mapleader=" "
vim.g.python3_host_prog='/usr/local/anaconda3/bin/python'
vim.g.netrw_banner=0
vim.g.netrw_liststyle=3
vim.g.pyindent_searchpair_timeout = 10

vim.cmd[[
command! -nargs=* W w
au BufWritePre /tmp/* setlocal noundofile
autocmd User Startified setlocal buflisted
autocmd! FileType help :wincmd L | :vert resize 90
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert
]]

vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true
vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    update_in_insert = false,
}
)
