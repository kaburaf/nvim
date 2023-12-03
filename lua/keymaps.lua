-- Misc

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set("n", "<C-s>", ":wa<CR>", { silent = true })
vim.keymap.set("n", "*", "*N", { silent = true })
vim.keymap.set("n", "#", "#N", { silent = true })

vim.keymap.set("n", "]q", ":cnext<CR>", { desc = "Next item in Quickfix list" })
vim.keymap.set("n", "[q", ":cprev<CR>", { desc = "Prev item in Quickfix list" })

vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>=", ":Lex<CR>")

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

-- Telescope

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")
local telescope_grep_args = require("telescope-live-grep-args.shortcuts")

vim.keymap.set("n", "<leader>?", telescope_builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", telescope_builtin.buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
	telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>sc", telescope_builtin.git_status, { desc = "[S]earch Git [C]ommits" })
vim.keymap.set("n", "<leader>F", telescope_builtin.find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>S", telescope.extensions.live_grep_args.live_grep_args, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sh", telescope_builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", telescope_grep_args.grep_word_under_cursor, { desc = "[S]earch current [W]ord" })
vim.keymap.set("v", "<leader>sw", telescope_grep_args.grep_visual_selection, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sd", telescope_builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>ss", telescope_builtin.lsp_document_symbols, { desc = "[S]earch [S]ymbols" })

-- Hop

vim.keymap.set("n", "<leader>jc", ":HopChar2<cr>", {})
vim.keymap.set("n", "<leader>jd", ":HopPattern<cr>", {})

-- Harpoon

vim.keymap.set("n", "<C-e>", require("harpoon.ui").toggle_quick_menu, {})
vim.keymap.set("n", "<leader>-", require("harpoon.mark").add_file, {})

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
vim.keymap.set("n", "<leader>hd", gitsigns.diffthis)
vim.keymap.set("n", "<leader>hQ", gitsigns.toggle_deleted)

-- Neogit
vim.keymap.set("n", "<leader>G", ":Neogit<CR>")
