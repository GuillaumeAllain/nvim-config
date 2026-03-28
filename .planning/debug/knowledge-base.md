# GSD Debug Knowledge Base

Resolved debug sessions. Used by `gsd-debugger` to surface known-pattern hypotheses at the start of new investigations.

---

## rerun-benchmark-python-startup — Benchmark performance of new LazyFile event
- **Date:** 2024-03-25
- **Error patterns:** benchmark, performance, startup, LazyFile, python
- **Root cause:** Initial performance regressions after configuration changes were addressed by implementing a custom `LazyFile` event to defer plugin loading.
- **Fix:** Implemented `LazyFile` event in `lua/utils/init.lua` and configured key plugins (lspconfig, treesitter) to use it.
- **Files changed:** lua/utils/init.lua, lua/config/plugins/init.lua, lua/config/plugins/treesitter.lua
---
