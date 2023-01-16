vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

vim.opt_global.shortmess:remove("F")

autocm BufWritePre *.py lua vim.lsp.buf.format({ async = True})


