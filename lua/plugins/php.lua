local disabled = {
  {
    -- Set Laravel Pint as the default PHP formatter with PHP CS Fixer as a fall back.
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        php = { "pint" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = {},
        prettier_d = {},
      },
    },
  },
}
return {}
