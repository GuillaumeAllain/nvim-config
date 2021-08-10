require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 2;
    preselect = 'enable';
    throttle_time = 100;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
        path = true;
        buffer = {filetypes = {'codev'}};
        calc = false;
        vsnip = {
            priority = 1000,
        };
        nvim_lsp = true;
        nvim_lua = true;
        spell = {filetypes = {'pandoc','markdown','tex'}};
        tags = {filetypes = {'pandoc','markdown','tex'}};
        snippets_nvim = false;
        treesitter = false;
        omni = {filetypes = {'tex','markdown','pandoc'}};
        ultisnips = false;
        latex_symbols = {priority=500,filetypes={"markdown","latex","pandoc"}};
    };
}
