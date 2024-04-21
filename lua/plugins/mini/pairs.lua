return {
	"echasnovski/mini.pairs",
	opts = function()
		local neigh_wordless = "[^\\]%W"
		local neigh_any = "[^\\]."
		return {
			mappings = {
				["("] = { action = "open", pair = "()", neigh_pattern = neigh_wordless },
				["["] = { action = "open", pair = "[]", neigh_pattern = neigh_wordless },
				["{"] = { action = "open", pair = "{}", neigh_pattern = neigh_wordless },

				[")"] = { action = "close", pair = "()", neigh_pattern = neigh_any },
				["]"] = { action = "close", pair = "[]", neigh_pattern = neigh_any },
				["}"] = { action = "close", pair = "{}", neigh_pattern = neigh_any },

				['"'] = {
					action = "closeopen",
					pair = '""',
					neigh_pattern = neigh_wordless,
					register = { cr = false },
				},
				["'"] = {
					action = "closeopen",
					pair = "''",
					neigh_pattern = neigh_wordless,
					register = { cr = false },
				},
				["`"] = {
					action = "closeopen",
					pair = "``",
					neigh_pattern = neigh_wordless,
					register = { cr = false },
				},
			},
		}
	end,
}
