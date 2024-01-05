local builtin = require 'telescope.builtin'
local utils = require 'telescope.utils'

-- search git files if possible, search all files as fallback
vim.keymap.set('n', '<C-P>', function()
    builtin.find_files { hidden = true }
    local _, ret, _ = utils.get_os_command_output { 'git', 'rev-parse', '--is-inside-work-tree' }
    if ret == 0 then
        builtin.git_files()
    else
        builtin.find_files { hidden = true }
    end
end, { desc = 'Search [p]roject files.' })

-- find_files respects .gitignore but will still search .git, if hidden is true
vim.keymap.set('n', '<leader>pf', function()
    builtin.find_files { hidden = true }
end, { desc = 'Find [f]iles' })

vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Find grep [s]string' })

vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = '[v]iew [h]elp tags' })
vim.keymap.set('n', '<leader>vk', builtin.keymaps, { desc = '[v]iew [k]maps' })
