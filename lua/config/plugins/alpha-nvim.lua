-- https://github.com/goolord/alpha-nvim
-- https://github.com/nvim-tree/nvim-web-devicons

return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

    opts = function()
        local timer = (require("config.nvim-timer"))
        local dashboard = (require("alpha.themes.dashboard"))

        dashboard.config.layout = {
            {type = "padding", val = 12},
            dashboard.section.header,
            {type = "padding", val = 3},
            dashboard.section.buttons,
            {type = "padding", val = 1},
            dashboard.section.footer,
        }

        -- ensure randomization across sessions
        math.randomseed(vim.uv.hrtime())
        -- count by character rather than bytes
        local charhl_to_bytehl = require("alpha.utils").charhl_to_bytehl


        -- header section --
        dashboard.section.header.val = {
            "═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════",
            "                                                                                                                   ",
            "█▀▀▀▀▀▀▀▀▀▄   ▄▀▀▀▀▀▀▀▀▀█  ▄▀▀▀▀▀▀▀▀▄  █▀▀▀▀█ ▓▀▀▀█ █▀▀▀▀█ █▀▀▀▀▀▀▀▀▀▄▀▀▀▀▀▄  █▀▀▀▀▀▀▀▀▀▄▀▀▀▀▀▄  █▀▀▀▀▀▀▀▀▀▄▀▀▀▀▀▄ ",
            "█ ✦  ▄▄    █ █·  ₊▄▄▄▄▄▄█ █    ▄▄ .  █ █    ▓ ▒.  █ █  ✧ ▓ █ ⋆˙ ▄▄  ✶  ▄ ✴︎  █ █    ▄▄     ▄    █ █✦   ▄▄     ▄    █",
            "▓    ▓ ▌   ▓ ▓  . ▓▄▄▄▄▄▄ ▓ ✧  ▓ ▌   ▓ ▓    ▓ ▒   ▓ ▓ ✦  ▓ ▓ ✮  ▓ ▌   ▓ ▌   ▓ ▓    ▓ ▌   ▓ ▌   ▓ ▓    ▓ ▌   ▓ ▌   ▓",
            "▒    ▒ ▒ · ▒ ▒ ∙  ▄▄▄▄▄▄▒ ▒  · ▒ ▓   ▒ ▒  · ▒ ▓   ▒ ▒   ·▒ ▒    ▒ ▒ · ▒ ▒ · ▒ ▒    ▒ ▒ · ▒ ▒ · ▒ ▒    ▒ ▒ · ▒ ▒ · ▒",
            "░   ∙░ ░   ░ ░ ₊ ⊹░▄▄▄▄▄▄ ░    ░▄░·. ░ ░    ░▄░·. ░ ░ .✮ ░ ░   ∙░ ░   ░ ░   ░ ░   ∙░ ░   ░ ░   ░ ░   ∙░ ░   ░ ░   ░",
            "█ ∙  █ █   █ █  ✧ .  ⋆ ·█ █ ✦ .  ✧   █ █   .      █ █ ✧  █ █ ∙  █ █ ✧˖█ █   █ █ ∙  █ █ ✦ █ █   █ █ ∙  █ █   █ █ ✦ █",
            "█▄▄▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄▄▄▄█  ▀▄▄▄▄▄▄▄▄▀   ▀▄▄▄▄▄▄▄▄▀  █▄▄▄▄█ █▄▄▄▄█ █▄▄▄█ █▄▄▄█ █▄▄▄▄█ █▄▄▄█ █▄▄▄█ █▄▄▄▄█ █▄▄▄█ █▄▄▄█",
            "                                                                                                                   ",
            "═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════",
        }

        -- define colors
        local colors = {
            yellow = "#d1be2c",
            blue_deep = "#0000A3",
            blue_bright = "#5555F6",
            space_purple = "#3a076e",
            white = "#FFFFFF",
            light_gray = "#D9D9D9",
            silver = "#B3B3B3",
            medium_gray = "#8C8C8C",
            dark_gray = "#666666",
            charcoal = "#404040",
            near_black = "#303030",
        }
        for name, color in pairs(colors) do
            vim.api.nvim_set_hl(0, name, { fg = color })
        end

        local grayscale = {
            "white",
            "light_gray",
            "silver",
            "medium_gray",
            "dark_gray",
            "charcoal",
            "near_black",
        }

        -- color layout
        local highlights = {
            {
                {"white",0,115},
            },
            {
            },
            {
                {"white",0,12},
                {"blue_bright",12,39},
                {"near_black",39,52},
                {"blue_bright",52,115},
            },
            {
                {"light_gray",0,12},
                {"blue_bright",12,39},
                {"charcoal",39,52},
                {"blue_bright",52,115},
            },
            {
                {"silver",0,12},
                {"blue_bright",12,39},
                {"dark_gray",39,52},
                {"blue_bright",52,115},
            },
            {
                {"medium_gray",0,12},
                {"blue_bright",12,39},
                {"medium_gray",39,52},
                {"blue_bright",52,115},
            },
            {
                {"dark_gray",0,12},
                {"blue_bright",12,39},
                {"silver",39,52},
                {"blue_bright",52,115},
            },
            {
                {"charcoal",0,12},
                {"blue_bright",12,39},
                {"light_gray",39,52},
                {"blue_bright",52,115},
            },
            {
                {"near_black",0,12},
                {"blue_bright",12,39},
                {"white",39,52},
                {"blue_bright",52,115},
            },
            {
            },
            {
                {"white",0,115},
            },
        }

        -- builds gray gradient line
        local function grayline (chng_x, row)
            local x = 0
            local width = chng_x
            for col = #grayscale, 1, -1 do
                local location = 115-x
                if col == 1 then
                    width = 7
                end
                local highlight = {
                    grayscale[col],
                    location - width,
                    location,
                }
                table.insert(highlights[row],highlight)
                    x = x + chng_x
            end
        end


        -- uses grayline to build gray gradient block
        for row = 9, 3, -1 do
            grayline (5, row)
        end

        -- uses grayline to gradient upper and lower lines
        grayline (16, 1)
        grayline (16, 11)

        -- returns random color highlight and range
        local function add_random_sparkles(row, count)
            for _ = 1, count do
                local start_col = math.random(54, 56)

                table.insert(highlights[row], {
                    "yellow",
                    start_col,
                    start_col + 1,
                })
            end
        end
        for row = 4, 8 do
            add_random_sparkles(row, math.random(1, 3))
        end

        -- color sections function
        dashboard.section.header.opts.hl = charhl_to_bytehl(highlights, dashboard.section.header.val)

        -- button table --
        local function seperator ()
            return {
                type = "text",
                val = "⛊ ════════════════════════════════════════════════════════════════ ⛊",
                opts = {
                    position = "center",
                    hl = "gray",
                },
            }
        end

        local function seperator2 ()
            return {
                type = "text",
                val = "════════════════════════════════════════════════════════",
                opts = {
                    position = "center",
                    hl = "blue_bright",
                },
            }
        end

        dashboard.section.buttons.val = {
            seperator(),
            seperator2(),
            dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
            dashboard.button("r", "󰱼  Recent files", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("c", "⚙  Configurations", "<cmd>edit ~/.config/nvim<CR>"),
            dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
            dashboard.button("q", "󰗼  Quit", "<cmd>qa<CR>"),
            seperator2(),
            seperator(),
        }

        -- footer section --
        dashboard.section.footer.val = "Time spent 𐌔𐌌𐌀𐌔𐋅𐌉𐌍Ᏽ 𐌊𐌄𐌙𐌔 in Neovim: " .. timer[1]

        dashboard.section.footer.opts = {
            hl = "white",
            position = "center",
        }
        return dashboard.config
    end,
    },
}
