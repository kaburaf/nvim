return {
	s({ trig = "log", dscr = "Console" }, fmt("console.{}({})", { c(1, { t("log"), t("warn"), t("error") }), i(0) })),
	postfix({ trig = ".log",  }, {
		f(function(_, parent)
			return "console.log(" .. parent.snippet.env.POSTFIX_MATCH .. ")"
		end, {}),
	}),
}
