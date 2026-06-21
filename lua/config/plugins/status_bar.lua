-- https://github.com/SmiteshP/nvim-navic
-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/nvim-tree/nvim-web-devicons

-- keymaps
for i = 1, 9 do
    -- if open buffers 
    vim.keymap.set ("n","<leader>" .. i, function ()
        vim.cmd ("LualineBuffersJump! " .. i )
    end, {desc = "Jumps to buffers depending on int input"})
end

-- configs
return {
    {
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        opts = {
            lsp = {
                auto_attach = true,
            },
        },
    },

    -- lualine config
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = require("config.themes.smooth_minimal")
    },
}
