-----------------------------THEME------------------------------
return {
    config = function()
        vim.g["&fcs"] = "eob: "
        vim.opt.termguicolors = true
        vim.opt.showmode = false
        vim.cmd.hi({"LineNr", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"Folded", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"NonText", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"SpecialKey", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"VertSplit", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"SignColumn", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"EndOfBuffer", "guibg=none", "ctermbg=none",bang=true})
        vim.cmd.hi({"link", "Conceal", "Comment",bang=true})
        vim.cmd.hi({"link", "FoldColumn", "Comment",bang=true})
        vim.cmd.hi({"link", "Folded", "Comment",bang=true})
        vim.cmd.hi({"link", "NormalFloat", "Normal",bang=true})
        vim.cmd.hi({"link", "FloatBorder", "Normal",bang=true})
        vim.cmd.hi({"link", "TelescopeBorder", "Normal",bang=true})
        vim.cmd.hi({"link", "TelescopePromptBorder", "Normal",bang=true})
        vim.cmd.hi({"link", "TelescopePromptBorder", "Normal",bang=true})
        vim.cmd.hi({"link", "TelescopeResultsBorder", "Normal",bang=true})
        vim.cmd.hi({"link", "TelescopePreviewBorder", "Normal",bang=true})
    end,
}
