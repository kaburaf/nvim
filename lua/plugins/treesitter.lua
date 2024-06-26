return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				"nvim-treesitter/nvim-treesitter-context",
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
		},
		opts = {
			auto_install = false,
			ensure_installed = {
				"lua",
				"html",
				"css",
				"scss",
				"javascript",
				"typescript",
				"vue",
			},
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
					},
				},
				move = {
					enable = false,
					set_jumps = true, -- whether to set jumps in the jumplist
					goto_next_start = {
						-- ["]m"] = "@function.outer",
						-- ["]]"] = { query = "@class.outer", desc = "Next class start" },
						-- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						-- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next_end = {
						-- ["]M"] = "@function.outer",
						-- ["]["] = "@class.outer",
					},
					goto_previous_start = {
						-- ["[m"] = "@function.outer",
						-- ["[s"] = { query = "@scope", query_group = "locals", desc = "Previous scope" },
						-- ["[["] = "@class.outer",
					},
					goto_previous_end = {
						-- ["[M"] = "@function.outer",
						-- ["[]"] = "@class.outer",
					},
					goto_next = {
						-- ["]d"] = "@conditional.outer",
					},
					goto_previous = {
						-- ["[d"] = "@conditional.outer",
					},
				},
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-q>",
					node_incremental = "<C-q>",
					node_decremental = "<bs>",
					scope_incremental = false,
				},
			},
		},
		config = function(_, opts)
			vim.g.skip_ts_context_commentstring_module = true
			require("nvim-treesitter.configs").setup(opts)
			require("ts_context_commentstring").setup({})
		end,
	},
}
