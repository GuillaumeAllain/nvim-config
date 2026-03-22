# Neovim Configuration

## What This Is

A sophisticated and modular Neovim configuration optimized for a high-performance developer workflow. It leverages modern plugins and Lua-based configuration for a fast, extensible, and intelligent editing experience.

## Core Value

Enable seamless and intelligent code interaction through a fast, stable, and highly customized Neovim environment.

## Requirements

### Validated

- [x] **PLUG-01**: Plugin management using `lazy.nvim`
- [x] **LSP-01**: Native LSP integration with auto-configuration for multiple languages
- [x] **CMP-02**: Modern completion engine with `blink.cmp`
- [x] **FMT-01**: Formatting integration via `conform.nvim`
- [x] **UI-01**: Enhanced UI components through `snacks.nvim`, `noice.nvim`, and `mini.nvim`
- [x] **TS-01**: Treesitter-based syntax highlighting and text objects
- [x] **THEME-01**: Support for high-quality themes like `rose-pine` and `tokyonight`

### Active

- [ ] **MAINT-01**: Regular maintenance and updates of existing plugin configurations
- [ ] **OPT-01**: Ongoing optimization for startup performance and responsiveness
- [ ] **LSP-02**: Refining language-specific LSP settings for improved DX

### Out of Scope

- Support for Vim (Legacy) — This is a Lua-first Neovim configuration.
- Heavy GUI wrappers — Focused on terminal-based or Neovide usage.

## Context

The configuration is structured with a clear separation between core settings, plugin definitions, and language-specific logic (`after/lsp/` and `after/ftplugin/`). It is primarily used on Darwin (macOS).

## Constraints

- **Platform**: Darwin (macOS)
- **Runtime**: Neovim 0.10+ (Lua 5.1/LuaJIT)
- **Plugin Manager**: lazy.nvim

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Use `lazy.nvim` | Industry standard for Neovim plugin management, fast and stable. | ✓ Good |
| Lua-first config | Native Neovim configuration language, better performance and extensibility. | ✓ Good |
| Modular `after/` structure | Keeps language-specific and LSP logic organized and easy to maintain. | ✓ Good |

---
*Last updated: 2026-03-21 after initial project setup*
