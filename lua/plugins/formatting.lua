return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "ruff_fix", "ruff_format" },
      },
      formatters = {
        ruff_fix = {
          prepend_args = { "--config", 'lint.extend-safe-fixes = ["F841"]' },
        },
      },
    },
  },
}
