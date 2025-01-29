-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader =' '
vim.g.maplocalleader =' '
function get_setup(name)
  return string.format('require("kwould/%s")', name)
end

require('lazy').setup({
  {
    "git@github.com:folke/trouble.nvim",
    dependencies = "git@github.com:kyazdani42/nvim-web-devicons",
    config = get_setup("trouble")
  },
  {
    "git@github.com:folke/lsp-colors.nvim",
    config = get_setup("colors"),
  },
  {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  -- metals
  { 'git@github.com:scalameta/nvim-metals', dependencies = { "git@github.com:nvim-lua/plenary.nvim" } },

  -- { "git@github.com:rcarriga/nvim-dap-ui", 
  -- dependencies = { 
  --   {"mfussenegger/nvim-dap", config= get_setup("dap")},
  --   { "nvim-neotest/nvim-nio" },
  --
  -- }, 
  --   config = get_setup("dap-ui") },
  -- { 'git@github.com:theHamsta/nvim-dap-virtual-text', config = get_setup("dap-virtual-text") },
  -- --python-debuger
  -- 'git@github.com:mfussenegger/nvim-dap-python',
  --colorscheme
  { "git@github.com:ellisonleao/gruvbox.nvim" },
  {
    'git@github.com:lewis6991/gitsigns.nvim',
    config = get_setup("gitsigns"),
  },
  --
  -- telescope
  {
    "git@github.com:nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    dependencies = {
      { "git@github.com:nvim-lua/plenary.nvim" },
      { "git@github.com:nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = get_setup("telescope"),
  },
  -- lspconfigs
  -- -- dap-go
  -- { 'git@github.com:leoluz/nvim-dap-go',
  --   config = get_setup("dap-go") },
  -- treesitter
  {
    "git@github.com:nvim-treesitter/nvim-treesitter",
    config = get_setup("treesitter"),
    build = ":TSUpdate",
  },
  { 'git@github.com:nvim-orgmode/orgmode'},
  -- completion stuff
  { "git@github.com:onsails/lspkind-nvim", dependencies = { { "git@github.com:famiu/bufdelete.nvim" } } },
  {
    'git@github.com:VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'git@github.com:neovim/nvim-lspconfig' },
      { 'git@github.com:williamboman/mason.nvim' },
      { 'git@github.com:williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'L3MON4D3/LuaSnip' },
      {
        "git@github.com:windwp/nvim-autopairs",
        config = get_setup("autopairs"),
      },
    },
    config = get_setup("lsp"),
  },
  {
    "stevearc/conform.nvim",
    config = get_setup("conform")
  },
  'theprimeagen/harpoon',
  {
    "git@github.com:numToStr/Comment.nvim",
    config = function() require("Comment").setup() end,
  },
})
