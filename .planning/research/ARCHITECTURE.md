# Architecture Patterns

**Domain:** Modern Neovim Configuration
**Researched:** 2024-11-20

## Recommended Architecture

A modular Lua-first architecture is the industry standard for maintainable Neovim configurations. It separates core editor settings, keymaps, and plugin specifications into isolated files.

```text
~/.config/nvim
├── lua/
│   ├── config/             # Core settings (no plugin logic)
│   │   ├── options.lua     # vim.opt settings
│   │   ├── keymaps.lua     # Global keybindings
│   │   ├── autocmds.lua    # Global event handlers
│   │   └── lazy.lua        # lazy.nvim initialization
│   ├── plugins/            # Modular plugin specs
│   │   ├── ui.lua          # snacks.nvim, theme
│   │   ├── lsp.lua         # lspconfig, mason
│   │   ├── completion.lua  # blink.cmp
│   │   └── format.lua      # conform.nvim
│   └── utils/              # Custom Lua helper functions
├── after/
│   └── ftplugin/           # Language-specific settings
├── init.lua                # Entry point (require "config.lazy")
└── lazy-lock.json          # Plugin lockfile (auto-generated)
```

### Component Boundaries

| Component | Responsibility | Communicates With |
|-----------|---------------|-------------------|
| `init.lua` | Entry point. Loads `config.lazy`. | `lua/config/lazy.lua` |
| `config/options.lua` | Sets global `vim.opt` (e.g., `relativenumber`, `expandtab`). | Neovim Core |
| `config/lazy.lua` | Bootstraps `lazy.nvim` and loads `plugins/`. | `lazy.nvim`, `plugins/` |
| `plugins/lsp.lua` | Configures LSP servers and their interaction. | `mason.nvim`, `nvim-lspconfig` |
| `after/ftplugin/` | Overrides settings based on filetype (e.g., python indentation). | Neovim Core |

### Data Flow

1.  **Startup**: `init.lua` → `config/lazy.lua` (bootstraps).
2.  **Plugin Loading**: `lazy.nvim` recursively reads `lua/plugins/*.lua`.
3.  **Configuration Application**:
    - `opts` (in plugin specs) are applied by `lazy.nvim`.
    - `config` functions are executed when a plugin is first used.
4.  **Runtime**: User events (e.g., `BufReadPost`) trigger `autocmds.lua` or `ftplugin` overrides.

## Patterns to Follow

### Pattern 1: Table-Driven Plugin Configuration
Using `lazy.nvim`'s table-driven approach to cleanly define and configure plugins without manual `require` calls.
```lua
-- lua/plugins/completion.lua
return {
  "saghen/blink.cmp",
  version = "*",
  opts = {
    keymap = { preset = 'default' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
  },
}
```

### Pattern 2: `ftplugin` for Language Specifics
Instead of huge `autocmd` blocks in `init.lua`, use Neovim's built-in `after/ftplugin` system.
```lua
-- after/ftplugin/python.lua
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
```

## Anti-Patterns to Avoid

### Anti-Pattern 1: Monolithic `init.lua`
**What:** Keeping all settings and plugin logic in one 2,000-line file.
**Why bad:** Makes debugging difficult, impossible to share parts of config, and harder to maintain.
**Instead:** Modularize into the `lua/config/` and `lua/plugins/` structure.

### Anti-Pattern 2: Global `LspAttach` logic in plugin specs
**What:** Defining complex LSP keymaps inside every plugin file.
**Why bad:** Duplicates logic and causes conflicts.
**Instead:** Create a central `LspAttach` autocmd in `lua/config/autocmds.lua` or a dedicated LSP helper.

## Scalability Considerations

| Concern | Small Config | Large/Professional Config |
|---------|--------------|---------------------------|
| **Plugin Count** | <20 | 50+ |
| **Startup Time** | Irrelevant | Under 50ms (achieved via `lazy-loading` and `vim.loader`) |
| **Maintainability** | Single file is fine | Modular structure required |
| **LSP** | 1-2 servers | Multi-language, Mason-managed |

## Sources

- [lazy.nvim Structure Recommendations](https://github.com/folke/lazy.nvim#-structuring-your-plugins)
- [Neovim Documentation (`:help lua-guide`)](https://neovim.io/doc/user/lua-guide.html)
