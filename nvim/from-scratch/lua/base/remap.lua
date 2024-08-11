vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- helpful commands
-- print config
vim.keymap.set("n", "<leader>getc", ":echo stdpath('config')<cr>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Explore)

-- archaic telescope
-- vim.keymap.set("n", "<leader><leader>", ":vnew | r!find . -regex .+.+<Left><Left>")
-- vim.keymap.set("n", "<leader>o", "yy:<C-u>e <C-r>\"", {noremap = true})

vim.keymap.set("n", "<leader>%", "ggVG")
vim.keymap.set("n", "-", "@z")
