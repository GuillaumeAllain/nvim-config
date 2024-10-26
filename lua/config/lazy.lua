require("utils").lazy_file()


require("lazy").setup("config.plugins", {
    defaults = { lazy = true},
    install = { colorscheme = { "rose-pine" } },
    dev = {
        path = "~/srv",
    },
    diff = {
        cmd = "terminal_git",
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "zip",
                "zipPlugin",
                "tar",
                "tarPlugin",
                "getscript",
                "getscriptPlugin",
                "vimball",
                "vimballPlugin",
                "2html_plugin",
                "logipat",
                "rrhelper",
                "spellfile_plugin",
                "sql_completion",
                "syntax_completion",
                "rplugin",
                "tutor",
                "tohtml",
            },
        },
    },
})
