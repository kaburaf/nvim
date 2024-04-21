return {
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
}
