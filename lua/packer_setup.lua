vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])
return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use({ "wbthomason/packer.nvim", opt = true })
        use({ "tpope/vim-commentary", keys = { "gc" } })
        use({
            "folke/which-key.nvim",
            config = function()
                require("plugin_config/whichkey")
            end,
        })
        use({
            "jbyuki/venn.nvim",
            cmd = "VBox",
        })
        use({ "markonm/traces.vim", keys = { ":", "/", "?" } })
        use({
            "Konfekt/FastFold",
        })
        use({ "romainl/vim-cool" })
        use({ "machakann/vim-sandwich", keys = { "sr", "sa", "sd" } })
        use("wellle/targets.vim")
        use({
            "ahmedkhalf/project.nvim",
            event = "BufReadPre",
            config = function()
                require("project_nvim").setup({
                    ignore_lsp = { "efm", "sumneko_lua" },
                    patterns = { ".git", "!Makefile", ".notes" },
                    datapath = vim.fn.stdpath("cache"),
                })
            end,
        })
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
        use({ "lervag/vimtex", ft = { "tex" } })
        use({
            "windwp/nvim-autopairs",
            event = "InsertEnter *",
            config = function()
                require("plugin_config/autopairs")
            end,
        })
        use({
            "vim-pandoc/vim-pandoc",
            ft = { "markdown", "pandoc" },
            wants = { "vim-pandoc-syntax", "vim-pandoc-after" },
            requires = { { "vim-pandoc/vim-pandoc-syntax", opt = true }, { "vim-pandoc/vim-pandoc-after", opt = true } },
            config = function()
                vim.g["pandoc#syntax#conceal#cchar_overrides"] = { atx = "#" }
                vim.g["pandoc#folding#fold_yaml"] = 1
                vim.g["pandoc#filetypes#handled"] = { "pandoc", "markdown" }
                vim.g["pandoc#after#modules#enabled"] = { "tablemode" }
            end,
        })
        use({ "dkarter/bullets.vim", ft = { "markdown", "pandoc", "tex" }, config = function() end })

        use({ "gioele/vim-autoswap" })

        -- -- use {'shaunsingh/nord.nvim',
        -- -- setup=function()
        -- --     vim.g.nord_contrast = false
        -- --     vim.g.nord_borders = true
        -- -- end,
        -- --  config=function()
        -- --      -- vim.cmd[[colorscheme nord]]
        -- --      require('nord').set()
        -- --      require('nord.theme').loadTerminal()
        -- --      require'plugin_config/theme'
        -- --  end,
        -- --  run=function()
        -- --    require'utils'.export_theme_to_kitty()
        -- --  end;
        -- --  as='maintheme'
        -- -- }

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
        use({
            "~/srv/panotes",
            cmd = "Panotes",
            module = "panotes",
            config = function()
                require("panotes").setup()
            end,
            wants = { "vim-gutentags" },
            requires = {
                { "nvim-lua/plenary.nvim", module = "plenary" },
                { "nvim-telescope/telescope.nvim", module = "telescope" },
                { "ludovicchabant/vim-gutentags", opt = true },
            },
        })

        use({
            "moll/vim-bbye",
            cmd = { "Bdelete", "Bwipeout" },
        })

        use({
            "nvim-telescope/telescope.nvim",
            cmd = { "Telescope" },
            module = { "telescope" },
            requires = {
                { "nvim-lua/popup.nvim", module = "popup" },
                { "nvim-lua/plenary.nvim", module = "plenary" },
                { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    run = "make",
                    opt = true,
                    module_pattern = "telescope._extensions.fzf*",
                },
            },
            wants = { "project.nvim" },
            setup = function()
                function TelescopeTags()
                    require("telescope.builtin").tags({ ctags_file = vim.fn.tagfiles()[1] })
                end
            end,
            config = function()
                require("telescope").load_extension("fzf")
                require("telescope").load_extension("projects")
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
                vim.g.floaterm_opener = "edit"
            end,
            config = function()
                vim.cmd([[hi FloatermBorder guibg=None]])
            end,
        })

        -- Redaction
        use({
            "dhruvasagar/vim-table-mode",
            ft = { "markdown", "pandoc", "tex" },
            config = function()
                require("which-key").register({ t = { name = "table mode" } }, { prefix = "<leader>" })
            end,
        })

        -- VSCODE
        use({ "heterophyllus/vscode-codev", ft = { "codev" } })

        -- Programming
        use({ "GuillaumeAllain/vim-codevmacro", branch = "dev", ft = { "codev" } })

        -- use({ "metakirby5/codi.vim", cmd = { "Codi" } })
        -- use({ "Vimjas/vim-python-pep8-indent", ft = { "python" } })

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
            wants = "vim-vsnip",
            module = "cmp",
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
                    ft = { "pandoc", "markdown" },
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
        use({
            "abecodes/tabout.nvim",
            after = "nvim-cmp",
            wants = "nvim-treesitter",
            config = function()
                require("tabout").setup({
                    tabkey = "<c-l>",
                    act_as_tab = false,
                    act_as_shit_tab = false,
                    enable_backwards = false,
                    completion = true,
                })
            end,
        })

        use({
            "folke/zen-mode.nvim",
            cmd = { "ZenMode" },
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
            requires = { "nvim-lua/plenary.nvim", module = "plenary" },
            config = function()
                require("todo-comments").setup({})
            end,
        })

        use({
            "onsails/lspkind-nvim",
            after = "nvim-lspconfig",
            module = "lspkind",
            config = function()
                require("lspkind").init()
            end,
        })

        use({ "folke/lsp-colors.nvim", after = "nvim-lspconfig" })

        use({
            "folke/trouble.nvim",
            cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
            config = function()
                require("trouble").setup({})
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            event = "BufRead",
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
            module = "lspconfig",
            module_pattern = "lspconfig/*",
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
                {
                    "brymer-meneses/grammar-guard.nvim",
                    module = "grammar-guard",
                    run = function()
                        vim.cmd([[GrammarInstall]])
                    end,
                },
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
