vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.cmd [[noautocmd :update]]
            vim.cmd [[GitGutter]]
        end
    end
end

local on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[augroup Format]]
        vim.cmd [[autocmd! * <buffer>]]
        vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,1000)]]
        vim.cmd [[augroup END]]
    end

    -- vim.lsp.handlers['textDocument/hover'] = function(_, method, result)
    --     vim.lsp.util.focusable_float(method, function()
    --         if not (result and result.contents) then return end
    --         local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    --         markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    --         if vim.tbl_isempty(markdown_lines) then return end

    --         local bufnr,contents_winid,_,border_winid = vim.lsp.util.fancy_floating_markdown(markdown_lines)
    --         vim.lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden", "InsertCharPre"}, contents_winid)
    --         vim.lsp.util.close_preview_autocmd({"CursorMoved", "BufHidden", "InsertCharPre"}, border_winid)
    --         return bufnr,contents_winid
    --     end)
    -- end
    -- require'lsp_signature'.on_attach({log_path = "/tmp/sig.log", debug = true, extra_trigger_chars = {"(",","}})
    -- require "lsp_signature".on_attach(
    --     {
    --         bind = true, -- This is mandatory, otherwise border config won't get registered.
    --         -- If you want to hook lspsaga or other signature handler, pls set to false
    --         doc_lines = 4, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    --         -- set to 0 if you DO NOT want any API comments be shown
    --         -- This setting only take effect in insert mode, it does not affect signature help in normal
    --         -- mode, 10 by default

    --         floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    --         fix_pos = true,  -- set to true, the floating window will not auto-close until finish all parameters
    --         hint_enable = true, -- virtual hint enable
    --         hint_prefix = "🐼 ",  -- Panda for parameter
    --         hint_scheme = "String",
    --         use_lspsaga = false,  -- set to true if you want to use lspsaga popup
    --         hi_parameter = "Search", -- how your parameter will be highlight
    --         max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    --         log_path = "/tmp/sig.log",
    --         debug=false,
    --         -- to view the hiding contents
    --         max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    --         handler_opts = {
    --             border = "single",   -- double, single, shadow, none
    --         },
    --         -- extra_trigger_chars = {"(",")"} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    --         -- deprecate !!
    --         -- decorator = {"`", "`"}  -- this is no longer needed as nvim give me a handler and it allow me to highlight active parameter in floating_window

    --     }
    -- )  -- Note: add in lsp client on-attach

    -- vim.cmd [[autocmd CursorHold * silent! lua require'lsp_signature'.signature()]]
end

require'lspconfig'.jedi_language_server.setup{
    on_attach = on_attach,
    init_options = {
        hover = {
            enable = true
        }
    },
    root_dir = function(fname)
        return require'lspconfig'.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end
}
--
-- require'lspconfig'.pyright.setup{
--     on_attach=on_attach,
--     settings={
--         pyright={
--             disableOrganizeImports = true,
--             disableDiagnostics = true,
--         },
--         python={
--             analysis={
--                 diagnosticMode="workspace"
--             }
--             -- linting={
--             --     enabled = true,

--             -- }
--         }

--     }
-- }

require'lspconfig'.efm.setup{
    on_attach = on_attach,
    init_options = {
        documentFormatting = true,
        hover= true,
        documentSymbol= true,
        codeAction= true,
        completion= true,
        signature_help=true,
    };
    filetypes={
        "python",
        "pandoc",
        "yaml",
    };
    root_dir = function(fname)
        return require'lspconfig'.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
}


require'lspconfig'.fortls.setup{}

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = os.getenv("HOME").."/srv/lua-language-server"

local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim','pandoc'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

local function find_toml(startpath)
    return require'lspconfig'.util.search_ancestors(startpath, function(path)
        if require'lspconfig'.util.path.is_file(require'lspconfig'.util.path.join(path, 'Project.toml')) then
            return path
        end
    end)
end

require 'lspconfig'.julials.setup{
    on_attach=on_attach,
    root_dir = function(fname)
        return find_toml(fname) or vim.fn.getcwd()
    end
}

