vim.g.mapleader = " "

require("config.lazy")

-- Core Settings
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

_G.statuscolumnon = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"
_G.statuscolumnoff = ""
_G.statuscolumnstatus = false
function _G.toggle_statuscolumn()
    if _G.statuscolumnstatus == false then
        vim.cmd("set relativenumber!")
        vim.cmd("set number!")
        pcall(vim.cmd, "Gitsigns toggle_signs")
        vim.opt.numberwidth = 3
        vim.opt.statuscolumn = _G.statuscolumnon
        _G.statuscolumnstatus = true
    else
        vim.cmd("set relativenumber!")
        vim.cmd("set number!")
        pcall(vim.cmd, "Gitsigns toggle_signs")
        vim.opt.numberwidth = 2
        vim.opt.statuscolumn = _G.statuscolumnoff
        _G.statuscolumnstatus = false
    end
end

_G.toggle_statuscolumn()

vim.opt.formatoptions = "ro"
vim.opt.statuscolumn = _G.statuscolumnoff
vim.opt.splitkeep = "screen"
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scl = "auto"
vim.opt.clipboard = "unnamed"
vim.opt.fixeol = false

vim.opt.completeopt = "menu,menuone,noinsert,noselect,popup"
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
vim.wo.foldlevel = 3

vim.opt.ssop = "blank,buffers,curdir,help,terminal"

vim.opt.undofile = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.spelllang = "fr"

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20
vim.opt.laststatus = 3

vim.cmd.cnoreabbrev("<expr>", "w", 'getcmdtype() == ":" && getcmdline()=="w" ? "silent w" : "w"')
vim.cmd.cnoreabbrev("<expr>", "wqa", 'getcmdtype() == ":" && getcmdline()=="wqa" ? "silent wa | qa" : "wqa"')
vim.cmd.au({ "BufWritePre", "/tmp/*", "setlocal", "noundofile", bang = true })
vim.cmd.au({ "User", "Startified", "setlocal", "buflisted", bang = true })
vim.cmd.au({ "Filetype", "help", ":wincmd L | :vert resize 90", bang = true })
vim.cmd.au({ "TextYankPost", "*", "silent! lua vim.highlight.on_yank{timeout=75,bang=true}", bang = true })
vim.cmd.au({ "BufRead,BufNewFile", "*.mac", "set filetype=codev" })
vim.g["$MANPAGER"] = "nvr +Man! -"
vim.opt.path = vim.opt.path + ".,**"

vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()" (moved to treesitter config)

vim.diagnostic.config({
    virtual_lines = true,
    virtual_text = false,
    signs = true,
    update_in_insert = false,
})

vim.schedule(function()
    vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
end)

vim.api.nvim_create_autocmd("CursorMoved", {
    group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
    callback = function()
        if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
            vim.schedule(function()
                vim.cmd.nohlsearch()
            end)
        end
    end,
})

vim.deprecate = function() end

-- Auto-open smart picker on startup if no files are opened
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
            require("snacks").picker.smart({cwd = vim.loop.cwd()})
        end
    end,
})

-- Keymaps
vim.cmd([[
    nnoremap <leader><leader> <c-^>

    nnoremap H ^
    nnoremap L $
    vnoremap H ^
    vnoremap L $
    nnoremap <C-o> <C-o>zz

    noremap <expr> (search-forward) 'Nn'[v:searchforward]
    noremap <expr> (search-backward) 'nN'[v:searchforward]

    nmap n (search-forward)zzzv
    xmap n (search-forward)zzzv

    nmap N (search-backward)zzzv
    xmap N (search-backward)zzzv
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

    imap <escape> <C-\><C-n>
    tnoremap <Esc><Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-k> <C-\><C-n><C-w>w
    nnoremap <C-p> <C-]>

    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap [ [<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u
]])

require("config.plugins-keymaps")
