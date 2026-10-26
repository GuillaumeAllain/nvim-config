setlocal suffixesadd+=.liseq
setlocal suffixesadd+=.seq
setlocal commentstring=;;%s

" `saiwf` wraps in (name ...)
lua << LUA
vim.b.minisurround_config = { custom_surroundings = { f = { output = function()
    local name = MiniSurround.user_input("Function name")
    return name and { left = "(" .. name .. " ", right = ")" } or nil
end } } }
LUA
