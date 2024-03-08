


return {
  "neoclide/coc.nvim", branch = "release",
  config = function()
    -- Basic key mappings for coc.nvim functionality
    local map = vim.api.nvim_set_keymap

    -- Use Tab for trigger completion with characters ahead and navigate
    -- NOTE: There's always a completion item selected by default, you may want to enable
    -- no select by setting `"suggest.noselect": true` in your configuration file
    -- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
    -- other plugins before putting this into your config
    local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

    -- Sets TAB to confirm the autocomplete
    --map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#confirm() : v:lua.check_back_space()  ? "<TAB>" : coc#refresh()', opts)
    -- TAB move selection
    map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
    map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
    -- Sets CR to confirm the autocomplete
    map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
    
    local opts = { noremap = true, silent = true }


    -- GoTo code navigation.
    map('n', 'gd', '<Plug>(coc-definition)', opts)
    map('n', 'gy', '<Plug>(coc-type-definition)', opts)
    map('n', 'gi', '<Plug>(coc-implementation)', opts)
    map('n', 'gr', '<Plug>(coc-references)', opts)

    -- Symbol renaming.
    map('n', '<leader>rn', '<Plug>(coc-rename)', opts)

    -- Code actions.
    map('n', '<leader>ac', '<Plug>(coc-codeaction)', opts)
    map('x', '<leader>ac', '<Plug>(coc-codeaction-selected)', opts)

    -- Diagnostics navigation.
    map('n', '[g', '<Plug>(coc-diagnostic-prev)', opts)
    map('n', ']g', '<Plug>(coc-diagnostic-next)', opts)

    -- Documentation.
    map('n', 'K', '<Cmd>call CocActionAsync("doHover")<CR>', opts)

    -- Install desired coc extensions here. Use coc's :CocInstall command
    -- Note: This is an asynchronous operation and might not complete immediately
    -- vim.cmd [[
    --           silent! CocInstall coc-tsserver coc-eslint coc-json coc-html coc-css
    --           ]]
  end
}


