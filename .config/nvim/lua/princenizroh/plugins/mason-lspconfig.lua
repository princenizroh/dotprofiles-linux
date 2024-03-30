local opts = {
	ensure_installed = {
		"bashls",
		-- "black",
		-- "clang-format",
		"clangd",
		-- "cpplint",
		"csharp_ls",
		"efm",
		-- "eslint_d",
		"emmet_ls",
		-- "fixjson",
		-- "flake8",
		-- "hadolint",
		-- "jsonlint",
		"jsonls",
		"lua_ls",
		-- "luacheck",
		"omnisharp",
		-- "prettierd",
		"pyright",
		"rust_analyzer",
		-- "shellcheck",
		-- "shfmt",
		-- "solhint",
		"solidity",
		"tsserver",
		"tailwindcss",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
