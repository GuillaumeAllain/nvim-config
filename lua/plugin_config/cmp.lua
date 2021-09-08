local cmp = require("cmp")
cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = {
        ["<C-l>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },
    sources = {
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp" },
        { name = "emoji" },
        { name = "orgmode" },
    },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                vsnip = "[VSnip]",
                nvim_lua = "[nvim]",
                path = "[Path]",
                latex_symbols = "[Latex]",
                tags = "[Tags]",
                emoji = "[Emoji]",
            })[entry.source.name]
            return vim_item
        end,
    },
})
vim.cmd([[
    augroup nvim-cmp-sources
        au!
        au Filetype pandoc,markdown lua require'cmp'.setup.buffer{sources=require("cmp.utils.misc").concat(require("cmp.config").global.sources, { {name='tags'},{name='latex_symbols'}})}
        au Filetype lua lua require'cmp'.setup.buffer{sources=require("cmp.utils.misc").concat(require("cmp.config").global.sources, { { name = "nvim_lua" } })}
    augroup END
]])

-- print(require("cmp.config").buffers.)
-- print(unpack(require("cmp.config").))
-- yo = require("cmp.utils.misc").concat(require("cmp.config").global.sources, { { name = "nvim_lua" } })
-- yo = require("cmp.config").buffers[1].sources[1][1]
-- for key, value in pairs(yo) do
--     print(key, value)
-- end

-- require("cmp").setup.buffer({ sources = { yo } })
