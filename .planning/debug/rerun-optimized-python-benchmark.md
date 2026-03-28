---
status: investigating
trigger: "Rerun the benchmark for opening `repro_python_except_star.py` and going into insert mode with additional optimizations: lualine on VeryLazy, basedpyright basic/noLibCode, LazyFile active for LSP/Treesitter. Compare with 207ms/225ms."
created: 2024-03-25T15:00:00Z
updated: 2024-03-25T15:00:00Z
---

## Current Focus

hypothesis: "Applying requested optimizations (lualine VeryLazy, basedpyright basic/noLibCode, LazyFile) will further reduce startup and insert mode times."
test: "Apply configuration changes, then run `nvim -u init.lua --cmd \"lua require('benchmark')\" repro_python_except_star.py --headless`."
expecting: "VimEnter < 207ms and InsertEnter < 225ms."
next_action: "Examine current configuration for lualine, basedpyright, and LazyFile."

## Symptoms

expected: |
  - Total Startup Time (VimEnter): < 207.23 ms
  - Time to Insert Mode (InsertEnter): < 225.45 ms
actual: |
  - Total Startup Time (VimEnter): 207.23 ms (baseline)
  - Time to Insert Mode (InsertEnter): 225.45 ms (baseline)
errors: []
reproduction: "nvim -u init.lua --cmd \"lua require('benchmark')\" repro_python_except_star.py --headless"
started: "2024-03-25 (rerun optimization request)"

## Eliminated

## Evidence

## Resolution

root_cause:
fix:
verification:
files_changed: []
