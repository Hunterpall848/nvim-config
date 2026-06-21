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

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                globalstatus = true, -- ensures status bar is not on split windows
                theme = require("config.themes.bubbles"),
                component_separators = '',
                section_separators = { left = '', right = ''}
        },
            sections = {
                lualine_a = {
                    {"mode", seperator = { left = ' ' }, right_padding = 2},
                },
                lualine_b = {
                    {"lsp_status"},
                },
                lualine_c = {
                    {"filename"},
                    {
                        function()
                            -- ==> returns location of cursor
                            return require("nvim-navic").get_location()
                        end,
                        cond = function()
                            -- returns boolean value
                            return require("nvim-navic").is_available()
                        end,
                    },
                },
            },

        tabline = {
                lualine_a = {
                    {
                    'buffers',
                     mode = 2,
            },
        },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {'branch'},
                lualine_z = { function ()
                  return '➇ ❹ ➇'
                end }
            }
        },
    },
}
