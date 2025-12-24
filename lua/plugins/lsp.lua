return {
  "neovim/nvim-lspconfig", -- może zostać, ale nie jest wymagany
  config = function()
    local capabilities =
      require("cmp_nvim_lsp").default_capabilities()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "php",
      callback = function(args)
        vim.lsp.start({
          name = "phpactor",
          cmd = { "phpactor", "language-server" },
          filetypes = { "php" },
          root_dir = vim.fs.root(args.buf, {
            "composer.json",
            ".phpactor.json",
            ".git",
          }),
          capabilities = capabilities,
        })
      end,
    })
  end,
}

