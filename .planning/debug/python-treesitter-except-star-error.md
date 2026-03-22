---
status: investigating
trigger: "Debug the Treesitter query error: 'Invalid node type \"except*\"'."
created: 2024-05-24T12:00:00Z
updated: 2024-05-24T12:00:00Z
---

## Current Focus

hypothesis: The Python parser is outdated and doesn't support the "except*" node type used in the highlight queries.
test: Run `:TSUpdate python` and checkhealth again.
expecting: TSUpdate should update the parser to a version that supports "except*".
next_action: Run TSUpdate python and verify with checkhealth.

## Symptoms

expected: Python files open without Treesitter query errors.
actual: Error 'Invalid node type "except*"' occurs.
errors: Invalid node type "except*"
reproduction: Open a Python file or run `:TSUpdate python`.
started: Unknown, likely after an update.

## Eliminated

## Evidence

- timestamp: 2024-05-24T12:05:00Z
  checked: :checkhealth nvim-treesitter
  found: ERROR python(highlights): ...-cc518cf/share/nvim/runtime/lua/vim/treesitter/query.lua:374: Query error at 226:4. Invalid node type "except*": "except*"
  implication: The highlights query expects "except*" node but the current python parser doesn't provide it. Needs parser update.

root_cause:
fix:
verification:
files_changed: []
