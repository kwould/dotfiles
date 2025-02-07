return {{
  "stevearc/conform.nvim",
  event = {"BufReadPre", "BufNewFile"},
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        go = { "gofumpt", "goimports-reviser" },
        rust = { "rustfmt" },
        terraform = { "terraform-fmt" },
      },
      formatters = {
        gofumpt = {
        command = "gofumpt",
        args = {"$FILENAME"},
        },
      },
      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    })
  end
}}
