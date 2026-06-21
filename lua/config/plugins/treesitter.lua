-- https://github.com/nvim-treesitter/nvim-treesitter

return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
    -- language parsers 
    config = function () require("nvim-treesitter").install({
    "lua",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "json",
    "bash",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "c",
    "cpp",
    "rust",
    "go",
    "java",
    "ruby",
    "php",
    "c_sharp",
    "kotlin",
    "swift",
    "zig",
    })
end,
}
