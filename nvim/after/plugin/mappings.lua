
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Splits
map("n", "<Leader>vs", ":vsplit")
map("n", "<Leader>hs", ":split")

--Ex
map("n", "<Leader>el", ":Ex")

local Remap = require("kwould.keymap")

local nnoremap = Remap.nnoremap
-- Telescope
nnoremap("<Leader>ff", function()
    require('telescope.builtin').find_files()
end)
nnoremap("<Leader>fb", function()
    require('telescope.builtin').buffers()
end)
nnoremap("<Leader>fg", function()
    require('telescope.builtin').live_grep()
end)
nnoremap("<Leader>fh", function()
    require('telescope.builtin').help_tags()
end)

-- Lua
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>TroubleToggle", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "sd", "<cmd>vim.diagnostic.open_float()<cr>",
  {silent = true, noremap = true}
)

-- Dap
nnoremap("<Leader>db", function()require("dap").toggle_breakpoint()end)
nnoremap("<Leader>dc", function()require("dap").continue()end)
nnoremap("<Leader>do", function()require("dap").step_over()end)
nnoremap("<Leader>di", function()require("dap").step_into()end)
nnoremap("<Leader>dr", function()require("dap").repl.open()end)
nnoremap("<Leader>duo", function()require("dapui").open()end)
nnoremap("<Leader>duc", function()require("dapui").close()end)
--Python-dap
nnoremap("<Leader>dt", function()require("dap-python").test_method()end)
nnoremap("<Leader>dtc", function()require("dap-python").test_class()end)

--diagnostics
nnoremap("<Leader>g?", function()vim.diagnostic.open_float()end)

--telescope
nnoremap("<Leader>vrc", function()
  require('kwould.telescope').search_dotfiles({hidden = true})
end)
nnoremap("<Leader>cds", function()
  require('kwould.telescope').search_scratch({hidden = true})
end)
