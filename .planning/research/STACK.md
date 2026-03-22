# Technology Stack

**Project:** Modern Neovim Configuration
**Researched:** 2024-11-20
**Overall confidence:** HIGH

## Recommended Stack

The recommended stack focuses on high-performance, Lua-first, and low-dependency plugins. It prioritizes Rust-compiled modules (`blink.cmp`) and "all-in-one" high-performance tools (`snacks.nvim`) to minimize plugin count and startup overhead.

### Core Framework
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| Neovim | 0.10+ | Core Editor | Built-in LSP, Treesitter, and snippet support. 0.10+ is essential for native snippets and the latest performance optimizations. |
| Lua / LuaJIT | 5.1 | Language | Neovim's internal scripting engine. LuaJIT provides near-native performance for plugin logic. |

### Plugin Management
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| [lazy.nvim](https://github.com/folke/lazy.nvim) | Latest | Plugin Manager | Industry standard. Handles lazy-loading, dependency management, and bytecode caching. |

### Completion & LSP
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| [blink.cmp](https://github.com/Saghen/blink.cmp) | Latest | Completion Engine | Written in Rust. Significantly faster than `nvim-cmp`. Built-in fuzzy matching and LSP source management. |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Latest | LSP Configuration | Official bridge to Neovim's built-in LSP client. |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | Latest | Package Manager | Manages external binaries (LSPs, linters, formatters). |

### UI & Utilities
| Technology | Version | Purpose | Why |
|------------|---------|---------|-----|
| [snacks.nvim](https://github.com/folke/snacks.nvim) | Latest | Swiss Army Knife | Replaces dozens of plugins (Dashboard, Picker, Notifications, Git signs, Explorer) with unified, high-performance modules. |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Latest | Incremental Parsing | Essential for syntax highlighting, code folding, and smart text objects. |

### Formatting & Linting
| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| [conform.nvim](https://github.com/stevearc/conform.nvim) | Latest | Formatter | The modern standard for asynchronous formatting with LSP fallback. |
| [nvim-lint](https://github.com/mfussenegger/nvim-lint) | Latest | Linter | Lightweight alternative to `null-ls` for running external linters. |

## Alternatives Considered

| Category | Recommended | Alternative | Why Not |
|----------|-------------|-------------|---------|
| Completion | **blink.cmp** | nvim-cmp | `nvim-cmp` is Lua-only and can become slow with many sources. `blink.cmp` (Rust) offers superior performance and simpler config. |
| Picker | **snacks.picker** | Telescope | Telescope is powerful but can be slow in large monorepos. `snacks.picker` is faster and integrates better with the modern stack. |
| Formatting | **conform.nvim** | null-ls / none-ls | `null-ls` is archived. `none-ls` is a community fork but remains heavyweight. `conform.nvim` is faster and more focused. |

## Installation

```lua
-- Essential bootstrap for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Enable byte-code cache loader (NVIM 0.9+)
if vim.loader then
  vim.loader.enable()
end
```

## Sources

- [lazy.nvim Documentation](https://lazy.folke.io/)
- [blink.cmp GitHub](https://github.com/Saghen/blink.cmp)
- [snacks.nvim GitHub](https://github.com/folke/snacks.nvim)
- [conform.nvim GitHub](https://github.com/stevearc/conform.nvim)
