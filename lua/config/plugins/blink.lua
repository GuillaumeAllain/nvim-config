require("blink.cmp").setup({
    appearance = { nerd_font_variant = "mono" },
    keymap = { preset = "enter", ["<C-l>"] = { "select_and_accept" } },
    snippets = { preset = "mini_snippets" },
    completion = { documentation = { auto_show = false } },
    sources = {
        default = { "lsp", "path", "snippets", "copilot" },
        per_filetype = { codecompanion = { "codecompanion" } },
        providers = {
            copilot = {
                name = "copilot",
                module = "blink-cmp-copilot",
                score_offset = 100,
                async = true,
                transform_items = function(_, items)
                    local kinds = require("blink.cmp.types").CompletionItemKind
                    local kind_idx = #kinds + 1
                    kinds[kind_idx] = "Copilot"
                    for _, item in ipairs(items) do
                        item.kind = kind_idx
                    end
                    return items
                end,
            },
        },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
})
