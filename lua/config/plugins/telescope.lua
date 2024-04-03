return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        {
            "nvim-lua/popup.nvim",
        },
        {
            "folke/todo-comments.nvim",
        },
        {
            "rcarriga/nvim-notify",
        },

        {
            "nvim-lua/plenary.nvim",
        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        {
            "crispgm/telescope-heading.nvim",
        },
        {
            "nvim-telescope/telescope-bibtex.nvim",
        },
        {
            "zane-/howdoi.nvim",
        },
        { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" },
    },
    init = function()
        function TelescopeTags()
            require("telescope.builtin").tags({ ctags_file = vim.fn.tagfiles()[1] })
        end
    end,
    config = function()
        local fb_actions = require("telescope").extensions.file_browser.actions
        require("telescope").setup({
            defaults = {
                -- vimgrep_arguments = {
                --     "rg",
                --     "--color=never",
                --     "--no-heading",
                --     "--with-filename",
                --     "--line-number",
                --     "--column",
                --     "--smart-case",
                -- },
                -- file_sorter = require("telescope.sorters").get_fuzzy_file,
                file_ignore_patterns = { ".*.hdf5", ".*.h5" },
                -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                path_display = { "shorten" },
                winblend = 0,
                -- color_devicons = true,
                -- use_less = true,
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                        results_width = 0.8,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.87,
                    height = 0.80,
                    preview_cutoff = 120,
                },
                border = {},
                -- theme = require("telescope.themes").get_dropdown({}),
                set_env = { ["COLORTERM"] = "truecolor" },
                mappings = {
                    i = {
                        ["<C-s>"] = require("telescope.actions").select_horizontal,
                        ["<C-space>"] = require("telescope.actions").to_fuzzy_refine,
                        ["<C-y>"] = function(prompt_bfnr)
                            local selection = require("telescope.actions.state").get_selected_entry().value
                            require("telescope.actions").close(prompt_bfnr)
                            vim.fn.setreg("*", selection)
                        end,
                    },
                },
            },
            extensions = {
                -- fzf = {
                --     fuzzy = true, -- false will only do exact matching
                --     override_generic_sorter = false, -- override the generic sorter
                --     override_file_sorter = true, -- override the file sorter
                --     case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                --     -- the default case_mode is "smart_case"
                -- },
                file_browser = {
                    mappings = {
                        i = {
                            ["<C-e>"] = fb_actions.create,
                        },
                        n = {
                            e = fb_actions.create,
                        },
                    },
                },
                bibtex = {
                    depth = 2,
                    search_keys = { "title", "author", "year" },
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({
                        -- even more opts
                    }),

                    -- pseudo code / specification for writing custom displays, like the one
                    -- or "codeactions"
                    -- specific_opts = {
                    --   [kind] = {
                    --     make_indexed = function(items) -> indexed_items, width,
                    --     make_displayer = function(widths) -> displayer
                    --     make_display = function(displayer) -> function(e)
                    --     make_ordinal = function(e) -> string
                    --   },
                    --   -- for example to disable the custom builtin "codeactions" display
                    --      do the following
                    --   codeactions = false,
                    -- }
                },
                todo = {
                    mappings = {
                        i = {
                            ["C-n"] = require("telescope.actions").move_selection_next,
                            ["C-p"] = require("telescope.actions").move_selection_previous,
                        },
                        n = {
                            ["C-n"] = require("telescope.actions").move_selection_next,
                            ["C-p"] = require("telescope.actions").move_selection_previous,
                        },
                    },
                },
            },
            pickers = {
                buffers = {
                    layout_strategy = "vertical",
                    mappings = {
                        i = {
                            ["<c-d>"] = require("telescope.actions").delete_buffer,
                        },
                        n = {
                            ["<c-d>"] = require("telescope.actions").delete_buffer,
                        },
                    },
                },
                find_files = {
                    attach_mappings = function(prompt_bufnr)
                        require("telescope.actions.set").select:enhance({
                            post = function()
                                if vim.api.nvim_buf_get_name(0) ~= "" then
                                    vim.cmd.call("timer_start(0, { tid -> execute(':e|normal zN')})")
                                end
                            end,
                        })
                        return true
                    end,
                },
                file_browser = {
                    attach_mappings = function(prompt_bufnr)
                        require("telescope.actions.set").select:enhance({
                            post = function()
                                if vim.api.nvim_buf_get_name(0) ~= "" then
                                    vim.cmd.call("timer_start(0, { tid -> execute(':e|normal zN')})")
                                end
                            end,
                        })
                        return true
                    end,
                },
                live_grep = {
                    attach_mappings = function(prompt_bufnr)
                        require("telescope.actions.set").select:enhance({
                            post = function()
                                if vim.api.nvim_buf_get_name(0) ~= "" then
                                    vim.cmd.call("timer_start(0, { tid -> execute(':e|normal zN')})")
                                end
                            end,
                        })
                        return true
                    end,
                },
            },
        })
        require("telescope").load_extension("projects")
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("bibtex")
        require("telescope").load_extension("heading")
        require("telescope").load_extension("howdoi")
        require("telescope").load_extension("ui-select")
        require("telescope").load_extension("notify")
        require("telescope").load_extension("todo-comments")
    end,
}
