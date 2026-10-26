# Neovim configuration

Requires Neovim 0.12+ (plugins are managed by the built-in `vim.pack`).

- `init.lua` — entry point, loads `lua/config/`.
- `lua/config/init.lua` — options, autocmds, keymaps.
- `lua/config/plugins/init.lua` — plugin list (`vim.pack.add`) and small setups.
- `lua/config/plugins/*.lua` — configs for the larger plugins (`mini.lua` holds all mini.nvim modules).
- `lua/config/lsp.lua` — enabled servers and mason tooling; per-server overrides live in `lsp/`.
- `after/ftplugin/` — filetype settings.
