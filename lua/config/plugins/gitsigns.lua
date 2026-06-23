-- https://github.com/lewis6991/gitsigns.nvim

return {
    "lewis6991/gitsigns.nvim",
    opts = {
        on_attach = function(bufnr)
            local gitsigns = require("gitsigns")
            local function map(mode, keys, action, desc)
                vim.keymap.set(mode, keys, action, {
                    buffer = bufnr,
                    desc = desc,
                })
            end
            -- keymaps
            map('n', '<leader>hd', gitsigns.diffthis)
        end,
    },
}
