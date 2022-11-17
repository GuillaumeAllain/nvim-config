----------------------------THEME------------------------------
return {
    config = function(table)
        local table = table or {}
        local float_bg = table.float_bg or vim.g["terminal_color_0"]
        vim.g["&fcs"] = "eob: "
        vim.opt.termguicolors = true
        vim.opt.showmode = false
        vim.cmd.hi({ "LineNr", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "Folded", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "NonText", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "SpecialKey", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "VertSplit", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "SignColumn", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "EndOfBuffer", "guibg=none", "ctermbg=none", bang = true })
        vim.cmd.hi({ "link", "Conceal", "Comment", bang = true })
        vim.cmd.hi({ "link", "FoldColumn", "Comment", bang = true })
        vim.cmd.hi({ "link", "Folded", "Comment", bang = true })
        vim.cmd.hi({ "link", "DiagnosticInfoFloat", "Normal", bang = true })
        vim.cmd.hi({ "link", "FloatBorder", "DiagnosticInfo", bang = true })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_0 })
        vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = float_bg, bg = float_bg })
        vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = vim.g.terminal_color_15, bg = float_bg })

        vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = vim.g.terminal_color_7, bg = vim.g.terminal_color_0 })
        vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = vim.g.terminal_color_0, bg = vim.g.terminal_color_0 })
        vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { link = "TelescopePromptNormal" })
        vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "TelescopePromptNormal" })
        vim.api.nvim_set_hl(0, "NoiceMini", { link = "TelescopePromptNormal" })
        vim.api.nvim_set_hl(0, "HarpoonNormal", { link = "TelescopeNormal" })
        vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "TelescopeBorder" })
        vim.api.nvim_set_hl(0, "HarpoonTerm", { link = "TelescopeNormal" })
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorderSearch", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NoicePopup", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NotifyErrorBody", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NotifyErrorBorder", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NotifyErrorTitle", {link="NotifyErrorBody"})
        vim.api.nvim_set_hl(0, "NotifyErrorIcon", {link="NotifyErrorBody"})
        vim.api.nvim_set_hl(0, "NotifyWarnBody", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NotifyWarnBorder", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NotifyWarnTitle", {link="NotifyWarnBody"})
        vim.api.nvim_set_hl(0, "NotifyWarnIcon", {link="NotifyWarnBody"})
        vim.api.nvim_set_hl(0, "NotifyInfoBody", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NotifyInfoBorder", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NotifyInfoTitle", {link="NotifyInfoBody"})
        vim.api.nvim_set_hl(0, "NotifyInfoIcon", {link="NotifyInfoBody"})
        vim.api.nvim_set_hl(0, "NotifyDebugBody", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NotifyDebugBorder", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NotifyDebugTitle", {link="NotifyDebugBody"})
        vim.api.nvim_set_hl(0, "NotifyDebugIcon", {link="NotifyDebugBody"})
        vim.api.nvim_set_hl(0, "NotifyTraceBody", {link="TelescopeNormal"})
        vim.api.nvim_set_hl(0, "NotifyTraceBorder", {link="TelescopeBorder"})
        vim.api.nvim_set_hl(0, "NotifyTraceTitle", {link="NotifyTraceBody"})
        vim.api.nvim_set_hl(0, "NotifyTraceIcon", {link="NotifyTraceBody"})
    end,
}
