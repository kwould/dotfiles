vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt_global.shortmess:remove("F")

print("called")

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = {"*.py"},
-- 	callback = vim.lsp.buf.format(),
-- })

