return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.cmd([[hi NvimTreeNormal guibg=none ctermbg=none]])
		-- vim.cmd("highlight Normal guibg=none ctermbg=none")
		-- vim.cmd("highlight NvimTreeNormal guibg=none ctermbg=none")
		-- vim.cmd("highlight NvimTreeModifiedFile guibg=none ctermbg=none")
		require("nvim-tree").setup({
			filters = {
				dotfiles = false,
			},
			view = {
				adaptive_size = true,
			},
		})
	end,
}
