vim.g.mapleader = " "

require("config.plugins")

vim.filetype.add({
    filename = { [".notes"] = "pandoc" },
    extension = {
        seq = "codev",
        mac = "codev",
        md = "pandoc",
        liseq = "codevlisp",
        tikz = "tikz",
    },
})

vim.cmd.helptags(vim.fn.stdpath("config") .. "/doc/")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.formatoptions = "ro"
vim.opt.splitkeep = "screen"
vim.opt.pumheight = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.signcolumn = "auto"
vim.opt.fixeol = false
vim.opt.completeopt = "menu,menuone,noinsert,noselect,popup"
vim.opt.shortmess:append("acI")
vim.opt.expandtab = true
vim.opt.wildmode = "longest,full"
vim.opt.showtabline = 0
vim.opt.laststatus = 3
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\t',&tabstop),'g').'...'.trim(getline(v:foldend))]]
vim.opt.fillchars:append({ eob = " ", fold = " " })
vim.opt.foldmethod = "expr"
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
vim.opt.foldlevel = 3
vim.opt.ssop = "blank,buffers,curdir,help,terminal"
vim.opt.undofile = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.spelllang = "fr"
vim.opt.path:append(".,**")
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 20

vim.schedule(function()
    vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
end)

vim.diagnostic.config({ virtual_lines = true, virtual_text = false, signs = true })
vim.deprecate = function() end

vim.cmd.cnoreabbrev("<expr>", "w", 'getcmdtype() == ":" && getcmdline()=="w" ? "silent w" : "w"')
vim.cmd.cnoreabbrev("<expr>", "wqa", 'getcmdtype() == ":" && getcmdline()=="wqa" ? "silent wa | qa" : "wqa"')

local au = vim.api.nvim_create_autocmd
au("BufWritePre", { pattern = "/tmp/*", command = "setlocal noundofile" })
au("FileType", { pattern = "help", command = "wincmd L | vert resize 90" })
au("TextYankPost", { callback = function() vim.hl.on_yank({ timeout = 75 }) end })

au("CursorMoved", {
    callback = function()
        if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
            vim.schedule(vim.cmd.nohlsearch)
        end
    end,
})

au("BufEnter", {
    callback = function(ev)
        if vim.bo[ev.buf].buftype ~= "" then
            return
        end
        -- Pickers like snacks use bufload(), which leaves the filetype unset.
        if vim.bo[ev.buf].filetype == "" then
            local ft = vim.filetype.match({ buf = ev.buf })
            if ft then
                vim.bo[ev.buf].filetype = ft
            end
        end
        -- cd to the project root (replaces project.nvim).
        local root = vim.fs.root(ev.buf, { ".git", ".notes" })
        if root and root ~= vim.uv.cwd() then
            vim.fn.chdir(root)
        end
    end,
})

au("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 and vim.api.nvim_buf_get_name(0) == "" then
            Snacks.picker.smart({ cwd = vim.uv.cwd() })
        end
    end,
})

-- Keymaps
vim.cmd([[
    nnoremap <leader><leader> <c-^>
    nnoremap H ^
    vnoremap H ^
    nnoremap L $
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

local map = vim.keymap.set
local utils = require("utils")
local function build(cmd)
    return function()
        vim.cmd.write()
        utils.send_command_to_build_terminal(cmd and (cmd .. " " .. vim.fn.fnameescape(vim.fn.expand("%:p"))) or "!!")
    end
end
map("n", "<leader>gl", function() utils.toggle_build_buffer_window({ vertical = false }) end, { desc = "Toggle build term" })
map("n", "<leader>bb", build("builder"), { desc = "build dans term" })
map("n", "<leader>bl", build(), { desc = "dernière commande" })
map("n", "<leader>bo", build("opener"), { desc = "ouvrir dans term" })
map("n", "<leader>bc", build("cleaner"), { desc = "clean avec term" })
map({ "n", "i" }, "<C-k>", function() utils.focus_build_buffer_window({ vertical = false }) end, { desc = "focus term" })

map("n", "<leader>gd", function() utils.macdict(vim.fn.expand("<cword>")) end, { desc = "macos dictionary" })
map("x", "<leader>gd", '"dy<Cmd>lua require("utils").macdict(vim.fn.getreg("d"))<CR>', { desc = "macos dictionary" })
map("n", "<leader>gn", function()
    local on = not vim.o.number
    vim.o.number, vim.o.relativenumber = on, on
    vim.o.signcolumn = on and "auto" or "no"
end, { desc = "Toggle number" })

map("n", "<leader>pa", "<Cmd>Panotes openTagInput<CR>", { desc = "open tags" })
map("n", "<leader>pc", "<Cmd>Panotes capture<CR>", { desc = "capture" })
map("n", "<leader>pd", "<Cmd>Panotes openDiary<CR>", { desc = "diary" })
map("n", "<leader>pg", "<Cmd>Panotes liveGrep<CR>", { desc = "live grep notes" })
map("n", "<leader>pj", "<Cmd>Panotes openJournal<CR>", { desc = "journal" })
map("n", "<leader>ps", "<Cmd>Panotes searchTags<CR>", { desc = "search tags" })
map("n", "<leader>pt", function()
    vim.cmd("Panotes change_cwd_to_notes_dir")
    Snacks.picker.todo_comments()
end, { desc = "Search todo in notes" })
