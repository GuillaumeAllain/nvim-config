# Roadmap: Neovim Configuration

## Phases

- [ ] **Phase 1: Foundation** - Establish modular structure and bootstrap plugin management.
- [ ] **Phase 2: Intelligence** - Enable IDE features with LSP, completion, and snippets.
- [ ] **Phase 3: Experience** - Enhance UI, navigation, and Git integration.
- [ ] **Phase 4: Optimization** - Finalize formatting and tune performance.

## Phase Details

### Phase 1: Foundation
**Goal**: Establish a stable, modular foundation for the configuration.
**Depends on**: Nothing
**Requirements**: CORE-01, CORE-02, EDIT-01
**Success Criteria**:
1. `lazy.nvim` is bootstrapped and manages plugins without errors.
2. Configuration is split into `lua/config/` and `lua/plugins/` with clear separation of concerns.
3. Treesitter highlighting and text objects are active for core languages (Lua, Python).
**Plans**: TBD

### Phase 2: Intelligence
**Goal**: Enable smart code interaction and language-aware features.
**Depends on**: Phase 1
**Requirements**: LSP-01, LSP-02, LSP-03, CMP-01, CMP-02, EDIT-03
**Success Criteria**:
1. LSP servers for supported languages are automatically installed and attached to buffers.
2. `blink.cmp` provides fast completions from LSP, snippets, and filesystem paths.
3. Real-time diagnostics are visible inline and navigable via the quickfix list.
**Plans**: TBD

### Phase 3: Experience
**Goal**: Optimize the visual environment and developer workflow.
**Depends on**: Phase 1
**Requirements**: UI-01, UI-02, UI-03, NAV-01, NAV-02, EDIT-04
**Success Criteria**:
1. `snacks.picker` enables extremely fast fuzzy search for files and text.
2. UI enhancements (messages, cmdline) are unified via `noice.nvim`.
3. Git integration shows status and line changes (hunks) in the sign column.
**Plans**: TBD

### Phase 4: Optimization
**Goal**: Ensure peak performance and consistent code quality.
**Depends on**: Phase 2, Phase 3
**Requirements**: CORE-03, EDIT-02
**Success Criteria**:
1. Neovim startup time is consistently reported under 100ms.
2. Auto-formatting via `conform.nvim` is triggered on save for all defined languages.
**Plans**: TBD

## Progress Table

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1: Foundation | 0/1 | Not started | - |
| 2: Intelligence | 0/1 | Not started | - |
| 3: Experience | 0/1 | Not started | - |
| 4: Optimization | 0/1 | Not started | - |
