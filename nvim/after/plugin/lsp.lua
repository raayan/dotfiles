local lsp = require("lsp-zero")

local function on_attach(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

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

    lsp.buffer_autoformat()
end

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
    cmd = { "/home/raayan/.cargo/bin/rust-analyzer" },
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                extraEnv = {
                    CARGO_PROFILE_RUST_ANALYZER_INHERITS = "dev",
                },
                extraArgs = { "--profile", "rust-analyzer" },
            },
        },
    },
    on_attach = on_attach,
}

lsp.preset("recommended")

lsp.ensure_installed({
    -- 'rust_analyzer',
    'lua_ls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(on_attach)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
