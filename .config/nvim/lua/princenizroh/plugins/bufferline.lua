return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					mode = "tabs",
					separator_style = "slant",
					always_show_bufferline = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					color_icons = true,
					max_name_length = 9,
					max_prefix_length = 2, -- prefix used when a buffer is de-duplicated
					tab_size = 2,
					-- diagnostics = "nvim_lsp",
					-- diagnostics_update_in_insert = false,
				},
				highlights = {
					separator = {
						fg = "#1c2438", -- dark navy blue
						bg = "#3c4464", -- dark slate blue
					},
					separator_selected = {
						fg = "#1c2438", -- dark navy blue
					},
					background = {
						fg = "#7da3f0", -- light blue
						bg = "#3c4464", -- dark slate blue
					},
					buffer_selected = {
						fg = "#fdf6e3", -- light yellow
						bold = true,
					},
					fill = {
						bg = "#1c2438", -- dark navy blue
					},
					duplicate = {
						fg = "#7da3f0", -- light yellow
						bg = "#3c4464", -- dark slate blue
					},
					modified = {
						bg = "#3c4464", -- dark slate blue
					},
					modified_selected = {
						fg = "#58c0db", -- light blue
					},
				},
			})
		end,
	},
}
