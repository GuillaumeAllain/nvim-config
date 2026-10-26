setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
lua MiniPairs.map_buf(0, "i", "$", { action = "closeopen", pair = "$$" })
