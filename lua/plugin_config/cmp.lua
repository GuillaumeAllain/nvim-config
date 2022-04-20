local cmp = require("cmp")
local types = require("cmp.types")

cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
        keyword_length = 0,
    },
    mapping = {
        ["<C-L>"] = cmp.mapping.confirm({
            select = true,
        }),
        ["<C-n>"] = {
            i = cmp.mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }),
        },
        ["<C-p>"] = {
            i = cmp.mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }),
        },
    },
    sources = cmp.config.sources({
        { name = "copilot", keyword_length = 0 },
        { name = "vsnip", priority = 1000, keyword_length = 3 },
        { name = "nvim_lsp", keyword_length = 3 },
        { name = "path", keyword_length = 3 },
        -- { name = "buffer" ,keyword_length=5},
        { name = "emoji", keyword_length = 2 },
        { name = "nvim_lsp_signature_help", keyword_length = 0 },
    }),
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    formatting = {
        -- format = function(entry, vim_item)
        --     -- fancy icons and a name of kind
        --     vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

        --     -- set a name for each source
        --     vim_item.menu = ({
        --         buffer = "[Buffer]",
        --         nvim_lsp = "[LSP]",
        --         vsnip = "[VSnip]",
        --         nvim_lua = "[nvim]",
        --         path = "[Path]",
        --         tags = "[Tags]",
        --         emoji = "[Emoji]",
        --     })[entry.source.name]
        --     return vim_item
        -- end,
        format = require("lspkind").cmp_format({
            mode = "symbol",
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    nvim_lsp = "[LSP]",
                    vsnip = "[VSnip]",
                    nvim_lua = "[nvim]",
                    copilot = "[Copilot]",
                    path = "[Path]",
                    tags = "[Tags]",
                    emoji = "[Emoji]",
                })[entry.source.name]
                return vim_item
            end,
        }),
    },
    view = {
        entries = "native",
    },
    -- experimental = {
    --     native_menu = false,
    --     ghost_text = true,
    -- },
})
cmp.setup.filetype({ "codev", "liseq", "sh", "zsh" }, {
    sources = require("cmp.utils.misc").concat(
        require("cmp.config").global.sources,
        { { name = "buffer", keyword_length = 5 } }
    ),
})
cmp.setup.cmdline(":", {
    sources = {
        { name = "cmdline" },
    },
})
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

local redact_sources = function()
    local default_sources = require("cmp.config").global.sources
    local new_sources = {}
    for index, _ in ipairs(default_sources) do
        if default_sources[index].name ~= "copilot" then
            new_sources[#new_sources + 1] = default_sources[index]
        end
    end
    return require("cmp.utils.misc").concat(
        new_sources,
        { { name = "tags", keyword_pattern = [[\#\k\+]], keyword_length = 2 }, { name = "cmp_pandoc" } }
    )
end
cmp.setup.filetype({ "pandoc", "markdown" }, {
    sources = redact_sources(),
})

-- print(require"cmp.config.sources")
cmp.setup.filetype("TelescopePrompt", { enabled = false })
-- au Filetype lua lua require'cmp'.setup.buffer{sources=require("cmp.utils.misc").concat(require("cmp.config").global.sources, { { name = "nvim_lua" } })}

-- print(require("cmp.config").buffers.)
-- print(unpack(require("cmp.config").))
-- yo = require("cmp.utils.misc").concat(require("cmp.config").global.sources, { { name = "nvim_lua" } })
--
-- vim.cmd[[startinsert|]]
-- vim.fn.feedkeys("function")
-- print(require("cmp.config").enabled())
--

_G.toggle_cmp = function()
    local enabled = require("cmp.config").get().enabled
    if type(enabled) == "function" then
        enabled = enabled()
    end
    if enabled then
        require("cmp").setup.buffer({ enabled = false })
    else
        require("cmp").setup.buffer({ enabled = true })
    end
end

-- require("cmp.config").enabled = function()
--   local enabled = require("cmp.confg").get().enabled
--   if type(enabled) == 'function' then
--     enabled = enabled()
--   end
--   return enabled
-- end

-- for key, value in pairs(yo) do
--     print(key, value)
-- end

-- require("cmp").setup.buffer({ sources = { yo } })
