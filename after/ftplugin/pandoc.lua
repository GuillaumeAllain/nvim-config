vim.opt_local.expandtab = true
vim.opt_local.shiftwidth = 4
vim.opt_local.commentstring = "<!--%s-->"

vim.diagnostic.config({ virtual_lines = false })

local lineno = vim.fn.search([[---\_.*\zs\(^lang:.*$\)\ze\_.*---]], "n")
if lineno ~= 0 then
    local lang = vim.fn.getline(lineno):match("lang:%s*(.*)")
    if lang and lang ~= "" then
        vim.opt_local.spelllang = lang
    end
end

vim.cmd.iabbrev("<buffer>", "oeil", "œil")
vim.cmd.iabbrev("<buffer>", "Oeil", "Œil")

for _, k in ipairs({ "j", "k" }) do
    vim.keymap.set({ "n", "x" }, k, "g" .. k, { buffer = true })
end

for _, c in ipairs({ "$", "*" }) do
    MiniPairs.map_buf(0, "i", c, { action = "closeopen", pair = c .. c })
end

-- `saiwf` wraps in \cmd{...}
vim.b.minisurround_config = {
    custom_surroundings = {
        f = {
            output = function()
                local cmd = MiniSurround.user_input("Command")
                return cmd and { left = cmd .. "{", right = "}" } or nil
            end,
        },
    },
}
