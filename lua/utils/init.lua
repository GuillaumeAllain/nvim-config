local api = vim.api
local m = {}

function m.macdict(word)
    api.nvim_command("silent !open -g dict://" .. word)
    api.nvim_command("redraw!")
end

function m.get_build_terminal()
    -- Returns build terminal handle. If not found, it creates it
    local buffer_list = vim.fn.getbufinfo()
    local create_buffer = true
    local buffer_number = nil
    local current_mode = vim.fn.mode()

    for k in pairs(buffer_list) do
        if vim.fn.bufname(buffer_list[k].bufnr) == "BuildTerminal" then
            buffer_number = vim.fn.deepcopy(buffer_list[k].bufnr)
            if vim.api.nvim_get_option_value("buftype", { buf = buffer_number }) == "terminal" then
                create_buffer = false
            else
                vim.api.nvim_buf_delete(buffer_number, {})
            end
            break
        end
    end

    if create_buffer then
        buffer_number = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_buf_call(buffer_number, function()
            vim.fn.termopen("$SHELL")
        end)
        if current_mode ~= "i" then
            vim.fn.execute("stopinsert")
        end
        vim.api.nvim_buf_set_name(buffer_number, "BuildTerminal")
    end

    return buffer_number
end

function m.send_command_to_build_terminal(command)
    local build_buffer = m.get_build_terminal()
    if not build_buffer then
        return
    end
    local build_buffer_job_id = vim.api.nvim_buf_call(build_buffer, function()
        return vim.b.terminal_job_id
    end)
    local current_mode = vim.fn.mode()

    vim.api.nvim_chan_send(build_buffer_job_id, command .. "\n")

    if current_mode ~= "i" then
        vim.fn.execute("stopinsert")
    end
end

function m.open_build_buffer_window(config)
    local build_buffer = m.get_build_terminal()
    local cur_window = vim.fn.winnr()

    if config.vertical == true then
        vim.fn.execute("botright split | buffer " .. tostring(build_buffer))
    else
        vim.fn.execute("split | buffer " .. tostring(build_buffer))
    end
    vim.wo.number = false
    vim.wo.relativenumber = false
    vim.fn.execute("norm G")
    local term_window = vim.fn.win_getid()
    vim.fn.execute(tostring(cur_window) .. " wincmd w")
    return term_window
end

function m.focus_build_buffer_window(config)
    local win_info = vim.fn.getwininfo()
    local build_buffer = m.get_build_terminal()
    local window_closed = false
    local term_window = vim.fn.win_getid()
    for k in pairs(win_info) do
        if win_info[k].bufnr == build_buffer then
            -- vim.api.nvim_win_close(win_info[k].winid, true)
            window_closed = true
            term_window = win_info[k].winid
        end
    end

    if not window_closed then
        term_window = m.open_build_buffer_window(config)
    end

    api.nvim_set_current_win(term_window)
    vim.fn.execute("norm i")
end

function m.toggle_build_buffer_window(config)
    local win_info = vim.fn.getwininfo()
    local build_buffer = m.get_build_terminal()
    local window_closed = false

    for k in pairs(win_info) do
        if win_info[k].bufnr == build_buffer then
            vim.api.nvim_win_close(win_info[k].winid, true)
            window_closed = true
        end
    end

    if not window_closed then
        m.open_build_buffer_window(config)
    end
end

return m
