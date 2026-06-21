-- https://github.com/mason-org/mason.nvim
-- https://github.com/mason-org/mason-lspconfig.nvim
-- https://github.com/neovim/nvim-lspconfig

-- manages package installations
return {
    {
        "mason-org/mason.nvim",
        -- i.e., loads at starttime.
        lazy = false,
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    {
        -- configures individual lsp behaviors 
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function ()
           vim.diagnostic.config({
                underline = {
                    severity = {
                        min = vim.diagnostic.severity.WARN,
                    },
                },
            })
            vim.lsp.config ( "lua_ls", {
                settings = {
                    Lua = {
                        diagnostics = {
                            -- adds globals to list of valid globals
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,
    },

    {
        -- connects language servers to installed mason tools
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "lua_ls",  -- lua
                "pyright", -- python
                "html",    -- html
                "cssls",   -- css
                "ts_ls",   -- js/ts
            },
            auto_enable = true,
        },
        dependencies = {
            {"mason-org/mason.nvim", opts = {} },
             "neovim/nvim-lspconfig",
        },
    },
}

-- diagnostics

