return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      debug = false,
      show_help = true,
      prompts = {
        Explain = {
          prompt = "Explain how the following code works.",
        },
        Review = {
          prompt = "Review the following code and provide suggestions for improvement.",
        },
        Tests = {
          prompt = "Generate unit tests for the following code.",
        },
        Refactor = {
          prompt = "Refactor the following code to improve clarity and readability.",
        },
      },
    },
    keys = {
      {
        "<leader>cp",
        function()
          require("CopilotChat.integrations.telescope").pick()
        end,
        desc = "Copilot Chat Prompt Picker",
      },
      {
        "<leader>cc",
        function()
          local input = vim.fn.input("Copilot Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Copilot Chat Input",
      },
      {
        "<leader>cv",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Copilot Chat Toggle",
      },
      {
        "<leader>cs",
        ":CopilotChatSave<CR>",
        desc = "Copilot Chat Save",
      },
      {
        "<leader>ci",
        function()
          local input = vim.fn.input("Explain: ")
          if input ~= "" then
            require("CopilotChat").explain(input)
          end
        end,
        desc = "Copilot Chat Explain",
      },
      {
        "<leader>ce",
        function()
          require("CopilotChat").explain()
        end,
        desc = "Copilot Explain Code",
      },
      {
        "<leader>ct",
        function()
          require("CopilotChat.integrations.tests").run()
        end,
        desc = "Copilot Chat Generate Tests",
      },
      {
        "<leader>cr",
        function()
          require("CopilotChat.integrations.codeium").run()
        end,
        desc = "Copilot Chat Refactor",
      },
    },
  },
}
