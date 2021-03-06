vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")
-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use({
            "wbthomason/packer.nvim",
            cmd = { "PackerInstall", "PackerUpdate", "PackerSync", "PackerClean", "PackerCompile", "PackerProfile" },
            config = function()
                require("packer_setup")
            end,
            opt = true,
        })
        use("lewis6991/impatient.nvim")
        use({
            "rafcamlet/nvim-luapad",
            module = "luapad",
            module_pattern = "luapad.*",
            cmd = { "Luapad", "Luarun" },
        })
        use({
            "github/copilot.vim",
            opt = true,
            cmd = { "Copilot" },
        })
        use({
            "zbirenbaum/copilot.lua",
            event = { "VimEnter" },
            module = "copilot",
            config = function()
                vim.defer_fn(function()
                    require("copilot").setup({ ft_disable = { "pandoc", "markdown" } })
                end, 100)
            end,
        })
        use({
            "anuvyklack/pretty-fold.nvim",
            event = { "BufNewFile", "BufRead" },
            config = function()
                require("pretty-fold").setup({ default_keybindings = false })
                -- require("pretty-fold.preview").setup()
            end,
        })

        use({
            "numToStr/Comment.nvim",
            event = { "BufNewFile", "BufRead" },
            config = function()
                require("plugin_config/comment")
            end,
        })

        use({
            "luukvbaal/stabilize.nvim",
            config = function()
                require("stabilize").setup()
            end,
        })
        use({
            "PyGamer0/vim-apl",
            ft = "apl",
        })
        use({
            "folke/which-key.nvim",
            config = function()
                require("plugin_config/whichkey")
                require("which-key").setup({
                    triggers_blacklist = {
                        n = { "s" },
                        v = { "g" },
                    },
                    plugins = {
                        presets = {
                            operators = false,
                            windows = false,
                        },
                    },
                })
            end,
        })
        use({ "markonm/traces.vim", keys = { ":", "/", "?" } })
        use({ "romainl/vim-cool" })
        use({
            "machakann/vim-sandwich",
            keys = { "sr", "sa", "sd" },
            config = function()
                require("plugin_config/sandwich")
            end,
        })
        use("wellle/targets.vim")
        use({
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup({
                    detection_methods = { "pattern" },
                    patterns = { ".git", ".notes" },
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
            config = function()
                require("plugin_config/gutentags")
            end,
            ft = require("plugin_config.ft").ctags_ft,
        })
        -- use({ "lervag/vimtex", ft = { "tex" } })
        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            event = "InsertEnter *",
            config = function()
                require("plugin_config/autopairs")
            end,
        })
        use({
            "vim-pandoc/vim-pandoc-syntax",
            ft = { "pandoc" },
            config = function()
                vim.g["pandoc#syntax#conceal#cchar_overrides"] = { atx = "#" }
                vim.g["pandoc#modules#disabled"] = { "folding" }
                vim.g["pandoc#filetypes#handled"] = { "pandoc", "markdown" }
                vim.g["pandoc#syntax#style#use_definition_lists"] = 0
            end,
        })

        use({ "dkarter/bullets.vim", ft = { "markdown", "pandoc", "tex" }, config = function() end })

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
            config = function()
                require("plugin_config/theme").config()
            end,
            as = "maintheme",
        })
        use({ "f-person/auto-dark-mode.nvim" })

        -- use({
        --     "EdenEast/nightfox.nvim",
        --     config = function()
        --         vim.cmd("colorscheme dawnfox")
        --         require("plugin_config/theme")
        --     end,
        --     as = "maintheme",
        -- })
        -- use({
        --     'mvllow/modes.nvim',
        --     config = function()
        --         vim.opt.cursorline = true
        --         require('modes').setup()
        --     end
        -- })
        use({
            "nvim-lualine/lualine.nvim",
            config = function()
                require("plugin_config/lualine").config()
            end,
            after = "maintheme",
            as = "statusline",
            wants = { "nvim-web-devicons" },
            requires = {
                { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
            },
        })
        use({
            -- "GuillaumeAllain/panotes",
            "~/srv/panotes",
            cmd = { "Panotes" },
            module = { "panotes" },
            keys = { "<leader>p" },
            config = function()
                require("panotes").setup()
            end,
            requires = {
                { "nvim-lua/plenary.nvim", module = "plenary" },
                { "nvim-telescope/telescope.nvim", module = "telescope" },
            },
        })
        use({
            "rcarriga/neotest",
            module = "neotest",
            cmd = "neotest",
            config = function()
                require("plugin_config/neotest")
            end,
            requires = {
                { "nvim-lua/plenary.nvim", module = "plenary" },
                {
                    "nvim-treesitter/nvim-treesitter",
                    module = { "nvim-treesitter" },
                },
                "antoinemadec/FixCursorHold.nvim",
                { "rcarriga/neotest-python", module = "neotest-python" },
            },
        })

        use({
            "moll/vim-bbye",
            cmd = { "Bdelete", "Bwipeout" },
        })

        use({
            "echasnovski/mini.nvim",
            event = { "BufNewFile", "BufRead" },
            config = function()
                require("mini.indentscope").setup()
                vim.cmd([[autocmd TermOpen * lua vim.b.miniindentscope_disable = true]])
            end,
        })
        use({
            "lewis6991/gitsigns.nvim",
            event = { "BufReadPost", "FileReadPost" },
            requires = {
                "nvim-lua/plenary.nvim",
                module = "plenary",
            },
            config = function()
                require("gitsigns").setup()
            end,
            -- tag = 'release' -- To use the latest release
        })

        use({
            "nvim-telescope/telescope.nvim",
            cmd = { "Telescope" },
            module = { "telescope" },
            tag = "0.1.0",
            requires = {
                { "nvim-lua/popup.nvim", module = "popup" },
                { "nvim-lua/plenary.nvim", module = "plenary" },
                {
                    "nvim-telescope/telescope-file-browser.nvim",
                    opt = true,
                    module_pattern = "telescope._extensions.file_browser*",
                },
                {
                    "crispgm/telescope-heading.nvim",
                    opt = true,
                    module_pattern = "telescope._extensions.heading*",
                },
                {
                    "nvim-telescope/telescope-bibtex.nvim",
                    opt = true,
                    module_pattern = "telescope._extensions.bibtex*",
                },
                {
                    "zane-/howdoi.nvim",
                    opt = true,
                    module_pattern = "telescope._extensions.howdoi*",
                    run = function()
                        vim.fn.system("pip install howdoi")
                    end,
                },
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
            requires = { { "rafamadriz/friendly-snippets", after = "vim-vsnip" } },
        })
        use({
            "jbyuki/nabla.nvim",
            module = "nabla",
        })
        use({
            "zbirenbaum/copilot-cmp",
            module = "copilot_cmp",
            after = { "copilot.lua", "nvim-cmp" },
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
                    "hrsh7th/cmp-cmdline",
                    module = "cmp_cmdline",
                },
                {
                    "GuillaumeAllain/cmp-pandoc.nvim",
                    module = "cmp-pandoc",
                    config = function()
                        require("cmp_pandoc").setup()
                    end,
                },
                {
                    "hrsh7th/cmp-vsnip",
                    module = "cmp_vsnip",
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
                {
                    "hrsh7th/cmp-nvim-lsp-signature-help",
                    module = "cmp_nvim_lsp_signature_help",
                },
            },
            config = function()
                require("plugin_config/cmp")
            end,
        })
        use({
            "abecodes/tabout.nvim",
            after = { "nvim-cmp", "vim-vsnip" },
            wants = "nvim-treesitter",
            requires = {
                {
                    "nvim-treesitter/nvim-treesitter",
                    module = { "nvim-treesitter" },
                },
            },

            config = function()
                require("tabout").setup({
                    tabkey = "",
                    act_as_tab = false,
                    act_as_shit_tab = false,
                    enable_backwards = false,
                    completion = true,
                    exclude = { "pandoc" },
                    tabouts = {
                        { open = "'", close = "'" },
                        { open = '"', close = '"' },
                        { open = "`", close = "`" },
                        { open = "(", close = ")" },
                        { open = "[", close = "]" },
                        { open = "{", close = "}" },
                        { open = "$", close = "$" },
                    },
                })
                function _G.tabout_binding()
                    if vim.fn.pumvisible() ~= 0 then
                        return vim.api.nvim_replace_termcodes("<C-l>", true, true, true)
                    elseif vim.fn["vsnip#available"](1) ~= 0 then
                        return vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true)
                    else
                        return vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true)
                    end
                end
                vim.api.nvim_set_keymap("i", "<C-L>", "v:lua.tabout_binding()", { expr = true })
            end,
        })

        use({
            "folke/zen-mode.nvim",
            cmd = { "ZenMode" },
            config = function()
                require("zen-mode").setup({
                    window = {
                        backdrop = 1,
                        width = 88,
                        height = 0.9,
                        options = {
                            number = false,
                            relativenumber = false,
                        },
                    },
                    plugins = {
                        gitsigns = { enabled = true },
                    },
                })
            end,
            wants = "packer.nvim",
        })

        use({
            "robertgzr/todo-comments.nvim",
            event = { "BufNewFile", "BufRead" },
            -- cmd = { "TodoTrouble" },
            requires = { "nvim-lua/plenary.nvim", module = "plenary" },
            config = function()
                require("todo-comments").setup({
                    highlight = {
                        comments_only = false,
                    },
                    keywords = {
                        FIX = {
                            icon = "??? ", -- icon used for the sign, and in search results
                            color = vim.g["terminal_color_2"], -- can be a hex color, or a named color (see below)
                            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
                            -- signs = false, -- configure signs for some keywords individually
                        },
                        TODO = { icon = "??? ", color = vim.g["terminal_color_6"], alt = { "?? faire" } },
                        HACK = { icon = "??? ", color = vim.g["terminal_color_2"] },
                        WARN = { icon = "??? ", color = vim.g["terminal_color_3"], alt = { "WARNING", "XXX" } },
                        PERF = {
                            icon = "??? ",
                            color = vim.g["terminal_color_3"],
                            alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" },
                        },
                        NOTE = { icon = "??? ", color = vim.g["terminal_color_5"], alt = { "NOTE" } },
                        -- DONE = { icon = "??? ", color = vim.g["terminal_color_5"], alt = { "DONE" } },
                    },
                })
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
        use({
            "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
            after = "nvim-lspconfig",
            config = function()
                require("lsp_lines").setup()
            end,
        })

        use({ "folke/lsp-colors.nvim", after = "nvim-lspconfig" })

        use({
            "folke/trouble.nvim",
            cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
            module = "trouble",
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
            config = function()
                require("trouble").setup({})
            end,
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            event = { "BufNewFile", "BufRead" },
            module = { "nvim-treesitter" },
            run = ":TSUpdate",
            wants = { "nvim-treesitter-context" },
            requires = { { "romgrk/nvim-treesitter-context", opt = true } },
            config = function()
                require("plugin_config/treesitter").setup(require("plugin_config.ft").treesitter_ft)
            end,
        })

        -- use({
        --     "nvim-treesitter/nvim-treesitter-context",
        --     after = { "nvim-treesitter" },
        --     opt = true,
        -- })
        -- use({
        --     "nvim-treesitter/nvim-treesitter-refactor",
        --     after = { "nvim-treesitter" },
        --     opt = true,
        -- })

        use({
            "jose-elias-alvarez/null-ls.nvim",
            ft = require("plugin_config.ft").lsp_ft,
            config = function()
                require("plugin_config/nullls")
            end,
            requires = {
                { "nvim-lua/plenary.nvim", module = "plenary" },
            },
        })

        use({
            "neovim/nvim-lspconfig",
            ft = require("plugin_config.ft").lsp_ft,
            module = "lspconfig",
            module_pattern = "lspconfig/*",
            commit = "21102d5e3b6ffc6929d60418581ac1a29ee9eddd",
            config = function()
                require("plugin_config/lspconfig")
                require("which-key").register({
                    l = {
                        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Lsp Rename" },
                        f = { "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "Lsp Formatting" },
                    },
                }, {
                    prefix = "<leader>",
                })
            end,
            run = function()
                vim.fn.system(
                    "julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add(\"LanguageServer\")'"
                )
                vim.fn.system(
                    "pip install --upgrade fortran-language-server jedi-language-server flake8 black fprettify"
                )
                vim.fn.system("brew install stylua")

                vim.fn.system("brew install haskell-language-server")
            end,

            requires = {
                {
                    "williamboman/nvim-lsp-installer",
                    opt = true,
                    module = "nvim-lsp-installer",
                    cmd = { "LspInstall" },
                },
                {
                    "https://gitlab.com/yorickpeterse/nvim-dd.git",
                    after = "nvim-lspconfig",
                    config = function()
                        require("dd").setup({ timeout = 250 })
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
