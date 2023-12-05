return {
	"tpope/vim-sleuth",
	"tpope/vim-surround",
	"tpope/vim-rhubarb",
	{
		"sindrets/diffview.nvim",
		opts = {
			use_icons = false,
		},
	},
	{
		"NeogitOrg/neogit",
		opts = {
			kind = "split",
			integrations = { diffview = true },
		},
	},
	{ "windwp/nvim-ts-autotag", opts = {} },
	{
		"numToStr/Comment.nvim",
		opts = {
			sticky = false,
		},
		config = function(_, opts)
			local cmt = require("Comment")
			local ft = require("Comment.ft")

			ft.pug = { "//-%s", "//-%s" }
			ft.styl = { "//%s", "/*%s*/" }

			cmt.setup(opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"phaazon/hop.nvim",
		opts = {},
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"ThePrimeagen/harpoon",
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			watch_gitdir = {
				enabled = false,
			},
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
		config = function(_, opts)
			require("gitsigns").setup(opts)
		end,
	},
}
