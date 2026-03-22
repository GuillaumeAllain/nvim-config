---
status: investigating
trigger: "Investigate why Treesitter highlighting is inactive despite no configuration errors. 1. Check 'lua/config/plugins/treesitter.lua' to see if 'highlight = { enable = true }' is correctly set. 2. Verify if Treesitter highlighting is active in a buffer by running ':lua =vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil'. 3. Check ':Inspect' in a buffer to see if Treesitter captures are being applied. 4. Verify if any parser is actually loaded for the current filetype (e.g., ':TSModuleInfo'). 5. Restore highlighting by ensuring the 'setup' call correctly initializes the highlighting module or by restoring necessary autocmds."
created: 2025-02-17T11:00:00Z
updated: 2025-02-17T11:00:00Z
---

## Current Focus

hypothesis: Treesitter highlighting is disabled in the configuration.
test: Check `lua/config/plugins/treesitter.lua` for `highlight = { enable = true }`.
expecting: `highlight = { enable = true }` to be missing or set to `false`.
next_action: Read `lua/config/plugins/treesitter.lua`.

## Symptoms

expected: Treesitter syntax highlighting should be active in supported filetypes.
actual: Treesitter highlighting is inactive.
errors: None reported.
reproduction: Open a supported file (e.g., .lua, .py) and observe highlighting.
started: Unknown.

## Eliminated

## Evidence

## Resolution

root_cause: 
fix: 
verification: 
files_changed: []
