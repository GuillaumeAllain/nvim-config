# Neovim Configuration

This repository contains a modular and modern Neovim configuration, optimized for productivity, extensibility, and ease of use. It leverages the latest Neovim features and a curated set of plugins managed via [lazy.nvim](https://github.com/folke/lazy.nvim).

## Features

- **Plugin Management:** Uses `lazy.nvim` for fast, lazy-loaded plugin management.
- **LSP Support:** Pre-configured for multiple languages (Python, Rust, Lua, C/C++, SQL, R, LaTeX, YAML, and more).
- **Treesitter:** Enhanced syntax highlighting and code navigation.
- **Keymaps:** Custom keybindings for efficient workflow.
- **Formatting & Linting:** Integrated formatters and linters.
- **UI Enhancements:** Statusline, color schemes, and improved notifications.
- **Productivity Plugins:** Git integration, project management, snippets, and more.

## Directory Structure

- `init.lua` — Entry point, bootstraps lazy.nvim and loads core config.
- `lua/config/` — Main configuration modules (plugins, LSP, UI, etc).
- `lua/utils/` — Utility functions for the configuration.
- `.luarc.json` — Lua language server settings.
- `stylua.toml` — Formatting rules for Lua code.
- `.gitignore` — Git ignore rules for generated files.

## Installation

1. **Clone this repository:**
   ```sh
   git clone <this-repo-url> ~/.config/nvim
   ```
2. **Start Neovim:**
   ```sh
   nvim
   ```
   The configuration will automatically bootstrap `lazy.nvim` and install all plugins.

## Requirements

- [Neovim 0.12.0+](https://neovim.io/)
- [git](https://git-scm.com/)

## Customization

Edit files in `lua/config/` and `lua/utils/` to tweak plugins, keymaps, and settings to your liking.

## Credits

- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- And many more plugin authors!

---

Feel free to fork and adapt this configuration to your workflow.
