---
status: investigating
trigger: "Investigate why the ':CodeCompanion' command is unavailable."
created: 2024-05-24T10:00:00Z
updated: 2024-05-24T11:00:00Z
---

## Current Focus

hypothesis: none
test: check codecompanion config
expecting: find how codecompanion is configured
next_action: check lua/config/plugins/codecompanion.lua and lua/config/plugins/init.lua

## Symptoms

expected: `:CodeCompanion` command should be available in Neovim.
actual: `:CodeCompanion` command is unavailable.
errors: []
reproduction: Open Neovim and try to run `:CodeCompanion`.
started: unknown

## Eliminated

## Evidence

## Resolution

root_cause:
fix:
verification:
files_changed: []
