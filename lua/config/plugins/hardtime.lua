require("hardtime").setup({
    disable_mouse = false,
    disabled_filetypes = {
        markdown = true,
        pandoc = true,
        typst = true,
    },
    hints = {
        ["[dcyvV][ia][%(%)]"] = {
            message = function(keys)
                return "Use " .. keys:sub(1, 2) .. "b instead of " .. keys
            end,
            length = 3,
        },
        ["[dcyvV][ia][%{%}]"] = {
            message = function(keys)
                return "Use " .. keys:sub(1, 2) .. "B instead of " .. keys
            end,
            length = 3,
        },
    },
})
