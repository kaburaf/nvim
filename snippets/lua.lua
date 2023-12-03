return {
	s(
		{ trig = "snpc", dscr = "Create template for snippet," },
		fmt("s({ trig='<>',  dscr='<>' }, fmt('<>', { <> }))", { i(1), i(2), i(3), i(4) }, { delimiters = "<>" })
	),
	-- s(
	-- 	{ trig = "snpx", dscr = "Choices snippet" },
	-- 	fmt(
	-- 		[[
	-- 	    let pick some value: {}
	-- 		{} ok
	-- 	]],
	-- 		{ c(1, { t("one"), t("two"), t("three") }, i(0)) }
	-- 	)
	-- ),
}
