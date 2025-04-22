return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "golangci-lint",
        --"intelephense",
        --"phpstan",
        --"pint",
        "tailwindcss-language-server",
        "buf",
      },
    },
  },
}
