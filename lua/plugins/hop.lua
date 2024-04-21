return {
	"phaazon/hop.nvim",
	keys = function()
		local hopExtend = require("utils").hop
		return {
			{ "F", ":HopChar2<cr>" },
			{ "f", ":HopChar1CurrentLine<cr>", mode = { "n", "o" } },
			{
				"t",
				hopExtend.hintTill1,
				mode = { "n", "o" },
			},
		}
	end,
	opts = function()
		return {
			hint_position = require("hop.hint").HintPosition.END,
		}
	end,
}
