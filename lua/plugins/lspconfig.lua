return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {
        settings = {
          workingDirectories = { mode = "auto" },
        },
      } },
      inlay_hints = { enabled = false },
      setup = {
        rust_analyzer = function()
          return true
        end,
        prettierd = function()
          return false
        end,
        prettier = function()
          return false
        end,
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { "<leader>vs", "<cmd>VenvSelect<cr>" },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
    },
  },
}
