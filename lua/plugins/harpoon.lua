return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = {
		{
			"<leader>a",
			function()
				local harpoon = require("harpoon")
				harpoon:list():add()
			end,
		},
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	opts = {},
}
