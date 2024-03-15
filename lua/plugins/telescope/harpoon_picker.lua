local action_state = require("telescope.actions.state")
local action_utils = require("telescope.actions.utils")
local entry_display = require("telescope.pickers.entry_display")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values
local harpoon = require("harpoon")

local function filter_empty_string(list)
	local next = {}
	for idx = 1, #list do
		if list[idx].value ~= "" then
			table.insert(next, list[idx])
		end
	end

	return next
end

local generate_new_finder = function()
	return finders.new_table({
		results = filter_empty_string(harpoon:list().items),
		entry_maker = function(entry)
			local line = entry.value .. ":" .. entry.context.row .. ":" .. entry.context.col
			local displayer = entry_display.create({
				separator = " - ",
				items = {
					{ width = 2 },
					{ width = 50 },
					{ remaining = true },
				},
			})
			local make_display = function()
				return displayer({
					tostring(entry.index),
					line,
				})
			end
			return {
				value = entry,
				ordinal = line,
				display = make_display,
				lnum = entry.row,
				col = entry.col,
				filename = entry.value,
			}
		end,
	})
end

local delete_harpoon_mark = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	harpoon:list():remove(selection.value)

	local function get_selections()
		local results = {}
		action_utils.map_selections(prompt_bufnr, function(entry)
			table.insert(results, entry)
		end)
		return results
	end

	local selections = get_selections()
	for _, current_selection in ipairs(selections) do
		harpoon:list():remove(current_selection.value)
	end

	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local move_mark_up = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	local length = harpoon:list():length()

	if selection.index == length then
		return
	end

	local mark_list = harpoon:list().items

	table.remove(mark_list, selection.index)
	table.insert(mark_list, selection.index + 1, selection.value)

	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local move_mark_down = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	if selection.index == 1 then
		return
	end
	local mark_list = harpoon:list().items
	table.remove(mark_list, selection.index)
	table.insert(mark_list, selection.index - 1, selection.value)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local M = {}
function M.harpoon_markers(opts)
	opts = opts or {}

	pickers
		.new(opts, {
			prompt_title = "Harpoon",
			finder = generate_new_finder(),
			sorter = conf.generic_sorter(opts),
			previewer = conf.grep_previewer(opts),
			attach_mappings = function(_, map)
				map({ "n", "i" }, "<C-d>", delete_harpoon_mark)
				-- map("n", "<C-d>", delete_harpoon_mark)

				-- map("i", "<C-p>", move_mark_up)
				-- map("n", "<C-p>", move_mark_up)
				--
				-- map("i", "<C-n>", move_mark_down)
				-- map("n", "<C-n>", move_mark_down)
				return true
			end,
		})
		:find()
end

return M
