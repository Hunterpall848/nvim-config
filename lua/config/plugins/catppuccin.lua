-- https://github.com/catppuccin/nvim

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
            })

            vim.cmd.colorscheme("catppuccin")

            vim.api.nvim_set_hl(0, "WinSeparator", {
                fg = "#2A344A",
            })

            vim.api.nvim_set_hl(0, "NeoTreeNormal", {
                bg = "#1f1f26",
            })

            vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {
                bg = "#1f1f26",
            })
        end,
    },
}
