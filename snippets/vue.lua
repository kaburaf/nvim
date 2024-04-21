return {
	s(
		{ trig = "vvue3", filetype = "html", dscr = "Vue3 SFC template" },
		fmta(
			[[
			<template>
				<div class="{}"></div>
			</template>
			<script setup></script>
			<style scoped lang="{}">
			.{}
				{}
			</style>
		]],
			{
				i(1),
				i(2, "sass"),
				rep(1),
				i(0),
			},
			{
				delimiters = "{}",
			}
		)
	),
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
