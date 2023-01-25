local packer_group = vim.api.nvim_create_augroup("Packer", { clear = true })
vim.api.nvim_create_autocmd(
  "BufWritePost",
  { command = "source <afile> | PackerCompile", group = packer_group, pattern = "plugins.lua" }
)

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end
vim.api.nvim_command("packadd packer.nvim")
-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("kwould/%s")', name)
end

return require('packer').startup(function()
  use ({
  "folke/trouble.nvim",
  requires="kyazdani42/nvim-web-devicons",
  config=get_setup("trouble") 
  })
  use({
    "folke/lsp-colors.nvim",
    config=get_setup("colors"),
  })
  -- metals
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- dap
  use ({'mfussenegger/nvim-dap', config=get_setup("dap")})

  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, config=get_setup("dap-ui")}
  use ({'theHamsta/nvim-dap-virtual-text', config=get_setup("dap-virtual-text")})
  --python-debuger
  use 'mfussenegger/nvim-dap-python'
  --colorscheme
  use { "ellisonleao/gruvbox.nvim" }
  --   null-ls
  use ({ 
    "jose-elias-alvarez/null-ls.nvim", 
    config=get_setup("null-ls")
  })
  -- use ({
  -- 'lewis6991/gitsigns.nvim',
  -- config = get_setup("gitsigns"),
  -- })
  use({
      "windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })
    --
    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      requires = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
      config = get_setup("telescope"),
    })
    -- lspconfigs 
    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    use {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup()
  end
    }
    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup_ts_grammar{}
end
}
    -- completion stuff
    use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
    use({
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  },
    config = get_setup("lsp"),
  })
  use ({
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
      })
end)

