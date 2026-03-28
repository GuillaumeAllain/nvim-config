---
status: investigating
trigger: "Benchmark the opening of a python file (e.g., `repro_python_except_star.py`) and going into insert mode. Measure the total time and identify which components (e.g., LSP, Treesitter, or specific plugins like `conform.nvim`) contribute most to the latency. Provide a clear breakdown of the performance metrics."
created: 2024-03-24T00:00:00Z
updated: 2024-03-24T00:00:00Z
---

## Current Focus

hypothesis: "Total startup time and time to insert mode can be measured using `--startuptime` and a custom script."
test: "Run Neovim with `--startuptime` and a script that enters insert mode then quits, measuring the wall-clock time."
expecting: "A breakdown of where time is spent during startup and the total duration for the specific action."
next_action: "Gather initial startup metrics with --startuptime."

## Symptoms

expected: "Fast opening and smooth transition to insert mode."
actual: "Unknown latency until measured."
errors: []
reproduction: "Run nvim repro_python_except_star.py"
started: "Always (benchmark request)"

## Eliminated

## Evidence

## Resolution

root_cause:
fix:
verification:
files_changed: []
