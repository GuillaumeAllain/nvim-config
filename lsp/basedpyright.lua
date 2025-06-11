return {
    "basedpyright",
    -- handlers = {
    --     ["textDocument/publishDiagnostics"] = function() end,
    -- },
    on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
    basedpyright = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
            inlayHints = {
                callArgumentNames = true,
            },
        },
    },
}
