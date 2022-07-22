-----------------------------THEME------------------------------
return {
    config = function()
    vim.cmd("colorscheme rose-pine")
    vim.cmd([[let &fcs='eob: ']])
    vim.cmd([[set termguicolors]])
    vim.cmd([[set noshowmode]])
    vim.cmd([[hi! LineNr guibg=none ctermbg=none
    hi! Folded guibg=none ctermbg=none
    hi! NonText guibg=none ctermbg=none
    hi! SpecialKey guibg=none ctermbg=none
    hi! VertSplit guibg=none ctermbg=none
    hi! SignColumn guibg=none ctermbg=none
    hi! EndOfBuffer guibg=none ctermbg=none
    hi! link Conceal Comment
    hi! link FoldColumn Comment
    hi! link Folded Comment
    hi! link NormalFloat Normal
    hi! link FloatBorder Normal
    hi! link TelescopeBorder Normal
    hi! link TelescopePromptBorder Normal
    hi! link TelescopePromptBorder   Normal
    hi! link TelescopeResultsBorder  Normal
    hi! link TelescopePreviewBorder  Normal
    ]])

    end,
}
