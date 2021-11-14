local function insert_filename(prompt_bufnr)
    local filename = require("telescope.actions").get_selected_entry().value
    require("telescope.actions").close(prompt_bufnr)
    vim.api.nvim_put({ filename }, "", true, true)
end

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
        file_ignore_patterns = {},
        -- generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "shorten" },
        -- color_devicons = true,
        -- use_less = true,
        extensions = {
            fzf = {
                fuzzy = true, -- false will only do exact matching
                override_generic_sorter = false, -- override the generic sorter
                override_file_sorter = true, -- override the file sorter
                case_mode = "smart_case", -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            },
        },
        -- theme = require("telescope.themes").get_dropdown({}),
        mappings = {
            i = {
                ["<C-s>"] = require("telescope.actions").select_horizontal,
                ["<C-y>"] = function(prompt_bfnr)
                    local selection = require("telescope.actions.state").get_selected_entry().value
                    require("telescope.actions").close(prompt_bfnr)
                    vim.fn.setreg('*', selection)
                end
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
