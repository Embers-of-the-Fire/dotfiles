vim.keymap.set({'n', 'v'}, '?', function()
    vim.diagnostic.open_float({ focusable = true }) end,
    { desc = "Expand an Error into a float" }
)
