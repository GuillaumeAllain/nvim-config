return {
    "basedpyright",
    -- handlers = {
    --     ["textDocument/publishDiagnostics"] = function() end,
    -- },
    on_init = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end,
}
