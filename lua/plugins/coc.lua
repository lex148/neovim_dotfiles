


return {
  "neoclide/coc.nvim", branch = "release",
  config = function()
    -- Basic key mappings for coc.nvim functionality
    local map = vim.api.nvim_set_keymap
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


