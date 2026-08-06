require("snacks").setup({
    bigfile = { enabled = true },
    image = { enabled = true, doc = { inline = false } },
    explorer = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    scratch = { enabled = true },
    LSP = { enabled = true },
    picker = {
        enabled = true,
        win = { input = { keys = { ["<C-space>"] = { "toggle_live", mode = { "i", "n" } } } } },
    },
    styles = {
        notification = {
            focusable = false,
        },
    },
})

local map = vim.keymap.set
map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Git Files" })
map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent Files" })
map("n", "<leader>f/", function() Snacks.picker.lines() end, { desc = "Grep Current Buffer" })
map("n", "<leader>fw", function() Snacks.picker.grep_word() end, { desc = "Grep Word Under Cursor" })
map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Tags" })
map("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, { desc = "Config Files" })
map("n", "<leader>fm", function() Snacks.picker.marks() end, { desc = "Marks" })
map("n", "<leader>fd", function() Snacks.picker.smart({ filter = { cwd = true } }) end, { desc = "Smart Files" })
map("n", "<leader>ff", function() Snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fs", function() Snacks.explorer() end, { desc = "File Explorer" })
map("n", "<leader>ft", function() Snacks.picker() end, { desc = "Picker Builtin" })
map("n", "<leader>fz", function() Snacks.picker.spelling() end, { desc = "Spelling Suggestions" })
map("n", "<leader>f<space>", function() Snacks.picker.find_files() end, { desc = "Find Files" })
map("n", "<leader>f<leader>", function() Snacks.picker.resume() end, { desc = "Resume Picker" })
map("n", "<leader>fj", function() Snacks.picker.grep() end, { desc = "Live grep" })
map("n", "<leader>fl", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
map("n", "<leader>fC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })
map("n", "<leader>s", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
map("n", "grr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
map("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>d", function() require("snacks").bufdelete.delete() end, { desc = "Delete current buffer" })
