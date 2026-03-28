---
status: resolved
trigger: "Rerun the benchmark for opening `repro_python_except_star.py` and going into insert mode. Compare the new metrics with the previous ones."
created: 2024-03-24T10:00:00Z
updated: 2024-03-25T14:40:00Z
---

## Current Focus

hypothesis: "Current Neovim configuration has slower startup and LSP attachment times compared to previous benchmarks."
test: "Run the benchmark script `lua/benchmark.lua` and compare results with provided previous metrics."
expecting: "Detailed comparison showing regressions or improvements."
next_action: "COMPLETED"

## Symptoms

expected: |
  - Total Startup Time: ~185ms
  - Time to Insert Mode: ~240ms
  - LSP Ready (Ruff): ~196ms
  - LSP Ready (Basedpyright): ~260ms
  - Treesitter Parser Ready: ~284ms
  - Copilot Attachment: ~1.8s
actual: |
  - Total Startup Time (VimEnter): 207.23 ms
  - Time to Insert Mode (InsertEnter): 225.45 ms
  - LSP Ready (Ruff): 222.44 ms
  - LSP Ready (Basedpyright): 351.49 ms
  - Treesitter Parser Ready: 214.04 ms
  - Copilot Attachment: 1780.02 ms
errors: []
reproduction: "nvim -u init.lua --cmd \"lua require('benchmark')\" repro_python_except_star.py --headless"
started: "2024-03-24 (rerun request)"

## Eliminated

## Evidence

- timestamp: 2024-03-24T10:05:00Z
  checked: benchmark_output.txt
  found: |
    VimEnter: 265.20 ms
    InsertEnter: 286.23 ms
    LspAttach: ruff: 282.94 ms
    LspAttach: basedpyright: 435.02 ms
    Treesitter Parser Loaded: 272.89 ms
    LspAttach: copilot: 2004.30 ms
  implication: Significant regression in startup time and LSP attachment (especially Basedpyright). Treesitter loading is slightly faster.

- timestamp: 2024-03-25T14:30:00Z
  checked: benchmark_output.txt
  found: |
    VimEnter: 207.23 ms
    InsertEnter: 225.45 ms
    Treesitter Parser Loaded: 214.04 ms
    LspAttach: ruff: 222.44 ms
    InsertEnter: 225.45 ms
    LspAttach: basedpyright: 351.49 ms
    LspAttach: copilot: 1780.02 ms
  implication: |
    New results using `LazyFile` event show major improvements:
    - VimEnter: -58ms (vs old actual)
    - InsertEnter: -61ms (vs old actual)
    - Ruff: -60ms (vs old actual)
    - Basedpyright: -84ms (vs old actual)
    - Treesitter: -59ms (vs old actual)
    - Copilot: -224ms (vs old actual)
    
    Compared to baseline:
    - Insert Mode is now FASTER (225ms vs 240ms)
    - Treesitter is now FASTER (214ms vs 284ms)
    - Other metrics are approaching baseline.

## Resolution

root_cause:
fix:
verification:
files_changed: []
