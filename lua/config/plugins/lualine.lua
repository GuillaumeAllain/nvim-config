return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()

        local function show_macro_recording()
            local recording_register = vim.fn.reg_recording()
            if recording_register == "" then
                return ""
            else
                return "Recording @" .. recording_register
            end
        end

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        require("lualine").setup({
            options = {
                theme = "rose-pine",
                component_separators = { "", "" },
                section_separators = { "", "" },
            },
            sections = {
                lualine_a = {

                    "mode",
                },
                lualine_b = {
                    {
                        "macro-recording",
                        fmt = show_macro_recording,
                    },
                    function()
                        return "%="
                    end,
                    { "filename", condition = conditions.buffer_not_empty },
                },
                lualine_c = {},
                lualine_x = {
                    "filetype",
                    {
                        function()
                            local msg = "No Active Lsp"
                            local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
                            local clients = vim.lsp.get_clients()
                            if next(clients) == nil then
                                return msg
                            end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                    if client.name ~= "null-ls" then
                                        return client.name
                                    end
                                end
                            end
                            return msg
                        end,
                        icon = "  LSP:",
                        condition = conditions.buffer_not_empty,
                    },
                    {
                        function()
                            local tab = vim.fn.tabpagenr()
                            local totaltab = vim.fn.tabpagenr("$")
                            if totaltab ~= 1 then
                                return "Tab: " .. tostring(tab) .. "/" .. tostring(totaltab)
                            else
                                return ""
                            end
                        end,
                    },
                },
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {
                    { "mode" },
                },
                lualine_b = {
                    {
                        function()
                            return tostring(vim.fn.winnr())
                        end,
                    },
                    function()
                        return "%="
                    end,
                    { "filename", condition = conditions.buffer_not_empty },
                },
                lualine_c = {},
                lualine_x = {
                    "filetype",
                },
                lualine_y = {},
                lualine_z = {},
            },
        })
        vim.opt.laststatus = 3
    end,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
}
