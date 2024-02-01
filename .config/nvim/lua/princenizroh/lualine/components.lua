local conditions = require("princenizroh.lualine.conditions")
local colors = require("princenizroh.lualine.colors")
local icons = require("princenizroh.lualine.icons")

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local branch = icons.git.Branch

return {
	mode = {
		function()
			return " " .. icons.ui.Target .. " "
		end,
		padding = { left = 0, right = 1 },
		color = { fg = colors.blue, bg = colors.bg },
		cond = nil,
	},
	branch = {
		"b:gitsigns_head",
		icon = branch,
		color = { gui = "bold" },
	},
	filename = {
		"filename",
		color = {},
		cond = nil,
	},
	diff = {
		"diff",
		source = diff_source,
		symbols = {
			added = icons.git.LineAdded .. " ",
			modified = icons.git.LineModified .. " ",
			removed = icons.git.LineRemoved .. " ",
		},
		padding = { left = 2, right = 1 },
		diff_color = {
			added = { fg = colors.green },
			modified = { fg = colors.yellow },
			removed = { fg = colors.red },
		},
		cond = nil,
	},
	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		symbols = {
			error = icons.diagnostics.BoldError .. " ",
			warn = icons.diagnostics.BoldWarning .. " ",
			info = icons.diagnostics.BoldInformation .. " ",
			hint = icons.diagnostics.BoldHint .. " ",
		},
		-- cond = conditions.hide_in_width,
	},
	lsp = {
		function()
			local clients = vim.lsp.get_active_clients({ bufnr = 0 })
			if next(clients) == nil then
				return "LSP Inactive"
			end
			local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
			local buf_clients = {}
			local copilot_active = false

			-- add client
			for _, client in pairs(clients) do
				if client.name ~= "null-ls" and client.name ~= "copilot" then
					table.insert(buf_clients, client.name)
				end

				if client.name == "copilot" then
					copilot_active = true
				end
			end

			local unique_client_names = table.concat(buf_clients, ", ")
			local language_servers = string.format("[%s]", unique_client_names)

			if copilot_active then
				language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.git.Octoface .. "%*"
			end

			return language_servers
		end,
		color = { gui = "bold" },
		cond = conditions.hide_in_width,
	},
	treesitter = {
		function()
			return icons.ui.Tree
		end,
		color = function()
			local buf = vim.api.nvim_get_current_buf()
			local ts = vim.treesitter.highlighter.active[buf]
			return { fg = ts and not vim.tbl_isempty(ts) and colors.green or colors.red }
		end,
		cond = conditions.hide_in_width,
	},
	location = {
		"location",
	},
	progress = {
		"progress",
		fmt = function()
			return "%P/%L"
		end,
		color = {},
	},

	spaces = {
		function()
			local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
			return icons.ui.Tab .. " " .. shiftwidth
		end,
		padding = 1,
	},
	encoding = {
		"o:encoding",
		fmt = string.upper,
		color = {},
		cond = conditions.hide_in_width,
	},
	filetype = { "filetype", cond = nil, padding = { left = 1, right = 1 } },
	scrollbar = {
		function()
			local current_line = vim.fn.line(".")
			local total_lines = vim.fn.line("$")
			local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		padding = { left = 0, right = 0 },
		color = "SLProgress",
		cond = nil,
	},
}
