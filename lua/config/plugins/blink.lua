return {
    "Saghen/blink.cmp",
    lazy = true,
    event = "InsertEnter",
    version = "1.*",
    specs = {
        -- install the blink, nvim-cmp compatibility layer
        { "Saghen/blink.compat", version = "*", lazy = true, opts = {} },
    },
    opts = {
        appearance = {
            nerd_font_variant = "mono",
        },
        keymap = {
            preset = "enter",
            ["<C-l>"] = { "select_and_accept" },
        },

        completion = { documentation = { auto_show = false } },
        sources = {
            default = { "lsp", "path", "snippets", "copilot" , "pandoc_references"},
            providers = {
                pandoc_references = {
                    name = "pandoc_references",
                    module = "blink.compat.source",
                    -- triggers = { "@" },
                },
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                    transform_items = function(_, items)
                        local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = "Copilot"
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
    dependencies = {
        "rafamadriz/friendly-snippets",
        "jc-doyle/cmp-pandoc-references",
        "giuxtaposition/blink-cmp-copilot",
    },
}
