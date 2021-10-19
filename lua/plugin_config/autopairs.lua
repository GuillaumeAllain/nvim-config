-- local remap = vim.api.nvim_set_keymap
local npairs =require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

require("nvim-autopairs.completion.cmp").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
  auto_select = true, -- automatically select the first item
  insert = false, -- use insert confirm behavior instead of replace
  map_char = { -- modifies the function or method delimiter by filetypes
    all = '(',
    tex = '{'
  }
})

npairs.setup({
    pairs_map = {
        ["'"] = "'",
        ['"'] = '"',
        ["("] = ")",
        ["["] = "]",
        ["{"] = "}",
        ["`"] = "`",
        ["$"] = "$",
    },
})

npairs.add_rules({
  Rule("$", "$",{"tex", "latex", "pandoc"})
    -- don't move right when repeat character
    :with_move(cond.none())
    -- disable add newline when press <cr>
    :with_cr(cond.none())
  }
)

npairs.add_rules({
  Rule("*", "*",{"pandoc"})
    -- don't move right when repeat character
    :with_move(cond.none())
    -- disable add newline when press <cr>
    :with_cr(cond.none())
  }
)
