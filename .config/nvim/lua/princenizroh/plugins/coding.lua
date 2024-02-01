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
}
return coding_plugin
