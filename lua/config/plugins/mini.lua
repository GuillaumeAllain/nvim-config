-- mini.nvim modules. (The nvim-web-devicons mock for mini.icons lives in the
-- loader, lua/config/plugins/init.lua, since it must run before any require.)
require("mini.indentscope").setup()
vim.cmd([[autocmd TermOpen * lua vim.b.miniindentscope_disable = true]])
require("mini.comment").setup({ options = { ignore_blank_lines = true } })

local mini_snippets = require("mini.snippets")
mini_snippets.setup({
    snippets = {
        mini_snippets.gen_loader.from_file(vim.fn.stdpath("config") .. "/snippets/global.json"),
        mini_snippets.gen_loader.from_lang(),
    },
    expand = {},
})
