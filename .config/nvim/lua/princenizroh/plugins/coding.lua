local coding_plugin = {
	{ -- Comment
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {
			opleader = {
				line = "gc",
				block = "gb",
			},
		},
	},
	{ -- Indent
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		main = "ibl",
		opts = {},
	},
	{ -- Highlight
		"RRethy/vim-illuminate",
		lazy = false,
	},
	{ -- LSP
		"folke/neoconf.nvim",
		cmd = "NeoConf",
	},
	{ -- LSP
		"folke/neodev.nvim",
	},
	{
		"mbbill/undotree",
	},
}
return coding_plugin
