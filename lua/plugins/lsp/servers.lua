local servers = {
	volar = {
		init_options = {
			vue = {
				hybridMode = false,
			},
		},
	},
	tsserver = {
		filetypes = {
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"typescript.tsx",
			"vue",
		},
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = "/home/karimov/.nvm/versions/node/v16.19.1/lib/node_modules/@vue/typescript-plugin",
					languages = { "typescript", "vue" },
				},
			},
		},
		implicitProjectConfiguration = {
			checkJs = true,
			allowJs = true,
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
				telemetry = { enable = false },
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	cssls = {},
	html = {},
	jsonls = {},
}

return servers
