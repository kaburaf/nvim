return {

	"tpope/vim-surround",
	{
		"stevearc/oil.nvim",
		keys = {
			{
				"<leader>=",
				function()
					require("oil").toggle_float(".")
				end,
				silent = true,
			},
		},
		opts = {},
	},
	{
		"sindrets/diffview.nvim",
		opts = {
			use_icons = false,
		},
	},
	{
		"NeogitOrg/neogit",
		keys = {
			{ "<leader>G", ":Neogit<CR>", silent = true },
		},
		opts = {
			kind = "split",
			integrations = { diffview = true },
		},
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { "javascript", "html", "vue", "php", "markdown" },
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_in_visualblock = true,
		},
	},
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
		"phaazon/hop.nvim",
		keys = {
			{ "<leader>jc", ":HopChar2<cr>" },
			{ "<leader>jd", ":HopPattern<cr>" },
		},
		opts = {},
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"ThePrimeagen/harpoon",
		keys = function()
			local ui = require("harpoon.ui")
			local mark = require("harpoon.mark")
			return {
				{ "<C-e>", ui.toggle_quick_menu },
				{ "<leader>-", mark.add_file },
			}
		end,
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
	},
}
