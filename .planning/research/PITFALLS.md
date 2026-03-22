# Domain Pitfalls

**Domain:** Modern Neovim Configuration
**Researched:** 2024-11-20

## Critical Pitfalls

Mistakes that can cause major performance issues or broken workflows.

### Pitfall 1: Synchronous Shell Calls blocking the UI
**What goes wrong:** Using `vim.fn.system()` in the `init.lua` to check for git info or external binaries.
**Why it happens:** Neovim is single-threaded for its main UI loop. Shell calls block the whole editor.
**Consequences:** Noticeable lag on startup and whenever the command is re-run (e.g., statusline updates).
**Prevention:** Use `vim.uv` (libuv) for async calls or use plugins that handle async data (like `snacks.git`).
**Detection:** High "other" time in `lazy.nvim` profiling or a high `nvim --startuptime`.

### Pitfall 2: Over-Optimizing Lazy Loading (Input Lag)
**What goes wrong:** Loading essential plugins like Treesitter or LSP on `VeryLazy` event.
**Why it happens:** Attempting to reach "under 10ms" startup time by deferring everything.
**Consequences:** The editor starts fast, but freezes for 1-2 seconds the moment you start typing or open a file because the deferred plugins finally load.
**Prevention:** Load core UI immediately. Load Treesitter and LSP on `BufReadPost` or `BufNewFile` to ensure they are ready when you actually need them.

### Pitfall 3: Antivirus/Security Scanning Interference
**What goes wrong:** Slow file reads on startup, especially on Windows or macOS.
**Why it happens:** Security software scans every small `.lua` file Neovim reads from your config.
**Consequences:** Startup time multiplies (e.g., from 50ms to 500ms+).
**Prevention:** Exclude Neovim binary and your `~/.config/nvim` folder from real-time scanning.

## Moderate Pitfalls

### Pitfall 1: Double Formatting (LSP vs Conform)
**What goes wrong:** Both a language server and a dedicated formatter (via `conform.nvim`) try to format the same file.
**Prevention:** Configure `conform.nvim` with `lsp_format = "fallback"` to only use LSP when no dedicated formatter is found, or explicitly disable formatting in your LSP server capabilities.

### Pitfall 2: Missing `vim.loader`
**What goes wrong:** Neovim 0.9+ has a bytecode cache, but it's not enabled by default.
**Prevention:** Add `if vim.loader then vim.loader.enable() end` at the very top of `init.lua`.

## Minor Pitfalls

### Pitfall 1: Plugin Conflicts with `blink.cmp`
**What goes wrong:** Having `nvim-cmp` still active while trying to use `blink.cmp`.
**Prevention:** Ensure `nvim-cmp` and all its extension plugins (e.g., `cmp-buffer`, `cmp-path`) are removed or disabled in your plugin specs.

## Phase-Specific Warnings

| Phase Topic | Likely Pitfall | Mitigation |
|-------------|---------------|------------|
| LSP Setup | Mason-managed binaries not in `$PATH`. | Ensure `mason.nvim` path is correctly configured or let `mason-lspconfig` handle it. |
| UI Overhaul | Dashboard plugins slow down startup. | Use `snacks.dashboard` as it is built for speed and integration. |
| Completion | Missing snippet engine. | Use Neovim 0.10+ native snippets as `blink.cmp` expects this by default. |

## Sources

- [Neovim Performance Optimization Guide](https://github.com/neovim/neovim/wiki/Performance)
- [lazy.nvim Issues & Community Discussions](https://github.com/folke/lazy.nvim/discussions)
- [Reddit r/neovim community "Why is my Neovim slow?" threads](https://www.reddit.com/r/neovim/)
