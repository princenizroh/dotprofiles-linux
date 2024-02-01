local git_plugin = {
	{ -- Git signs
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup()
		end,
	},
	{ -- Git integration
		lazy = false,
		"tpope/vim-fugitive",
	},
}

return git_plugin
