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
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "latex_symbols" },
		{ name = "nvim_tags" },
		{ name = "buffer" },
		{ name = "emoji" },
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
})
