local cmp = require("cmp")
cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
        keyword_length = 3,
    },
    mapping = {
        ["<C-L>"] = cmp.mapping.confirm({
            select = true,
        }),
    },
    sources = cmp.config.sources({
        { name = "copilot", keyword_length = 0 },
        { name = "vsnip", priority = 1000 },
        { name = "nvim_lsp" },
        { name = "path" },
        -- { name = "buffer" ,keyword_length=5},
        { name = "emoji" },
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
    experimental = {
        native_menu = false,
        ghost_text = true,
    },
})

cmp.setup.filetype({ "codev", "liseq", "sh", "zsh" }, {
    sources = require("cmp.utils.misc").concat(
        require("cmp.config").global.sources,
        { { name = "buffer", keyword_length = 5 } }
    ),
})

local redact_sources = function()
    local default_sources = require("cmp.config").global.sources
    for index, _ in ipairs(default_sources) do
        if default_sources[index].name == "copilot" then
            table.remove(default_sources, index)
        end
    end
    return require("cmp.utils.misc").concat(
        default_sources,
        { { name = "tags", keyword_pattern = [[\#\k\+]] }, { name = "cmp_pandoc" } }
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
