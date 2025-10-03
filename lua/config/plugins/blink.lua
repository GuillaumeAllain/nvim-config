return {
    "Saghen/blink.cmp",
    lazy = true,
    event = "InsertEnter",
    version = "1.*",
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
            default = { "lsp", "path", "snippets", "copilot" },
            -- compat = { "pandoc_references" },
            providers = {
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
        "saghen/blink.compat",
    },
}
-- return {
--     "hrsh7th/nvim-cmp",
--     lazy = true,
--     event = "InsertEnter",
--     dependencies = {
--         "hrsh7th/vim-vsnip",
--         {
--             "onsails/lspkind-nvim",
--             config = function()
--                 require("lspkind").init()
--             end,
--         },
--         "hrsh7th/cmp-nvim-lsp",
--         "hrsh7th/cmp-path",
--         "hrsh7th/cmp-cmdline",
--         {
--             "GuillaumeAllain/cmp-pandoc.nvim",
--             config = function()
--                 require("cmp_pandoc").setup()
--             end,
--         },
--         {
--             "hrsh7th/cmp-vsnip",
--             commit = "1ae05c6",
--         },
--         {
--             "quangnguyen30192/cmp-nvim-tags",
--             event = "InsertEnter",
--             -- ft = { "pandoc", "markdown" },
--         },
--         "hrsh7th/cmp-buffer",
--         "hrsh7th/cmp-emoji",
--         "hrsh7th/cmp-nvim-lsp-signature-help",
--         {
--             "zbirenbaum/copilot-cmp",
--             config = function()
--                 require("copilot_cmp").setup()
--             end,
--             dependencies = {
--                 "zbirenbaum/copilot.lua",
--             },
--         },
--     },
--     config = function()
--         local cmp = require("cmp")
--         local types = require("cmp.types")
--
--         cmp.setup({
--             opts = {
--                 performance = {
--                     debounce = 0, -- default is 60ms
--                     throttle = 0, -- default is 30ms
--                 },
--             },
--             window = {
--                 -- completion = cmp.config.window.bordered(),
--                 -- documentation = cmp.config.window.bordered(),
--             },
--             completion = {
--                 completeopt = "menu,menuone,noinsert",
--                 keyword_length = 0,
--             },
--             mapping = {
--                 ["<C-L>"] = {
--                     i = cmp.mapping.confirm(),
--                     c = cmp.mapping.confirm(),
--                 },
--                 ["<C-n>"] = {
--                     i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Replace }),
--                     c = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Replace }),
--                 },
--                 ["<C-p>"] = {
--                     i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Replace }),
--                     c = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Replace }),
--                 },
--             },
--             sources = cmp.config.sources({
--                 { name = "copilot",                 keyword_length = 0, priority = 500 },
--                 { name = "vsnip",                   priority = 999,     keyword_length = 3 },
--                 { name = "nvim_lsp",                keyword_length = 3, priority = 700 },
--                 { name = "path",                    keyword_length = 3 },
--                 -- { name = "buffer" ,keyword_length=5},
--                 { name = "emoji",                   keyword_length = 2 },
--                 { name = "nvim_lsp_signature_help", keyword_length = 0 },
--             }),
--             snippet = {
--                 expand = function(args)
--                     vim.fn["vsnip#anonymous"](args.body)
--                 end,
--             },
--             formatting = {
--                 format = require("lspkind").cmp_format({
--                     mode = "symbol",
--                     maxwidth = 50,
--                     before = function(entry, vim_item)
--                         vim_item.menu = ({
--                             buffer = "[Buffer]",
--                             nvim_lsp = "[LSP]",
--                             vsnip = "[VSnip]",
--                             nvim_lua = "[nvim]",
--                             copilot = "[Copilot]",
--                             path = "[Path]",
--                             tags = "[Tags]",
--                             emoji = "[Emoji]",
--                         })[entry.source.name]
--                         return vim_item
--                     end,
--                 }),
--             },
--             enabled = function()
--                 -- disable completion in comments
--                 local context = require("cmp.config.context")
--                 -- keep command mode completion enabled when cursor is in a comment
--                 if vim.api.nvim_get_mode().mode == "c" then
--                     return true
--                 else
--                     return not context.in_treesitter_capture("comment") and not context.in_syntax_group("Comment")
--                 end
--             end,
--         })
--         cmp.setup.filetype({ "codev", "liseq", "sh", "zsh" }, {
--             sources = require("cmp.utils.misc").concat(
--                 require("cmp.config").global.sources,
--                 { { name = "buffer", keyword_length = 5 } }
--             ),
--         })
--         cmp.setup.cmdline(":", {
--             sources = {
--                 { name = "cmdline", keyword_length = 3 },
--             },
--         })
--         cmp.setup.cmdline("/", {
--             sources = {
--                 { name = "buffer", keyword_length = 3 },
--             },
--         })
--
--         local redact_sources = function()
--             return require("cmp.utils.misc").concat(require("cmp.config").global.sources, {
--                 { name = "tags",       keyword_pattern = [[\((\+\|\#\)\k\+]], keyword_length = 2 },
--                 { name = "cmp_pandoc", keyword_length = 2,                    keyword_pattern = [[\m@\k\+]] },
--             })
--         end
--         cmp.setup.filetype({ "pandoc", "markdown" }, {
--             sources = redact_sources(),
--         })
--         local liseq_sources = function()
--             return require("cmp.utils.misc").concat(require("cmp.config").global.sources, {
--                 { name = "tags", keyword_length = 2 },
--             })
--         end
--         cmp.setup.filetype({ "codevlisp" }, {
--             sources = liseq_sources(),
--         })
--
--         cmp.setup.filetype("TelescopePrompt", { enabled = false })
--         _G.toggle_cmp = function()
--             local enabled = require("cmp.config").get().enabled
--             if type(enabled) == "function" then
--                 enabled = enabled()
--             end
--             if enabled then
--                 require("cmp").setup.buffer({ enabled = false })
--             else
--                 require("cmp").setup.buffer({ enabled = true })
--             end
--         end
--     end,
-- }
