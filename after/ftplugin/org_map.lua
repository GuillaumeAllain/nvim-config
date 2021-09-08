function Org_call_toggle_checkbox()
    if vim.fn.getbufline(vim.fn.bufnr("%"), vim.fn.line("."))[1]:find("^%s*-%s%b[]") then
        require("org-call.emacs_utils").interact_with_file_in_emacs("(org-toggle-checkbox)")
    end
end

-- vim.api.nvim_buf_set_keymap(
--     0,
--     "n",
--     "<leader>t",
--     ":lua require'org-call.emacs_utils'.interact_with_file_in_emacs(\"(org-todo)\")<cr>",
--     { noremap = true, silent = true }
-- )
-- vim.api.nvim_buf_set_keymap(
--     0,
--     "n",
--     "<leader>os",
--     ":lua require'org-call.org-agenda'.org_schedule()<cr>",
--     { noremap = true, silent = true }
-- )
-- vim.api.nvim_buf_set_keymap(
--     0,
--     "n",
--     "<leader>od",
--     ":lua require'org-call.org-agenda'.org_deadline()<cr>",
--     { noremap = true, silent = true }
-- )
vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<leader>#",
    ":lua require'org-call.emacs_utils'.interact_with_file_in_emacs(\"(org-update-statistics-cookies `t)\")<cr>",
    { noremap = true, silent = true }
)
vim.api.nvim_buf_set_keymap(
    0,
    "n",
    "<C-space>",
    ":lua Org_call_toggle_checkbox()<cr>",
    { noremap = true, silent = true }
)
-- vim.api.nvim_buf_set_keymap(
--     0,
--     "n",
--     "<leader><cr>",
--     "o<esc>:lua require'org-call.emacs_utils'.interact_with_file_in_emacs(\"(org-meta-return)\")<cr>A",
--     { noremap = true, silent = true }
-- )
