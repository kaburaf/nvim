local function getFilename(_, snip)
	return vim.fn.expand("%:t:r")
end

return {
	s(
		{ trig = "vvue2", filetype = "html", dscr = "Vue2 SFC template" },
		fmta(
			[[
			<template>
				<div class="[]">[]</div>
			</template>
			<script>
			export default {
				name: '[]',
				props: {},
				data() {
					return {};
				},
			};
			</script>
			<style scoped lang="[]">
			.[]
				//
			</style>
		]],
			{
				i(1),
				i(0),
				f(getFilename, {}),
				i(2, "stylus"),
				rep(1),
			},
			{
				delimiters = "[]",
			}
		)
	),
	s(
		{ trig = "vvue3", filetype = "html", dscr = "Vue3 SFC template" },
		fmta(
			[[
			<template>
				<div class="{}">{}</div>
			</template>
			<script setup></script>
			<style scoped lang="{}">
			.{}
				//
			</style>
		]],
			{
				i(1),
				i(0),
				i(2, "sass"),
				rep(1),
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
