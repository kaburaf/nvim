return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			return {
				view = {
					docs = {
						auto_open = false
					}
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-y>"] = cmp.mapping.confirm({
						-- behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = {
					{ name = "buffer", keyword_length = 3 },
					{ name = "nvim_lsp", keyword_length = 3 },
					{ name = "luasnip", keyword_length = 3 },
				},
			}
		end,
		config = function(_, opts)
			require("cmp").setup(opts)
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		opts = function()
			local extras = require("luasnip.extras.filetype_functions")
			return {
				history = true,
				updateevents = "TextChanged, TextChangedI",
				enable_autosnippets = true,
				ft_func = extras.from_cursor_pos,
				load_ft_func = extras.extend_load_ft({
					vue = { "html", "javascript" },
				}),
			}
		end,
		config = function(_, opts)
			require("luasnip.loaders.from_lua").lazy_load({ paths = { "~/.config/nvim/snippets" } })
			local ls = require("luasnip")
			ls.setup(opts)
			ls.filetype_extend("vue", { "html", "js" })
		end,
	},
}
