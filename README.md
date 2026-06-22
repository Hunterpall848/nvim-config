# Neovim Configuration

A personal Neovim setup written in Lua and managed with `lazy.nvim`.
- LSP managed with `mason` based plugins.

## Core Files

- `init.lua` contains general Neovim options, keymaps, and startup configuration.
- `lua/config/lazy.lua` bootstraps `lazy.nvim` and imports plugin specs.
- `lua/config/plugins/` contains individual plugin configurations.
- `lua/config/themes/` contains local Lualine theme and layout modules.

## Plugins

| Plugin | Purpose |
| --- | --- |
| `lazy.nvim` | Plugin manager |
| `blink.cmp` | Completion menu, snippets, documentation, and signature help |
| `bufferline.nvim` | Buffer bar and buffer navigation |
| `catppuccin` | Main colorscheme |
| `lazydev.nvim` | Lua support for Neovim and plugin APIs |
| `lualine.nvim` | Statusline |
| `mason.nvim` | Language server installer |
| `mason-lspconfig.nvim` | Connects Mason-installed servers to Neovim LSP |
| `nvim-lspconfig` | Language server configuration |
| `neo-tree.nvim` | File explorer |
| `nvim-navic` | Code-location breadcrumbs |
| `nvim-treesitter` | Syntax-aware highlighting and code structure |
| `telescope.nvim` | File, text, buffer, help, and symbol search |
| `smear-cursor.nvim` | Cursor animation |
| `nvim-web-devicons` | File and UI icons |

## External Requirements

This setup uses Neovim, Git, a Nerd Font, and external tools such as `ripgrep`, `fd`, Node/npm, and the Tree-sitter CLI.
