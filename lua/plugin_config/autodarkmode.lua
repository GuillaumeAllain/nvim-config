require("auto-dark-mode").setup({
    update_interval = 1000,
    set_dark_mode = function()
        if vim.api.nvim_get_option("background") ~= "dark" then
            require("plugin_config/theme").config()
            vim.api.nvim_set_option("background", "dark")
            require("utils").export_theme_to_kitty()
            require("plugin_config/lualine").config()
        end
    end,
    set_light_mode = function()
        if vim.api.nvim_get_option("background") ~= "light" then
            require("plugin_config/theme").config()
            vim.api.nvim_set_option("background", "light")
            require("utils").export_theme_to_kitty()
            require("plugin_config/lualine").config()
        end
    end,
})
require("auto-dark-mode").init()
