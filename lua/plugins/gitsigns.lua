local text = "┃"

return {
	"lewis6991/gitsigns.nvim",
	event = "BufReadPre",
	opts = {
		signs = {
			add = { heightlight = "GitSignsAdd", text = text },
			change = { heightlight = "GitSignsChange", text = text },
			delete = { heightlight = "GitSignsDelete", text = text },
			topdelete = { heightlight = "GitSignsDelete", text = text },
			changedelete = { heightlight = "GitSignsChange", text = text },
			untracked = { heightlight = "GitSignsAdd", text = text },
		},
		signcolumn = true,
		numhl = true,
		linehl = false,
		word_diff = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 1000,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		sign_priority = 1,
		update_debounce = 100,
		status_formatter = nil,
		max_file_length = 40000,
		preview_config = {
			border = "single",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	},
}
