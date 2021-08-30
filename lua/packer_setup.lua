-- Only required if you have packer configured as `opt`
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use({ "wbthomason/packer.nvim", opt = true })
		use({ "tpope/vim-vinegar", ft = "netrw" })
		use({
			"~/srv/org-call.nvim",
			cmd = "OrgAgenda",
			ft = "org",
			setup = function()
				vim.api.nvim_set_keymap("n", "<leader>oa", ":OrgAgenda<cr>", { noremap = true, silent = true })
			end,
			config = function()
				require("org-call").setup({
					pre_commands = {
						"(setq org-log-done `time)",
						'(setq org-directory "~/org/")',
						'(setq org-agenda-files `("~/org"))',
						"(setq org-M-RET-may-split-line nil)",
					},
				})
			end,
		})
		use({
			"jbyuki/venn.nvim",
			cmd = "VBox",
		})
		use({
			"~/srv/panotes",
			cmd = "Panotes",
			config = function()
				require("panotes").setup()
			end,
			setup = function()
				require("which-key").register({
					p = {
						name = "panotes",
						j = { ":Panotes openJournal<cr>", "journal" },
						d = { ":Panotes openDiary<cr>znzcGo", "diary" },
						t = { ":Panotes openTagInput<cr>", "open tags" },
						s = { ":Panotes searchTags<cr>", "search tags" },
						i = { ":Panotes export_to_org<cr>", "export to org" },
					},
				}, {
					prefix = "<leader>",
					mode = "n",
				})
			end,
			wants = { "vim-gutentags" },
			requires = {
				{ "nvim-lua/plenary.nvim", module = "plenary" },
				{ "nvim-telescope/telescope.nvim", module = "telescope" },
				{ "ludovicchabant/vim-gutentags", opt = true },
			},
		})

		-- lua

		-- Navigation
		use({ "markonm/traces.vim", keys = { ":", "/", "?" } })
		use({
			"Konfekt/FastFold",
		})
		use({ "romainl/vim-cool" })
		use({
			"ahmedkhalf/project.nvim",
			event = "BufReadPre",
			config = function()
				require("project_nvim").setup({
					ignore_lsp = { "efm", "sumneko_lua" },
					patterns = { ".git", "!Makefile" },
				})
			end,
		})
		use({
			"moll/vim-bbye",
			cmd = { "Bdelete", "Bwipeout" },
			setup = function()
				require("which-key").register({
					d = { "<cmd>Bdelete<cr>", "Delete buffer" },
				}, {
					prefix = "<leader>",
				})
			end,
		})

		use({ "machakann/vim-sandwich", keys = { "sr", "sa", "sd" } })
		use("wellle/targets.vim")
		use({
			"tpope/vim-eunuch",
			cmd = { "Delete", "Move", "Rename", "Chmod", "Mkdir", "SudoWrite", "SudoEdit" },
			event = { "BufNewFile" },
		})

		use({
			"ludovicchabant/vim-gutentags",
			setup = function()
				require("plugin_config/gutentags")
			end,
			ft = require("plugin_config.ft").ctags_ft,
		})

		use({
			"folke/which-key.nvim",
			module = "which-key",
			config = function()
				require("which-key").register({
					-- h = {'<C-\\><C-N><cmd>bp','previous buffer'},
					-- l = {'<C-\\><C-N><cmd>bn <CR>','next buffer'},
					g = {
						name = "plugins",
						d = { "\"dyiw:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>", "macos dictionary" },
						l = { ":lua require'utils'.toggle_build_buffer_window()<cr>", "Toggle BuildTerminal in vsplit" },
					},
					b = {
						name = "builder",
						b = {
							":w|lua require'utils'.send_command_to_build_terminal('builder '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
							"Build in BuildTerminal",
						},
						o = {
							":w|lua require'utils'.send_command_to_build_terminal('opener '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
							"Open in BuildTerminal",
						},
						c = {
							":w|lua require'utils'.send_command_to_build_terminal('cleaner '..vim.fn.fnameescape(vim.fn.expand('%:p')))<cr>",
							"Clean in BuildTerminal",
						},
					},
					m = {
						name = "maker",
						m = {
							":w|lua require'utils'.send_command_to_build_terminal('maker make')<cr>",
							"Make in BuildTerminal",
						},
						o = {
							":w|lua require'utils'.send_command_to_build_terminal('maker open')<cr>",
							"Make Open in BuildTerminal",
						},
						c = {
							":w|lua require'utils'.send_command_to_build_terminal('maker clean')<cr>",
							"Make Clean in BuildTerminal",
						},
					},
				}, {
					prefix = "<leader>",
				})
				require("which-key").register({
					g = {
						name = "plugins",
						d = { "\"dy:lua require'utils'.macdict(vim.fn.getreg('d'))<CR>", "macos dictionary" },
					},
				}, {
					prefix = "<leader>",
					mode = "v",
				})
			end,
		})

		use({ "gioele/vim-autoswap" })

		use({
			"nvim-telescope/telescope.nvim",
			cmd = { "Telescope" },
			module = { "telescope" },
			requires = {
				{ "nvim-lua/popup.nvim", module = "popup" },
				{ "nvim-lua/plenary.nvim", module = "plenary" },
				{ "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
			},
			setup = function()
				function TelescopeTags()
					require("telescope.builtin").tags({ ctags_file = vim.fn.tagfiles()[1] })
				end
				require("which-key").register({
					f = {
						name = "telescope",
						g = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "live grep" },
						f = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "buffers" },
						s = { "<cmd>lua require('telescope.builtin').file_browser()<cr>", "file browser" },
						d = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "find files" },
						l = {
							"<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<cr>",
							"Lsp Workspace Symbols",
						},
						t = {
							"<cmd>lua require('telescope.builtin').builtin()<cr>",
							"Telescope Builtin",
						},
						z = {
							"<cmd>lua require('telescope.builtin').spell_suggest({layout_strategy='cursor', layout_config={height=0.3,width=0.5}})<cr>",
							"spell suggest",
						},
					},
				}, {
					prefix = "<leader>",
				})
			end,
			config = function()
				require("plugin_config/telescope")
			end,
		})
		use({
			"voldikss/vim-floaterm",
			cmd = { "FloatermNew", "FloatermToggle", "FloatermShow" },
			setup = function()
				LazyGitOpener = function()
					if vim.api.nvim_command_output("FloatermShow --name='lazygit' --title='LazyGit'") ~= "" then
						vim.api.nvim_command(
							"FloatermNew --name='lazygit' --title='LazyGit' --width=0.95 --height=0.95 --autoclose=1 lazygit"
						)
					end
				end
				require("which-key").register({
					g = {
						name = "plugins",
						g = { "<cmd>FloatermToggle --autoclose=1 <CR>", "FloaTerm" },
						t = { "<cmd>lua LazyGitOpener()<CR>", "LazyGit" },
					},
				}, {
					prefix = "<leader>",
				})
				vim.g.floaterm_opener = "edit"
			end,
			config = function()
				vim.cmd([[hi FloatermBorder guibg=None]])
			end,
		})

		-- Redaction
		use({ "lervag/vimtex", ft = { "tex" } })
		use({
			"dpelle/vim-Grammalecte",
			cmd = { "GrammalecteCheck", "GrammalecteClear" },
			setup = function()
				vim.cmd([[
                                    xnoremap <leader>gc :GrammalecteCheck <CR>
                                    nnoremap <leader>gc :GrammalecteCheck <CR>
                                    map <leader>gx :GrammalecteClear <CR>
                                ]])
				require("which-key").register({
					g = {
						name = "plugins",
						c = "grammalecte check",
						x = "grammalecte clear",
					},
				}, {
					prefix = "<leader>",
				})
			end,
			config = function()
				require("plugin_config/grammalecte")
			end,
		})
		use({
			"dhruvasagar/vim-table-mode",
			ft = { "markdown", "pandoc", "tex" },
			config = function()
				require("which-key").register({ t = { name = "table mode" } }, { prefix = "<leader>" })
			end,
		})
		use({
			"windwp/nvim-autopairs",
			event = "InsertEnter *",
			config = function()
				require("plugin_config/autopairs")
			end,
		})
		use({ "tpope/vim-commentary", keys = { "gc" } })
		--
		-- Note taking
		use({
			"vim-pandoc/vim-pandoc",
			ft = { "markdown", "pandoc" },
			wants = { "vim-pandoc-syntax", "vim-pandoc-after" },
			requires = { { "vim-pandoc/vim-pandoc-syntax", opt = true }, { "vim-pandoc/vim-pandoc-after", opt = true } },
			setup = function()
				vim.g["pandoc#syntax#conceal#cchar_overrides"] = { atx = "#" }
				vim.g["pandoc#folding#fold_yaml"] = 1
				vim.g["pandoc#filetypes#handled"] = { "pandoc", "markdown" }
				vim.g["pandoc#after#modules#enabled"] = { "fastfold", "tablemode" }
			end,
		})

		use({ "dkarter/bullets.vim", ft = { "markdown", "pandoc", "tex" }, config = function() end })

		use({ "axvr/org.vim", event = "BufEnter" })

		use({
			"hoob3rt/lualine.nvim",
			config = function()
				require("plugin_config/lualine")
			end,
			after = "maintheme",
			wants = { "nvim-web-devicons" },
			requires = {
				{ "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
			},
		})

		-- VSCODE
		use({ "keyring/vsc-lua", ft = { "lua" } })
		use({ "heterophyllus/vscode-codev", ft = { "codev" } })

		-- Programming
		use({ "GuillaumeAllain/vim-codevmacro", branch = "dev", ft = { "codev" } })

		use({ "metakirby5/codi.vim", cmd = { "Codi" } })
		use({ "Vimjas/vim-python-pep8-indent", ft = { "python" } })

		-- -- COMPE
		-- use({
		-- 	"hrsh7th/nvim-compe",
		-- 	event = "InsertEnter *",
		-- 	wants = "compe-latex-symbols",
		-- 	requires = {
		-- 		{ "GoldsteinE/compe-latex-symbols", opt = true },
		-- 		{
		-- 			"hrsh7th/vim-vsnip",
		-- 			event = "InsertEnter *",
		-- 			config = function()
		-- 				vim.g.vsnip_snippet_dir = vim.fn.expand(os.getenv("XDG_CONFIG_HOME") .. "/vsnip")
		-- 				vim.api.nvim_exec(
		-- 					[[
		-- autocmd FileType * call vsnip#get_complete_items(bufnr())
		-- ]],
		-- 					false
		-- 				)
		-- 				vim.cmd([[
		-- imap <expr> <C-l> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
		-- smap <expr> <C-l> vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
		-- imap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
		-- smap <expr> <C-h> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<C-h>'
		-- ]])
		-- 			end,
		-- 			wants = { "friendly-snippets" },
		-- 			requires = { { "rafamadriz/friendly-snippets", opt = true } },
		-- 		},
		-- 	},
		-- 	config = function()
		-- 		require("plugin_config/compe")
		-- 		vim.cmd([[
		-- inoremap <silent><expr> <C-l> compe#complete()
		-- inoremap <silent><expr> <C-l> compe#confirm('<C-l>')
		-- ]])
		-- 	end,
		-- })
		-- COMPE
		use({
			"hrsh7th/vim-vsnip",
			event = "InsertEnter *",
			config = function()
				vim.g.vsnip_snippet_dir = vim.fn.expand(os.getenv("XDG_CONFIG_HOME") .. "/vsnip")
				vim.api.nvim_exec(
					[[
                        autocmd FileType * call vsnip#get_complete_items(bufnr())
                        ]],
					false
				)
				vim.cmd([[
                        imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
                        smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
                        ]])
			end,
			wants = { "friendly-snippets" },
			requires = { { "rafamadriz/friendly-snippets", opt = true } },
		})
		use({
			"hrsh7th/nvim-cmp",
			opt = true,
			after = "vim-vsnip",
			requires = {

				{
					"hrsh7th/cmp-nvim-lsp",
					module = "cmp_nvim_lsp",
				},
				{
					"hrsh7th/cmp-path",
					module = "cmp_path",
				},
				{
					"hrsh7th/cmp-nvim-lua",
					module = "cmp_nvim_lua",
				},
				{
					"hrsh7th/cmp-vsnip",
					module = "cmp_vsnip",
				},
				{
					"kdheepak/cmp-latex-symbols",
					module = "cmp_latex_symbols",
				},
				{
					"quangnguyen30192/cmp-nvim-tags",
					module = "cmp_nvim_tags",
				},
				{
					"hrsh7th/cmp-buffer",
					module = "cmp_buffer",
				},
				{
					"hrsh7th/cmp-emoji",
					module = "cmp_emoji",
				},
			},
			config = function()
				require("plugin_config/cmp")
			end,
		})

		-- use {'shaunsingh/nord.nvim',
		-- setup=function()
		--     vim.g.nord_contrast = false
		--     vim.g.nord_borders = true
		-- end,
		--  config=function()
		--      -- vim.cmd[[colorscheme nord]]
		--      require('nord').set()
		--      require('nord.theme').loadTerminal()
		--      require'plugin_config/theme'
		--  end,
		--  run=function()
		--    require'utils'.export_theme_to_kitty()
		--  end;
		--  as='maintheme'
		-- }

		use({
			"rose-pine/neovim",
			setup = function()
				vim.g.rose_pine_variant = "moon"
			end,
			config = function()
				require("rose-pine").set()
				require("rose-pine.theme").load_terminal()
				require("plugin_config/theme")
			end,
			run = function()
				require("utils").export_theme_to_kitty()
			end,
			as = "maintheme",
		})

		use({
			"folke/zen-mode.nvim",
			cmd = { "ZenMode" },
			setup = function()
				-- vim.cmd[[silent! map <leader>gy :ZenMode <CR>]]
				require("which-key").register({
					g = {
						name = "plugins",
						y = { ":ZenMode <CR>", "Zen-mode" },
					},
				}, {
					prefix = "<leader>",
				})
			end,
			config = function()
				require("zen-mode").setup({
					window = {
						backdrop = 1,
						width = 90,
						height = 0.8,
						options = {
							number = false,
							relativenumber = false,
						},
					},
				})
			end,
			wants = "packer.nvim",
		})

		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		})
		-- TODO

		use({
			"onsails/lspkind-nvim",
			ft = require("plugin_config.ft").lsp_ft,
			config = function()
				require("lspkind").init()
			end,
		})

		use({ "folke/lsp-colors.nvim", ft = require("plugin_config.ft").lsp_ft })

		use({
			"folke/trouble.nvim",
			cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
			requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
			config = function()
				require("trouble").setup({})
			end,
			setup = function()
				require("which-key").register({
					g = {
						name = "plugins",
						h = { ":TroubleToggle <CR>", "TroubleToggle" },
					},
				}, {
					prefix = "<leader>",
				})
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			ft = require("plugin_config.ft").treesitter_ft,
			run = ":TSUpdate",
			wants = { "nvim-treesitter-refactor", "nvim-treesitter-context" },
			requires = {
				{ "nvim-treesitter/nvim-treesitter-refactor", opt = true },
				{ "romgrk/nvim-treesitter-context", opt = true },
			},
			config = function()
				require("plugin_config/treesitter").setup(require("plugin_config.ft").treesitter_ft)
			end,
		})

		use({
			"neovim/nvim-lspconfig",
			ft = require("plugin_config.ft").lsp_ft,
			setup = function()
				vim.cmd([[
                                    nmap <leader>lr <cmd>lua vim.lsp.buf.rename()<cr>
                                ]])
			end,
			config = function()
				require("plugin_config/lspconfig")
			end,
			run = function()
				vim.fn.system(
					"julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add(\"LanguageServer\")'"
				)
				vim.fn.system(
					"pip install --upgrade fortran-language-server jedi-language-server flake8 black fprettify"
				)
				vim.fn.system("brew install stylua")
			end,
			requires = {
				{ "jose-elias-alvarez/null-ls.nvim", module = "null-ls" },
			},
		})
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
		compile_path = require("packer.util").join_paths(
			vim.fn.stdpath("data"),
			"site",
			"plugin",
			"packer_compiled.vim"
		),
	},
})
