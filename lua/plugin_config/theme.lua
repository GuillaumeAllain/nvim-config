-----------------------------THEME------------------------------
return {
    config = function()
        vim.cmd.colorscheme("rose-pine")
        vim.g["&fcs"] = "eob: "
        vim.opt.termguicolors = true
        vim.opt.showmode = false
        vim.cmd.hi("LineNr", "guibg=none", "ctermbg=none")
        vim.cmd.hi("Folded", "guibg=none", "ctermbg=none")
        vim.cmd.hi("NonText", "guibg=none", "ctermbg=none")
        vim.cmd.hi("SpecialKey", "guibg=none", "ctermbg=none")
        vim.cmd.hi("VertSplit", "guibg=none", "ctermbg=none")
        vim.cmd.hi("SignColumn", "guibg=none", "ctermbg=none")
        vim.cmd.hi("EndOfBuffer", "guibg=none", "ctermbg=none")
        vim.cmd.hi("link", "Conceal", "Comment")
        vim.cmd.hi("link", "FoldColumn", "Comment")
        vim.cmd.hi("link", "Folded", "Comment")
        vim.cmd.hi("link", "NormalFloat", "Normal")
        vim.cmd.hi("link", "FloatBorder", "Normal")
        vim.cmd.hi("link", "TelescopeBorder", "Normal")
        vim.cmd.hi("link", "TelescopePromptBorder", "Normal")
        vim.cmd.hi("link", "TelescopePromptBorder", "Normal")
        vim.cmd.hi("link", "TelescopeResultsBorder", "Normal")
        vim.cmd.hi("link", "TelescopePreviewBorder", "Normal")
    end,
}
