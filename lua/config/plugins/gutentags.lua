-- vim-gutentags (vimscript; sourced by vim.pack.add). The vim.g.gutentags_*
-- settings live in the loader (init.lua) since gutentags reads them at source
-- time. Here we only do the post-load side effects, deferred off startup.
vim.schedule(function()
    vim.fn.system("mkdir -p " .. vim.fn.stdpath("cache") .. "ctags")
    vim.cmd([[command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')]])
end)
