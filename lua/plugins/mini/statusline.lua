return {
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
}
