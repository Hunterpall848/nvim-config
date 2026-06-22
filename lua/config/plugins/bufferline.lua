-- https://github.com/akinsho/bufferline.nvim

-- keymaps
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        vim.cmd("BufferLineGoToBuffer " .. i)
    end, { desc = "Jump to buffer " .. i })
end

--config
return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                mode = "buffers",
                numbers = function(opts)
                    return opts.raise(opts.ordinal)
                end,
                diagnostics = "nvim_lsp",
                show_buffer_close_icons = false,
                show_close_icon = false,
                separator_style = "slant",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        text_align = "center",
                        highlight = "Directory",
                        separator = true,
                    },
                },
            },
        },
    },
}
