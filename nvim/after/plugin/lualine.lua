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
