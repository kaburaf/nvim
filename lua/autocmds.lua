local aucmd_dict = {
	FileReadPost = {
		{
			callback = function()
				vim.defer_fn(function()
					vim.cmd("redrawstatus!")
				end, 100)
			end,
		},
	},
	BufReadPost = {
		{
			callback = function()
				vim.defer_fn(function()
					vim.cmd("redrawstatus!")
				end, 100)
			end,
		},
	},
	VimEnter = {
		{
			desc = "On Neovim enters",
			callback = function()
				for i = 34, 122 do
					vim.cmd(string.format("silent! call setreg(nr2char(%d), [])", i))
				end
			end,
		},
	},
	BufNewFile = {
		{
			pattern = "*.vue",
			callback = function()
				local skeletons_dir = vim.fn.expand("$HOME/.config/nvim/skeletons/")
				vim.cmd(string.format("0r %s", skeletons_dir .. "skeleton.vue"))
			end,
		},
	},
	LspAttach = {
		{
			desc = "LSP actions",
			callback = function()
				vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
				local bufmap = function(mode, lhs, rhs)
					local opts = { buffer = true }
					vim.keymap.set(mode, lhs, rhs, opts)
				end
				bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
				bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
				bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
				bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
				bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
				bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
				bufmap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
				bufmap("n", "cR", "<cmd>lua vim.lsp.buf.rename()<cr>")
				bufmap("n", "gA", "<cmd>lua vim.lsp.buf.code_action()<cr>")
				bufmap("x", "gA", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
				bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
				bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
				bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
			end,
		},
	},
}

for event, opt_tbls in pairs(aucmd_dict) do
	for _, opt_tbl in pairs(opt_tbls) do
		vim.api.nvim_create_autocmd(event, opt_tbl)
	end
end
