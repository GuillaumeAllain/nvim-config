local m = {}

function m.log_autocmds_toggle()
    vim.cmd([[
        augroup LogAutocmd
            au!
        augroup END
    ]])
    local date = vim.fn.strftime("%F", vim.fn.localtime())
    if LogAutocmdsActivated then
        LogAutocmdsActivated = nil
    else
        vim.cmd([[augroup LogAutocmd]])
        for _, autocmd in ipairs(require("utils.au_list")) do
            vim.cmd(
                "silent execute 'autocmd "
                    .. autocmd
                    .. ' * lua require"utils".log_to_file("'
                    .. autocmd
                    .. '","/tmp/nvim_log_autocommands")\''
            )
        end
        vim.cmd([[augroup END]])
        LogAutocmdsActivated = true
    end
end

return m
