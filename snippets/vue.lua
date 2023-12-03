return {
	s(
		{ trig = "vvprop", filetype = "javascript", dscr = "Vue property" },
		fmta(
			[[
		<>: {
			type: <>,
			default: <>
		}
		]],
			{
				i(1, "prop"),
				i(2),
				f(function(node)
					local types = {
						String = "'',",
						Boolean = "false,",
						Object = "() => {},",
						Array = "() => [],",
					}
					return types[node[1][1]]
				end, { 2 }),
			}
		)
	),
}
