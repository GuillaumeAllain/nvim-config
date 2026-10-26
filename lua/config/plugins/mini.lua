require("mini.icons").setup()
require("mini.indentscope").setup()
vim.api.nvim_create_autocmd("TermOpen", { command = "let b:miniindentscope_disable = v:true" })
require("mini.comment").setup({ options = { ignore_blank_lines = true } })
require("mini.pairs").setup()
require("mini.ai").setup()
-- `sf` is taken by mini.jump2d below.
require("mini.surround").setup({ mappings = { find = "", find_left = "" } })
require("mini.git").setup()
require("mini.diff").setup({ view = { style = "sign" } })

local snippets = require("mini.snippets")
snippets.setup({
    snippets = {
        snippets.gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/global.json"),
        snippets.gen_loader.from_lang(),
    },
    expand = {},
})

local jump2d = require("mini.jump2d")
jump2d.setup({ mappings = { start_jumping = "" } })
vim.keymap.set({ "n", "x", "o" }, "sf", function()
    jump2d.start(jump2d.builtin_opts.single_character)
end, { desc = "Jump to character" })

local statusline = require("mini.statusline")
statusline.setup({
    content = {
        active = function()
            local mode, mode_hl = statusline.section_mode({})
            local b_hl = mode_hl:gsub("MiniStatuslineMode", "StatuslineB")
            local reg = vim.fn.reg_recording()
            local lsp = {}
            for _, c in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                if vim.tbl_contains(c.config.filetypes or {}, vim.bo.filetype) then
                    table.insert(lsp, c.name)
                end
            end
            local ntabs = vim.fn.tabpagenr("$")
            local flags = (vim.bo.modified and " [+]" or "") .. ((vim.bo.readonly or not vim.bo.modifiable) and " [-]" or "")
            return statusline.combine_groups({
                { hl = mode_hl, strings = { mode:upper() } },
                { hl = b_hl, strings = { reg ~= "" and ("Recording @" .. reg) or "" } },
                "%=",
                { hl = b_hl, strings = { "%t" .. flags } },
                "%=",
                {
                    hl = "MiniStatuslineFileinfo",
                    strings = {
                        vim.bo.filetype,
                        "  LSP: " .. (#lsp > 0 and table.concat(lsp, ",") or "No Active Lsp"),
                        ntabs > 1 and ("Tab: %d/%d"):format(vim.fn.tabpagenr(), ntabs) or "",
                    },
                },
            })
        end,
    },
})

local clue = require("mini.clue")
clue.setup({
    triggers = {
        { mode = "n", keys = "<Leader>" },
        { mode = "x", keys = "<Leader>" },
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },
    },
    clues = {
        clue.gen_clues.builtin_completion(),
        clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.z(),
        { mode = "n", keys = "<Leader>b", desc = "+build" },
        { mode = "n", keys = "<Leader>f", desc = "+find" },
        { mode = "n", keys = "<Leader>g", desc = "+misc" },
        { mode = "n", keys = "<Leader>h", desc = "+git hunks" },
        { mode = "n", keys = "<Leader>p", desc = "+panotes" },
        { mode = "n", keys = "<Leader>t", desc = "+table mode" },
    },
    window = { delay = 300 },
})

local map = vim.keymap.set
map("n", "<leader>hs", "ghgh", { remap = true, desc = "Stage hunk" })
map("n", "<leader>hr", "gHgh", { remap = true, desc = "Reset hunk" })
map("n", "<leader>hp", function() require("mini.diff").toggle_overlay() end, { desc = "Toggle diff overlay" })
map("n", "<leader>hb", "<Cmd>vertical Git blame -- %<CR>", { desc = "Blame file" })
map({ "n", "x" }, "<leader>hc", function() require("mini.git").show_at_cursor() end, { desc = "Git info at cursor" })
