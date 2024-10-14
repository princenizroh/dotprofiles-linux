local on_attach = require("princenizroh.util.lsp").on_attach
local diagnostic_signs = require("princenizroh.util.icons").diagnostic_signs

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")
	local capabilities = cmp_nvim_lsp.default_capabilities()

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "sh", "aliasrc" },
	})

	-- C/C++
	lspconfig.clangd.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
		},
	})

	-- C#
	lspconfig.omnisharp.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = {
			["textDocument/definition"] = function(...)
				return require("omnisharp_extended").handler(...)
			end,
			["textDocument/references"] = function(...)
				return require("omnisharp-extended").handler(...)
			end,
			["textDocument/implementation"] = function(...)
				return require("omnisharp-extended").handler(...)
			end,
		},
		keys = {
			{
				"gd",
				function()
					require("omnisharp_extended").telescope_lsp_definitions()
				end,
				desc = "Goto Definition",
			},
			{
				"gr",
				function()
					require("omnisharp_extended").telescope_lsp_references()
				end,
				desc = "Goto References",
			},
			{
				"gi",
				function()
					require("omnisharp_extended").telescope_lsp_implementation()
				end,
				desc = "Goto Implementation",
			},
		},
		enable_editorconfig_support = true,
		enable_ms_build_load_projects_on_demand = true,
		sdk_include_prerelease = true,
		enable_roslyn_analyzers = true,
		organize_imports_on_format = true,
		enable_import_completion = true,
		analyze_open_documents_only = true,
		cmd = {
			"omnisharp",
			"--languageserver",
		},
		filetypes = {
			"cs",
			"vb",
		},
		root_dir = lspconfig.util.root_pattern("*.csproj", "*.sln", ".git", "omnisharp.json", "function.js"),
	})

	-- docker
	lspconfig.dockerls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "json", "jsonc" },
	})

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- python
	lspconfig.pyright.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
					autoImportCompletions = true,
				},
			},
		},
	})

	-- rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					allFeatures = true,
					ovverideCommand = {
						"cargo",
						"clippy",
						"workspace",
						"--message-format=json",
						"--all-targets",
						"--all-features",
						"--",
					},
				},
			},
		},
	})

	-- solidity
	lspconfig.solidity.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = { "solidity" },
	})

	-- typescript
	lspconfig.ts_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- typescriptreact, javascriptreact, css, sass, scss, less, svelte, vue
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"typescriptreact",
			"javascriptreact",
			"javascript",
			"css",
			"sass",
			"scss",
			"less",
			"svelte",
			"vue",
			"html",
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck") -- Lua
	local stylua = require("efmls-configs.formatters.stylua") -- Lua
	local flake8 = require("efmls-configs.linters.flake8") -- Python
	local black = require("efmls-configs.formatters.black") -- Python
	-- local eslint = require("efmls-configs.linters.eslint") -- JavaScript, TypeScript, JSON, JSONC, Svelte, Vue, Markdown, HTML, CSS
	local eslint_d = require("efmls-configs.linters.eslint_d") -- JavaScript, TypeScript, JSON, JSONC, Svelte, Vue, Markdown, HTML, CSS
	local prettier_d = require("efmls-configs.formatters.prettier_d") -- JavaScript, TypeScript, JSON, JSONC, Svelte, Vue, Markdown, HTML, CSS
	local fixjson = require("efmls-configs.formatters.fixjson") -- JSON, JSONC
	local shellcheck = require("efmls-configs.linters.shellcheck") -- Bash
	local shfmt = require("efmls-configs.formatters.shfmt") -- Bash
	local rustfmt = require("efmls-configs.formatters.rustfmt") -- Rust
	local hadolint = require("efmls-configs.linters.hadolint") -- Docker
	local solhint = require("efmls-configs.linters.solhint") -- Solidity
	local cpplint = require("efmls-configs.linters.cpplint") -- C, C++
	local clangformat = require("efmls-configs.formatters.clang_format") -- C, C++
	local mcs = require("efmls-configs.linters.mcs") -- C#
	local dotnet_format = require("efmls-configs.formatters.dotnet_format") -- C#

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
			"json",
			"jsonc",
			"sh",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"svelte",
			"vue",
			"markdown",
			"docker",
			"solidity",
			"html",
			"omnisharp",
			"omnisharp-mono",
			"css",
			"c",
			"cpp",
			"cs",
			"c_sharp",
			"rust",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
				typescript = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				sh = { shellcheck, shfmt },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				markdown = { prettier_d },
				docker = { hadolint, prettier_d },
				solidity = { solhint },
				html = { prettier_d },
				css = { prettier_d },
				c = { clangformat, cpplint },
				cpp = { clangformat, cpplint },
				c_sharp = { mcs, dotnet_format },
				omnisharp = { mcs, dotnet_format },
				rust = { rustfmt },
			},
		},
	})
end

return {
	{
		"neovim/nvim-lspconfig",
		config = config,
		lazy = false,
		dependencies = {
			"windwp/nvim-autopairs",
			"williamboman/mason.nvim",
			"creativenull/efmls-configs-nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"folke/neoconf.nvim",
		},
	},
}
