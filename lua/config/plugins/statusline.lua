-- https://github.com/SmiteshP/nvim-navic
-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/nvim-tree/nvim-web-devicons

-- themes (can update with whatever themes you want)
-- full contains a lualine made bufferbar
local full = require("config.themes.smooth_minimal")
-- mini does not have a lualine made bufferbar - bufferline.nvim will handle
local mini = require("config.themes.mini_smooth_minimal")

-- functions
local function bufferlinechk ()
    local plugincheck = pcall(require, "bufferline")
    if plugincheck then
        return true
    else
        return false
    end
end

-- builds bufferjump keymaps
local function bufferjumps ()
    for i = 1, 9 do
        vim.keymap.set ("n","<leader>" .. i, function ()
            vim.cmd ("LualineBuffersJump! " .. i )
        end, {desc = "Jumps to buffers depending on int input"})
    end
end

-- config
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
        opts = function ()
            local check = bufferlinechk()
            if check then
                return mini
            else
                bufferjumps()
                return full
            end
        end
    },
}
