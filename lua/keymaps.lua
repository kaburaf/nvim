-- Misc

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<C-s>", ":wa<CR>", { silent = true })

vim.keymap.set("n", "*", "*N", { silent = true })
vim.keymap.set("n", "#", "#N", { silent = true })
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })

vim.keymap.set("n", "<C-c>", ":bd!<CR>", { silent = true })

vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next item in Quickfix list" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Prev item in Quickfix list" })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set({ "n" }, "Y", '"+yy', { silent = true })
vim.keymap.set({ "v", "x", "o" }, "Y", '"+y', { silent = true })

-- Completion

local luasnip = require("luasnip")
vim.keymap.set("i", "<C-k>", function()
	luasnip.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	luasnip.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function()
	luasnip.jump(-1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })

-- Gitsigns

local gitsigns = require("gitsigns")
vim.keymap.set("n", "]c", gitsigns.next_hunk)
vim.keymap.set("n", "[c", gitsigns.prev_hunk)
vim.keymap.set("n", "<leader>H", gitsigns.preview_hunk)
vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk)
vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk)
vim.keymap.set("n", "<leader>hS", gitsigns.stage_buffer)
vim.keymap.set("n", "<leader>hR", gitsigns.reset_buffer)
vim.keymap.set("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end)
vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk)
vim.keymap.set("n", "<leader>hb", gitsigns.blame_line)
vim.keymap.set("n", "<leader>hB", gitsigns.blame)
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
vim.keymap.set("n", "<leader>hQ", gitsigns.toggle_deleted)

-- Todo Comments
vim.keymap.set("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

vim.keymap.set(
	"n",
	"<leader>T",
	":TodoTelescope keywords=TODO,FIXME,FIX<CR>",
	{ silent = true, desc = "Telescope for TODOs and FIXes" }
)
