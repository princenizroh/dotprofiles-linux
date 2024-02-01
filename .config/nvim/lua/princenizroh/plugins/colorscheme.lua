return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 999,
	config = function()
		require("tokyonight").setup({
			transparent = true,
			transparent_sidebar = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})
		vim.cmd("colorscheme tokyonight-moon")
		vim.cmd("hi CursorLine guibg=none ctermbg=none")
		vim.cmd("hi Normal guibg=none ctermbg=none")
		vim.cmd("hi NormalNC guibg=none ctermbg=none")
		vim.cmd("hi SignColumn guibg=none ctermbg=none")
		vim.cmd("hi StatusLine guibg=none ctermbg=none")
		vim.cmd("hi StatusLineNC guibg=none ctermbg=none")
	end,
}
