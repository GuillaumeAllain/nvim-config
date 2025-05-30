local api = vim.api
local m = {}

local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

function m.lazy_file()
    -- This autocmd will only trigger when a file was loaded from the cmdline.
    -- It will render the file as quickly as possible.
    vim.api.nvim_create_autocmd("BufReadPost", {
        once = true,
        callback = function(event)
            -- Skip if we already entered vim
            if vim.v.vim_did_enter == 1 then
                return
            end

            -- Try to guess the filetype (may change later on during Neovim startup)
            local ft = vim.filetype.match({ buf = event.buf })
            if ft then
                -- Add treesitter highlights and fallback to syntax
                local lang = vim.treesitter.language.get_lang(ft)
                if not (lang and pcall(vim.treesitter.start, event.buf, lang)) then
                    vim.bo[event.buf].syntax = ft
                end

                -- Trigger early redraw
                vim.cmd([[redraw]])
            end
        end,
    })

    -- Add support for the LazyFile event
    local Event = require("lazy.core.handler.event")

    Event.mappings.LazyFile = { id = "LazyFile", event = lazy_file_events }
    Event.mappings["User LazyFile"] = Event.mappings.LazyFile
end

local function _get_kitty_theme()
    local theme = {}
    theme[#theme + 1] = "# " .. vim.o.background
    theme[#theme + 1] = "background " .. vim.fn.synIDattr(vim.fn.hlID("Normal"), "bg")
    theme[#theme + 1] = "foreground " .. vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
    theme[#theme + 1] = "selection_foreground " .. vim.fn.synIDattr(vim.fn.hlID("Normal"), "fg")
    theme[#theme + 1] = "selection_background " .. vim.fn.synIDattr(vim.fn.hlID("Visual"), "bg")
    theme[#theme + 1] = "active_border_color " .. vim.fn.synIDattr(vim.fn.hlID("Visual"), "bg")
    theme[#theme + 1] = "inactive_border_color " .. vim.fn.synIDattr(vim.fn.hlID("Visual"), "bg")
    if vim.fn.synIDattr(vim.fn.hlID("Cursor"), "bg") ~= "fg" then
        theme[#theme + 1] = "cursor " .. vim.fn.synIDattr(vim.fn.hlID("Cursor"), "bg")
    end
    for i = 0, 15 do
        theme[#theme + 1] = "color" .. tostring(i) .. " " .. vim.fn.eval("g:terminal_color_" .. tostring(i))
    end
    return theme
end

function m.export_theme_to_kitty()
    local altfile = vim.fn.getreg("#")
    local localfile = vim.fn.getreg("%")
    api.nvim_command("nos e " .. vim.fn.expand("$XDG_CACHE_HOME/kitty/nvim_theme.conf")) -- equivalent to :enew
    api.nvim_buf_set_lines(0, 0, -1, false, _get_kitty_theme())
    api.nvim_command("silent !mkdir -p %:h")
    api.nvim_command("silent w")
    api.nvim_command("silent! bd!")
    api.nvim_command("silent !kitty @ set-colors --all --configured ~/.config/kitty/kitty.conf")
    api.nvim_command("silent! edit " .. localfile)
    if altfile ~= "" then
        vim.fn.setreg("#", altfile)
    else
        vim.cmd([["let @# = ''"]])
    end
end

function m.log_to_file(message, file)
    if not file then
        return
    end
    vim.fn.system("echo " .. vim.fn.strftime("%T", vim.fn.localtime()) .. " - " .. message .. ">> " .. file)
end

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

function m.open_scratch_buffer(config)
    local buffer_number = vim.api.nvim_create_buf(true, false)
    if config.vertical == true then
        vim.fn.execute("botright split | buffer " .. tostring(buffer_number))
    else
        vim.fn.execute("split | buffer " .. tostring(buffer_number))
    end
    vim.bo.buftype = "nofile"
    vim.fn.execute("nos", "silent")
    local term_window = vim.fn.win_getid()
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

function m.toggle_background()
    -- local altfile = vim.fn.getreg("#")
    -- local localfile = vim.fn.getreg("%")
    -- api.nvim_command("nos e " .. vim.fn.stdpath("config") .. "/init.lua") -- equivalent to :enew
    if vim.opt.background:get() == "light" then
        vim.opt.background = "dark"
        --     api.nvim_command("silent! %s/vim.opt.background\\s*=\\s*\"\\(light\\)/vim.opt.background=\"dark")
    else
        vim.opt.background = "light"
        --     api.nvim_command("silent! %s/vim.opt.background\\s*=\\s*\"\\(dark\\)/vim.opt.background=\"light")
    end
    -- api.nvim_command("silent w")
    -- api.nvim_command("silent! bd!")
    -- api.nvim_command("silent! edit "..localfile)
    -- if altfile ~= "" then
    --     vim.fn.setreg("#", altfile)
    -- else
    --     vim.cmd[["let @# = ''"]]
    -- end
    require("config.plugins.lualine").config()
    require("config.vim-theme").config()
    m.export_theme_to_kitty()
end

m.log_autocmds_toggle = require("utils.log_autocmds").log_autocmds_toggle

return m
