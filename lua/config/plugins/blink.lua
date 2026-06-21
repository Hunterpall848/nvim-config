-- https://github.com/saghen/blink.cmp

return {
    "saghen/blink.cmp",
    -- provides snippet reference for the snippet source.
    dependencies = {"rafamadriz/friendly-snippets"},
    version = "1.*",

    -- default, super-tab, enter, none, ==> https://cmp.saghen.dev/installation for docs.
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = { preset = "default" },

        -- Font appearance
        appearance = {
            nerd_font_variant = "mono"
        },

        -- show the documentation popup after a 2.5 sec delay 
        completion = {
                menu = {
                    border = "rounded",
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 2500,
                window = {
                    border = "double",
                },
            },
        },

        -- See docs.
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- fuzzy matcher type. See docs.
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extended = { "sources.default" }
}
