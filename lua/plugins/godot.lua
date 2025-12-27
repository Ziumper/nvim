return {
  "neovim/nvim-lspconfig", -- tylko jako dependency
  ft = { "gd", "gdscript", "gdshader" },
  config = function()
    local capabilities =
      require("cmp_nvim_lsp").default_capabilities()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "gd", "gdscript" },
      callback = function(args)
        vim.lsp.start({
          name = "godot",
          cmd = { "nc", "localhost", "6005" },
          root_dir = vim.fs.dirname(
            vim.fs.find({ "project.godot" }, {
              upward = true,
              path = args.file,
            })[1]
          ),
          capabilities = capabilities,
        })
      end,
    })
  end,
}
