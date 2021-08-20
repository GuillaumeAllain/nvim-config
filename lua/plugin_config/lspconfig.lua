local on_attach = function(client, bufnr)
	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,5000)")
	end
	vim.schedule(function()
		require("lsp_signature").on_attach({
			bind = true, -- This is mandatory, otherwise border config won't get registered.
			hint_prefix = "",
			handler_opts = {
				border = "single",
			},
		})
	end)
	-- require("lsp_signature").on_attach({
	-- 	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- 	handler_opts = {
	-- 		border = "single",
	-- 	},
	-- }, bufnr)
end

require("lspconfig").jedi_language_server.setup({
	on_attach = on_attach,
	init_options = {
		hover = {
			enable = true,
		},
	},
	root_dir = function(fname)
		return require("lspconfig").util.find_git_ancestor(fname) or vim.loop.os_homedir()
	end,
})

require("null-ls").config({
	sources = {
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.diagnostics.flake8.with({
			extra_args = { "--ignore=E203,W503", "--max-complexity=10", "--max-line-length=127" },
		}),
		{
			method = require("null-ls").methods.FORMATTING,
			filetypes = { "pandoc" },
			name = "pandotlint",
			generator = require("null-ls.helpers").formatter_factory({
				command = "pandotlint",
				format = "raw",
				to_stdin = true,
			}),
		},
		{
			method = require("null-ls").methods.FORMATTING,
			filetypes = { "yaml" },
			name = "yamllint",
			generator = require("null-ls.helpers").formatter_factory({
				command = "yamllint",
				args = { "-f", "parsasble", "-" },
				format = "raw",
				to_stdin = true,
			}),
		},
		require("null-ls").builtins.formatting.stylua,
	},
})

require("lspconfig")["null-ls"].setup({
	on_attach = on_attach,
})

require("lspconfig").fortls.setup({
	on_attach = on_attach,
	cmd = {
		"fortls",
		"--nthreads",
		"2",
		"--use_signature_help",
		"--hover_signature",
	},
})

local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = os.getenv("HOME") .. "/srv/lua-language-server"

local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

require("lspconfig").sumneko_lua.setup({
	on_attach = on_attach,
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "pandoc" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
		},
	},
})

local function find_toml(startpath)
	return require("lspconfig").util.search_ancestors(startpath, function(path)
		if require("lspconfig").util.path.is_file(require("lspconfig").util.path.join(path, "Project.toml")) then
			return path
		end
	end)
end

require("lspconfig").julials.setup({
	on_attach = on_attach,
	root_dir = function(fname)
		return find_toml(fname) or vim.fn.getcwd()
	end,
})
