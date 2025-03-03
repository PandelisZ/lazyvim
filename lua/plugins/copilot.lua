return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      model = "gpt-4o",
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
          prompt = "Refactor the following code to improve readability and efficiency.",
        },
      },
    },
    keys = {
      {
        "<leader>cc",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat",
      },
      {
        "<leader>ce",
        function()
          require("CopilotChat.prompts").explain()
        end,
        desc = "Explain code",
      },
      {
        "<leader>cr",
        function()
          require("CopilotChat.prompts").review()
        end,
        desc = "Review code",
      },
      {
        "<leader>ct",
        function()
          require("CopilotChat.prompts").tests()
        end,
        desc = "Generate tests",
      },
      {
        "<leader>cf",
        function()
          require("CopilotChat.prompts").refactor()
        end,
        desc = "Refactor code",
      },
      {
        "<leader>cp",
        ":CopilotChatPrompt ",
        desc = "Custom Copilot Chat prompt",
        mode = { "n", "v" },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end,
  },
}
