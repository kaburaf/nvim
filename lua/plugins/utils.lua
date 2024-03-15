return {
	"tpope/vim-sleuth",
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
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
	{
		"echasnovski/mini.files",
		cmd = { "MiniFiles" },
		keys = {
			{ "<leader>=", ":lua MiniFiles.open()<CR>", silent = true },
			{ "<leader>+", ":lua MiniFiles.open(vim.fn.expand('%:h'))<CR>", silent = true },
		},
		opts = {},
	},
	{
		"echasnovski/mini.comment",
		opts = {
			hooks = {
				pre = function()
					require("ts_context_commentstring.internal").update_commentstring()
				end,
			},
		},
	},
	{
		"echasnovski/mini.statusline",
		opts = function()
			local statusline = require("mini.statusline")

			local active_statusline = function()
				local git = statusline.section_git({ trunc_width = 75 })
				local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
				local filename = statusline.section_filename({ trunc_width = 140 })

				return statusline.combine_groups({
					{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
					"%=",
					{ hl = "MiniStatuslineFilename", strings = { filename } },
					{ hl = "MiniStatuslineFilename", strings = { "%p%%" } },
				})
			end
			return {
				content = {
					active = active_statusline,
				},
				set_vim_settings = false,
			}
		end,
	},
	{
		"echasnovski/mini.pairs",
		opts = function()
			local neigh_pattern = "[^\\]%W"
			return {
				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = neigh_pattern },
					["["] = { action = "open", pair = "[]", neigh_pattern = neigh_pattern },
					["{"] = { action = "open", pair = "{}", neigh_pattern = neigh_pattern },

					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

					['"'] = {
						action = "closeopen",
						pair = '""',
						neigh_pattern = neigh_pattern,
						register = { cr = false },
					},
					["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
					["`"] = {
						action = "closeopen",
						pair = "``",
						neigh_pattern = neigh_pattern,
						register = { cr = false },
					},
				},
			}
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
			highlight = {
				multiline = false,
			},
		},
	},
	{
		"sindrets/diffview.nvim",
		keys = {
			{
				"<leader>D",
				function()
					local lib = require("diffview.lib")
					local view = lib.get_current_view()
					if view then
						-- Current tabpage is a Diffview; close it
						vim.cmd.DiffviewClose()
					else
						-- No open Diffview exists: open a new one
						vim.cmd.DiffviewOpen()
					end
				end,
				silent = true,
			},
		},
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
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		opts = {},
	},
	{
		"phaazon/hop.nvim",
		keys = function()
			local hopExtend = require("utils").hop
			return {
				{ "F", ":HopChar2<cr>" },
				{ "f", ":HopChar1CurrentLine<cr>", mode = { "n", "o" } },
				{
					"t",
					hopExtend.hintTill1,
					mode = { "n", "o" },
				},
			}
		end,
		opts = function()
			return {
				hint_position = require("hop.hint").HintPosition.END,
			}
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		keys = {
			{
				"<leader>a",
				function()
					local harpoon = require("harpoon")
					harpoon:list():append()
				end,
			},
		},
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {},
	},
}
