local ctags_ft = { "pandoc", "markdown", "codevlisp" }
return {
    "ludovicchabant/vim-gutentags",
    -- ft = require("config").ctags_ft,
    lazy = true,
    event = "VeryLazy",
    init = function()
        vim.g.gutentags_project_root = { "package.json", ".git", ".notes" }
        vim.g.gutentags_cache_dir = vim.fn.expand(vim.fn.stdpath("cache") .. "ctags")
        vim.g.gutentags_generate_on_new = true
        vim.g.gutentags_generate_on_missing = true
        vim.g.gutentags_generate_on_write = true
        vim.g.gutentags_generate_on_empty_buffer = true
        vim.g.gutentags_ctags_exclude = { "*/qmk_firmware/*", ".Trash", "*.f90", "*.vim", "Makefile" , "*/.pixi/*", "*.json"}
        vim.g.gutentags_file_list_command = "rg --files"
        vim.g.gutentags_exclude_project_root = { "/usr/local", "*/qmk_firmware/*", "*/.Trash/*" }
    end,
    config = function()
        vim.fn.system("mkdir -p " .. vim.fn.stdpath("cache") .. "ctags")
        vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
    end,
}
