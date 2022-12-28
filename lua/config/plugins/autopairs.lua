return {
    "windwp/nvim-autopairs",
    event = "InsertEnter *",
    config=function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

        -- require("nvim-autopairs.completion.cmp").setup({
        --     map_cr = true, --  map <CR> on insert mode
        --     map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
        --     auto_select = true, -- automatically select the first item
        --     insert = false, -- use insert confirm behavior instead of replace
        --     map_char = { -- modifies the function or method delimiter by filetypes
        --         all = "(",
        --         tex = "{",
        --     },
        -- })
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('cmp')
        cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

        npairs.setup({
            enable_check_bracket_line = false,
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

        npairs.get_rule("`"):with_pair(function()
            if vim.bo.filetype == "apl" then
                return false
            end
        end)

        npairs.get_rule("["):with_pair(function()
            if vim.bo.filetype == "apl" then
                return false
            end
        end)

        npairs.get_rule("("):with_pair(function()
            if vim.bo.filetype == "apl" then
                return false
            end
        end)

        npairs.add_rules({
            Rule("$", "$", { "tex", "latex", "pandoc" })    -- don't move right when repeat character
            :with_move(cond.none())    -- disable add newline when press <cr>
            :with_cr(cond.none()),
        })

        npairs.add_rules({
            Rule("*", "*", { "pandoc" })    -- don't move right when repeat character
            :with_move(cond.none())    -- disable add newline when press <cr>
            :with_cr(cond.none()),
        })

    end
}
