local servers = {
	volar = {
		init_options = {
			vue = {
				hybridMode = false,
			},
		},
	},
	tsserver = {
		settings = {
			implicitProjectConfiguration = {
				checkJs = true,
				allowJs = true,
			},
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
