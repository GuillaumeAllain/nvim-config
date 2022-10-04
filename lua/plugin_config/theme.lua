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
        vim.cmd.hi({"link", "DiagnosticInfoFloat", "Normal",bang=true})
        vim.cmd.hi({"link", "FloatBorder", "DiagnosticInfo",bang=true})
        vim.cmd.hi({"link", "TelescopeBorder", "DiagnosticInfo",bang=true})
        vim.cmd.hi({"link", "TelescopePromptBorder", "DiagnosticInfo",bang=true})
        vim.cmd.hi({"link", "TelescopePromptBorder", "DiagnosticInfo",bang=true})
        vim.cmd.hi({"link", "TelescopeResultsBorder", "DiagnosticInfo",bang=true})
        vim.cmd.hi({"link", "TelescopePreviewBorder", "DiagnosticInfo",bang=true})
    end,
}
