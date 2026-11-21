-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("pyright")
      vim.lsp.enable("jdtls")
      vim.lsp.enable("ansiblels")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("bashls")

      -- common LSP keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition)
      vim.keymap.set("n", "gr", vim.lsp.buf.references)
      vim.keymap.set("n", "K", vim.lsp.buf.hover)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
    end,
  },
}
