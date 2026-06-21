-- https://github.com/folke/lazy.nvim

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim\n", "ErrorMsg" },
            { "Press any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

-- Add lazy.nvim to Neovim's runtime path
vim.opt.rtp:prepend(lazypath)


-- Setup plugins
require("lazy").setup({
    spec = {
        { import = "config.plugins" }, -- Loads every plugin found in .config/plugins
    },
    install = {
        colorscheme = { "catppuccin", "habamax" },
    },
    checker = {
        enabled = true,
    },
})
