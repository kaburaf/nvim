return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			icons_enabled = false,
			theme = "auto",
			section_separators = "",
			component_separators = "",
		},
		sections = {
			lualine_a = { "branch" },
			lualine_b = {},
			lualine_c = { "%=", "%F" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
	},
}
