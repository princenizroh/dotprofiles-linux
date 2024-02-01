local components = require("princenizroh.lualine.components")
local icons = require("princenizroh.lualine.icons")

local ui_plugin = {
	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = icons,
					theme = "auto",
					globalstatus = true,
					component_separators = { left = icons.ui.DivideRight, right = icons.ui.DivideLeft },
					section_separators = { left = icons.ui.BoldDividerRight, right = icons.ui.BoldDividerLeft },
					disabled_filetypes = {},
				},
				sections = {
					lualine_a = { components.mode },
					lualine_b = { components.branch },
					lualine_c = {
						components.diff,
						components.python_env,
					},
					lualine_x = {
						components.diagnostics,
						components.filetype,
					},
					lualine_y = { components.location },
					lualine_z = { components.progress },
				},
				inactive_sections = {
					lualine_a = {
						components.mode,
					},
					lualine_b = {
						components.branch,
					},
					lualine_c = {
						components.diff,
						components.python_env,
					},
					lualine_x = {
						components.diagnostics,
						components.lsp,
						components.spaces,
						components.filetype,
					},
					lualine_y = { components.location },
					lualine_z = {
						components.progress,
					},
				},
				tabline = {},
				extensions = {},
			})
		end,
	},
}

return ui_plugin
