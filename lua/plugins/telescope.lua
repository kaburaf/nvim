return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-live-grep-args.nvim",
			"debugloop/telescope-undo.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			local action_layout = require("telescope.actions.layout")
			local lga_actions = require("telescope-live-grep-args.actions")

			return {
				extensions = {
					undo = {
						side_by_side = true,
						mappings = {
							["<cr>"] = require("telescope-undo.actions").yank_additions,
							["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
							["<C-cr>"] = require("telescope-undo.actions").restore,
						},
					},
					live_grep_args = {
						auto_quoting = true,
						mappings = {
							i = {
								["<M-k>"] = lga_actions.quote_prompt(),
								["<M-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
								["<M-i>n"] = lga_actions.quote_prompt({ postfix = " --iglob !**/static/** " }),
							},
						},
					},
				},
				defaults = {
					mappings = {
						n = {
							["<M-p>"] = action_layout.toggle_preview,
						},
						i = {

							["<M-p>"] = action_layout.toggle_preview,
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
						},
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")

			telescope.load_extension("live_grep_args")
			telescope.load_extension("undo")
			telescope.setup(opts)
			telescope.load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
}
