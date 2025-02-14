return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					go = { "goimports", "gofmt" },
					javascript = { { "prettierd", "prettier" } },
					rust = { "rustfmt" },
					terraform = { "terraform-fmt" },
				},
				format_on_save = {
					timeout_ms = 1000,
					lsp_fallback = true,
				},
			})
		end,
	},
}
