-- local function insert_filename(prompt_bufnr)
--     local filename = require("telescope.actions").get_selected_entry().value
--     require("telescope.actions").close(prompt_bufnr)
--     vim.api.nvim_put({ filename }, "", true, true)
-- end
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
        file_ignore_patterns = {".*.hdf5"},
        -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "shorten" },
        -- color_devicons = true,
        -- use_less = true,
        layout_config = {
         horizontal = {
            prompt_position = "bottom",
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
                        ["<C-e>"] = fb_actions.create
                    },
                    n = {
                        e = fb_actions.create
                    },
                },
            },
            bibtex = {
                depth=2
            }
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
                            vim.cmd("call timer_start(0, { tid -> execute(':e')})")
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
                            vim.cmd("call timer_start(0, { tid -> execute(':e')})")
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
                            vim.cmd("call timer_start(0, { tid -> execute(':e|normal zO')})")
                        end
                    end,
                })
                return true
            end,
        },
    },
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("projects")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("bibtex")
require('telescope').load_extension('heading')
