local opts = {
	ensure_installed = {
    "efm",
		"bashls",
		"tsserver",
		"tailwindcss",
		"pyright",
		"lua_ls",
		"jsonls",
	},

	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}
