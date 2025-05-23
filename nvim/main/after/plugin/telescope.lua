if vim.g.vscode then
  return
end

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})
vim.keymap.set('n', '<C-p', builtin.git_files, {})
vim.keymap.set('n', '<leader>/', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
