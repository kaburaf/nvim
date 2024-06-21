return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	keys = {
		{
			"<C-e>",
			function()
				local harpoon = require("harpoon")
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
		},
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
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr })
			end,
		})
		harpoon:setup(opts)
	end,
}
