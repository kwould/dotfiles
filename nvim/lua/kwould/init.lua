vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt_global.shortmess:remove("F")

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {"*.go"},
	command = "lua vim.lsp.buf.format()",
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {"*.py"},
	command = "lua vim.lsp.buf.format()",
})



-- function! OpenInGH()
--     let prefix = "https://github.com/"
--     let full_filepath = expand('%:p')
--     let repo = split(full_filepath, "/")[3]
--     let filename = join(split(full_filepath, "/")[4:], "/")
--     let lineNumber = "\\#L" . line(".")
-- 		let gitBranch = trim(system("git rev-parse --abbrev-ref HEAD"))
--     let filler = "/blob/"
-- 		let configurl = $WORK_GH_URL
--     let url = prefix . configurl ."/". repo . filler . gitBranch . "/" . filename . lineNumber
-- 		echo url
--     silent exec "!open '" . url . "'"
-- endfunction
local M {}

M.search_source_repo = function()
	local prefix = "https://github.com"
	local full_filepath = vim.fn.expand('%:p')
	local repo = string.gmatch(full_filepath, "/")[4]
	local filename = table.concat(string.gmatch(full_filepath, "/")[5:], "/")
	local lineNumber = vim.fn.line(.)
	local gitBranch = "master"
	local configurl = os.getenv("WORK_GH_URL")
	local url = string.format("%s/%s/blob/%s/%s#L%s", prefix, configurl, repo, gitBranch, filename, lineNumber)
	vim.fn.exec("!open %s", url)
end

