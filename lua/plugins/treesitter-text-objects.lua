return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "php",
      "gdscript",
      "json",
      "yaml",
      "bash",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

