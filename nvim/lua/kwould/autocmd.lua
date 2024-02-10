local id = vim.api.nvim_create_augroup("MyGroup", {
			clear = true 
})
local format_function = function() vim.lsp.buf.format() end
vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = "*.go",
	group = id,
	callback = format_function,
})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = "*.rs",
	group = id,
	callback = format_function,
})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
	pattern = "*.py",
	group = id,
	callback = format_function,
})

