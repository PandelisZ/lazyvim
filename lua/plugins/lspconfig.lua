return {
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- add a keymap
      keys[#keys + 1] = { "<leader>ts", ":LspRestart<CR>", "Restart LSP" }
    end,
    opts = {
      servers = {
        astro = {},
        tailwindcss = {},
      },
    },
  },
}
