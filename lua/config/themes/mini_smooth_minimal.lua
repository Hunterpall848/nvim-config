

local colors = {
    black = "#080808",
    eggshell = "#EDEDED",
    white = "#FAFAFA",
    violet = "#B4BEFE",
    gray = "#373854",
    green = "#22611E",
    red = "#A62B41",
    yellow = "#EDDF66"
}

local theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.eggshell, bg = colors.gray },
        c = { fg = colors.white },
    },
    insert = {
        a = {  fg = colors.black, bg = colors.white }
    },
    visual = {
        a = {  fg = colors.eggshell, bg = colors.green }
    },
    replace = {
        a = {  fg = colors.eggshell, bg = colors.red }
    },
    command = {
        a = {  fg = colors.black, bg = colors.yellow }
    },
    inactive = {
        a = {  fg = colors.white, bg = colors.black },
        b = {  fg = colors.white, bg = colors.black },
        c = {  fg = colors.white }
    },
}

local os_list = {
    Darwin = "",
    Windows = "",
    Linux = ""
}

return {
    options = {
        globalstatus = true, -- ensures status bar is not on split windows
        theme = theme,
        component_separators = '',
        section_separators = { left = '', right = ''}
        },

    sections = {
        lualine_a = {
            {
            "mode",
            seperator =
                { left = ' ' },
                right_padding = 2
            },
        },
        lualine_b = {
            "lsp_status",
        },
        lualine_c = {
            "filename",
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
        lualine_x = {
            {
                -- loads os glyph
                function ()
                    for key in pairs(os_list) do
                        if vim.uv.os_uname().sysname == key then
                            return os_list[key]
                        end
                    end
                    return "?"
                end
            },
            "filetype",
        },
        lualine_z = {
            {
               "tabs",
                mode = 2,
            },
        },
    },
}
