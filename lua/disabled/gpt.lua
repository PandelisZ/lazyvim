local wk = require("which-key")

wk.add({
  { "<leader>c", group = "ChatGPT" },
  { "<leader>cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
  {
    mode = { "n", "v" },
    { "<leader>cd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
    { "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
    { "<leader>cf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
    { "<leader>cg", "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
    { "<leader>ck", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
    { "<leader>cl", "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
    { "<leader>cm", "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
    { "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
    { "<leader>cr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
    { "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
    { "<leader>ct", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
    { "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
  },
})

return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  config = function()
    require("chatgpt").setup({
      api_key_cmd = "echo $PZ_OPEN_AI_KEY",
      popup_layout = {
        default = "right",
        center = {
          width = "80%",
          height = "80%",
        },
        right = {
          width = "40%",
          width_settings_open = "50%",
        },
      },
      edit_with_instructions = {
        keymaps = {
          use_output_as_input = "<C-r>",
        },
      },
      chat = {
        keymaps = {
          select_session = "<C-e>",
        },
      },
    })
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "folke/trouble.nvim",
    "nvim-telescope/telescope.nvim",
  },
}
