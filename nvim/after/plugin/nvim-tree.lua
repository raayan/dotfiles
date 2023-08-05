require("nvim-tree").setup()

vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "<leader>to", vim.cmd.NvimTreeToggle)
