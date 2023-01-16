local null_ls = require("null-ls")

-- override shellcheck on PATH if installed in /usr/local/bin/shellcheck
local shfmt_path = "shellcheck"
if vim.fn.filereadable("/usr/local/bin/shellcheck") == 1 then
  shfmt_path = "/usr/local/bin/shellcheck"
end

-- override black with cblack if available
local black_path = "black"
local black_args = {}
if vim.fn.filereadable(vim.fn.expand("~/Library/Python/3.8/bin/cblack")) == 1 then
  black_path = vim.fn.expand("~/Library/Python/3.8/bin/cblack")
  black_args = { "--line-length=100" }
end


local sources = {
  null_ls.builtins.formatting.black.with({
    command = black_path,
    extra_args = black_args,
  }),
  null_ls.builtins.formatting.isort,
  null_ls.builtins.formatting.shfmt.with({
    extra_args = { "-i", vim.opt.shiftwidth:get(), "-ci" }
  }),
  null_ls.builtins.diagnostics.shellcheck.with({
    command = shfmt_path,
    diagnostics_format = "[#{c}] #{m}"
  }),
}

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = True }")
  end
end

null_ls.setup({
  sources = sources,
  on_attach = on_attach,
  debug = true,
})
