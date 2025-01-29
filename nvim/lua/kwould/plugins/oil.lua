return {
  {
  'stevearc/oil.nvim',
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require("oil").setup{
	    columns = {"icon"},
	    view_options = {
		    show_hidden = true,
	    },

    	}
	vim.keymap.set("n", "-", "<CMD>Oil<CR>")
	end,
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  },
}
