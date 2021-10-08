local cmp = require("cmp")
cmp.setup({
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = {
        ["<C-L>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),
    },
    sources = {
        { name = "vsnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
        { name = "emoji" },
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
        au Filetype pandoc,markdown lua require'cmp'.setup.buffer{sources=require("cmp.utils.misc").concat(require("cmp.config").global.sources, { {name='tags'}})}
        au Filetype lua lua require'cmp'.setup.buffer{sources=require("cmp.utils.misc").concat(require("cmp.config").global.sources, { { name = "nvim_lua" } })}
        au FileType TelescopePrompt,vim lua require('cmp').setup.buffer { enabled = false }
    augroup END

]])


-- print(require("cmp.config").buffers.)
-- print(unpack(require("cmp.config").))
-- yo = require("cmp.utils.misc").concat(require("cmp.config").global.sources, { { name = "nvim_lua" } })
--
-- vim.cmd[[startinsert|]]
-- vim.fn.feedkeys("function")
-- print(require("cmp.config").enabled())

_G.toggle_cmp = function()
  local enabled = require'cmp.config'.get().enabled
  if type(enabled) == 'function' then
    enabled = enabled()
  end
  if enabled then
      require'cmp'.setup.buffer{enabled=false}
  else
      require'cmp'.setup.buffer{enabled=true}
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
