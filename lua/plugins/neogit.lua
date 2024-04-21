return {
	"NeogitOrg/neogit",
	keys = {
		{ "<leader>G", ":Neogit<CR>", silent = true },
	},
	opts = {
		kind = "split",
		integrations = { diffview = true },
	},
}
