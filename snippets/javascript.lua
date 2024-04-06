return {
	s({ trig = "esdis", dscr = "Disable ESLinter" }, t("/* eslint-disable */"), {}),
	s(
		{ trig = "prom", dscr = "Promise" },
		fmt("new Promise((resolve, reject) => {\n\t[]\n})", { i(0) }, { delimiters = "[]" })
	),
	s(
		{ trig = "fori", dscr = "For loop" },
		fmt(
			"for (let [] = 0; [] < [].length; []++){\n \t[] \n}",
			{ i(1, "i"), rep(1), i(2, "array"), rep(1), i(0) },
			{ delimiters = "[]" }
		)
	),
	s(
		{ trig = "foro", dscr = "For of/in loop" },
		fmt(
			"for (const [] [] []){\n \t[] \n}",
			{ i(1, "i"), c(2, { t("of"), t("in") }), i(3, "array"), i(0) },
			{ delimiters = "[]" }
		)
	),
	s(
		{ trig = "fn", dscr = "Function" },
		fmt("function []([]) {\n \t[]\n}", { i(1), i(2), i(0) }, { delimiters = "[]" })
	),
	s({ trig = "log", dscr = "Console" }, fmt("console.{}({})", { c(1, { t("log"), t("warn"), t("error") }), i(0) })),
	postfix({ trig = ".log" }, {
		f(function(_, parent)
			return "console.log(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
		end, {}),
	}),
}
