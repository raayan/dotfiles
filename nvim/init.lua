-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Basic VIM stuff before plugins F me up
vim.g.mapleader = " "

-- turn off netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- primordial remaps
vim.keymap.set("n", "<leader>H", ":bp<CR>")
vim.keymap.set("n", "<leader>L", ":bn<CR>")
vim.keymap.set("n", "<leader>bd", ":bp<bar>bd#<CR>")

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.background = "dark"
vim.cmd.colorscheme "industry"

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { 
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup()

                vim.keymap.set("n", "<leader>tf", vim.cmd.NvimTreeFindFile)
                vim.keymap.set("n", "<leader>to", vim.cmd.NvimTreeToggle)
            end,
        },
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                local builtin = require('telescope.builtin')

                vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
                vim.keymap.set('n', '<leader>tp', builtin.git_files, {})
                vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
                vim.keymap.set('n', '<leader>tt', builtin.help_tags, {})
            end,
        },
        { 
            "mbbill/undotree",
            config = function()
                vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
            end,
        },
        {
            "nvim-lualine/lualine.nvim",
            config = function()
                require('lualine').setup({
                    options = {
                        icons_enabled = false,
                        theme = '16color',
                        disabled_filetypes = {
                            statusline = { 'NvimTree' },
                            winbar = { 'NvimTree' },
                        },
                        globalstatus = false,
                    },
                    winbar = {
                        lualine_a = { 'buffers' },
                    },
                    inactive_winbar = {
                        lualine_a = { 'buffers' },
                    },
                })
            end,
        },
        { "rust-lang/rust.vim" },
        {
            "mrcjkb/rustaceanvim",
            version = "^5",
            lazy = false,
        }
    },
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})

vim.g.rustaceanvim = {
    tools = {
    },
    server = {
        on_attach = function(client, bufnr)
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>ld", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>ref", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>ren", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end,
        default_settings = {
            ['rust-analyzer'] = {
                cargo = {
                    extraEnv = {
                        CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev",
                    },
                    extraArgs = { "--profile", "rust-analyzer" },
                },
            },
        },
    },
}
