return {
    "windwp/nvim-autopairs",
    event = "InsertEnter *",
    config = function()
        local npairs = require("nvim-autopairs")
        local Rule = require("nvim-autopairs.rule")
        local cond = require("nvim-autopairs.conds")

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
            Rule("$", "$", { "tex", "latex", "pandoc" }) -- don't move right when repeat character
                :with_move(cond.none()) -- disable add newline when press <cr>
                :with_cr(cond.none()),
        })

        npairs.add_rules({
            Rule("*", "*", { "pandoc" }) -- don't move right when repeat character
                :with_move(cond.none()) -- disable add newline when press <cr>
                :with_cr(cond.none()),
        })
    end,
}
