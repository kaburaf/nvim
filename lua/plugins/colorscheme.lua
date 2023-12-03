return {
	"catppuccin/nvim",
	name = "catppuccin",
	opts = {
		flavour = "frappe",
		integrations = {
			cmp = true,
			gitsigns = true,
			telescope = true,
			which_key = true,
			harpoon = true,
			hop = true,
			alpha = false,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
	end,
}
