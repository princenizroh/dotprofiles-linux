return {
	"windwp/nvim-ts-autotag",
	lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter" }, -- pastikan Treesitter diatur sebagai dependensi
	config = function()
		require('nvim-ts-autotag').setup()
	end,
}
