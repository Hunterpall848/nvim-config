-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/MunifTanjim/nui.nvim
-- https://github.com/nvim-lua/plenary.nvim
-- https://github.com/nvim-tree/nvim-web-devicons

-- custom mappings
vim.keymap.set ("n","<leader>ft", function ()
    vim.cmd (":Neotree toggle")
end, {desc = "Opens file tree"})

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false,
    opts = {
        window = {
            position = "left",
            width = 30
        },
    },
}
