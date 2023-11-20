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
    "git@github.com/wbthomason/packer.nvim",
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
  "git@github.com:folke/trouble.nvim",
  requires="git@github.com:kyazdani42/nvim-web-devicons",
  config=get_setup("trouble") 
  })
  use({
    "git@github.com:folke/lsp-colors.nvim",
    config=get_setup("colors"),
  })
  -- metals
  use({'git@github.com:scalameta/nvim-metals', requires = { "git@github.com:nvim-lua/plenary.nvim" }})
  -- Packer can manage itself
  use 'git@github.com:wbthomason/packer.nvim'
  -- dap
  use ({'git@github.com:mfussenegger/nvim-dap', config=get_setup("dap")})

  use { "git@github.com:rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}, config=get_setup("dap-ui")}
  use ({'git@github.com:theHamsta/nvim-dap-virtual-text', config=get_setup("dap-virtual-text")})
  --python-debuger
  use 'git@github.com:mfussenegger/nvim-dap-python'
  --colorscheme
  use { "git@github.com:ellisonleao/gruvbox.nvim" }
  --   null-ls
  use ({ 
    "git@github.com:jose-elias-alvarez/null-ls.nvim", 
    config=get_setup("null-ls")
  })
  use ({
  'git@github.com:lewis6991/gitsigns.nvim',
  config = get_setup("gitsigns"),
  })
  use({
      "git@github.com:windwp/nvim-autopairs",
      after = "nvim-cmp",
      config = get_setup("autopairs"),
    })
    --
    -- telescope
    use({
      "git@github.com:nvim-telescope/telescope.nvim",
      module = "telescope",
      cmd = "Telescope",
      requires = {
        { "git@github.com:nvim-lua/plenary.nvim" },
        { "git@github.com:nvim-telescope/telescope-fzf-native.nvim", run = "make" },
      },
      config = get_setup("telescope"),
    })
    -- lspconfigs 
		-- dap-go
    use {'git@github.com:leoluz/nvim-dap-go', 
		config = get_setup("dap-go")}
    -- treesitter
    use({
      "git@github.com:nvim-treesitter/nvim-treesitter",
      config = get_setup("treesitter"),
      run = ":TSUpdate",
    })
    use {'git@github.com:nvim-orgmode/orgmode', config = function()
        require('orgmode').setup_ts_grammar{}
end
}
    -- completion stuff
    use({ "git@github.com:onsails/lspkind-nvim", requires = { { "git@github.com:famiu/bufdelete.nvim" } } })
    use({
	  'git@github.com:VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
	  requires = {
		  -- LSP Support
		  {'git@github.com:neovim/nvim-lspconfig'},
		  {'git@github.com:williamboman/mason.nvim'},
		  {'git@github.com:williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		 --  -- Autocompletion
		 --  {'git@github.com:hrsh7th/nvim-cmp'},
		 --  {'git@github.com:hrsh7th/cmp-buffer'},
		 --  {'git@github.com:hrsh7th/cmp-path'},
		 --  {'git@github.com:saadparwaiz1/cmp_luasnip'},
		 --  {'git@github.com:hrsh7th/cmp-nvim-lsp'},
		 --  {'git@github.com:hrsh7th/cmp-nvim-lua'},
			--
		 --  -- Snippets
		 --  {'git@github.com:rafamadriz/friendly-snippets'},
			-- {'git@github.com:L3MON4D3/LuaSnip'},
	  },
    config = get_setup("lsp"),
  })
	use('theprimeagen/harpoon')
  use ({
        "git@github.com:numToStr/Comment.nvim",
        config = function() require("Comment").setup() end,
      })
end)

