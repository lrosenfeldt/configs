local builtin = require'telescope.builtin'

-- search git files if possible, search all files as fallback
vim.keymap.set('n', '<C-P>', function()
    builtin.find_files { hidden = true }
end, { desc = 'Search files (respects .gitignore).'})

vim.keymap.set('n', '<leader>pf', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = '' })

vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = '[v]iew [h]elp tags' })
vim.keymap.set('n', '<leader>vk', builtin.keymaps, { desc = '[v]iew [k]maps' })

