local actions = require'telescope.actions'-- Built-in actions

local reedit_open = function(prompt_bufnr)
    require'telescope.actions.set'.select:enhance({
        post = function()
            vim.cmd(":e")
        end
    })
    print("salut")
    return true
end

require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        file_sorter =  require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
        path_display = {"shorten"},
        color_devicons = true,
        use_less = true,
        set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        theme = require'telescope.themes'.get_dropdown({}),
    },
    pickers={
        buffers={
            layout_strategy='vertical'
        },
        find_files = {
            attach_mappings= function(prompt_bufnr)
                require'telescope.actions.set'.select:enhance({
                    post = function()
                        if vim.api.nvim_buf_get_name(0)~='' then
                            vim.cmd("call timer_start(0, { tid -> execute(':e')})")
                        end
                    end
                })
                return true
            end

        },
        file_browser = {
            attach_mappings= function(prompt_bufnr)
                require'telescope.actions.set'.select:enhance({
                    post = function()
                        if vim.api.nvim_buf_get_name(0)~='' then
                            vim.cmd("call timer_start(0, { tid -> execute(':e')})")
                        end
                    end
                })
                return true
            end

        },
        live_grep = {
            attach_mappings= function(prompt_bufnr)
                require'telescope.actions.set'.select:enhance({
                    post = function()
                        if vim.api.nvim_buf_get_name(0)~='' then
                            vim.cmd("call timer_start(0, { tid -> execute(':e')})")
                        end
                    end
                })
                return true
            end

        }
    }
}

