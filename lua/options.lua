local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

g.netrw_banner = 0
g.netrw_winsize = 30
g.netrw_liststyle = 3
g.netrw_list_hide = "node_modules,build,.git$," .. (vim.fn["netrw_gitignore#Hide"]())

cmd.colorscheme("catppuccin")
cmd(":command! WQ wq")
cmd(":command! WQ wq")
cmd(":command! Wq wq")
cmd(":command! Wqa wqa")
cmd(":command! W w")
cmd(":command! Q q")

opt.laststatus = 3
opt.showmode = false
opt.encoding = "utf-8"
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.shiftround = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.number = true
opt.rnu = true
opt.wrap = false
opt.mouse = "a"
-- opt.clipboard = "unnamedplus"
opt.autowrite = true
opt.completeopt = { "menu", "menuone", "noselect" }
opt.conceallevel = 3
opt.confirm = false
opt.cursorline = true
opt.formatoptions = "jcroqlnt"
opt.inccommand = "nosplit"
opt.timeoutlen = 300
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.wildmode = "longest:full,full"
opt.winminwidth = 5

opt.termguicolors = true
opt.pumblend = 10
opt.pumheight = 10
opt.sidescrolloff = 8
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append({ W = true, I = true, c = true })
opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true

opt.foldmethod = "expr"
opt.foldlevelstart = 99

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
	float = {
		border = "rounded",
	},
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

-- Diagnostics signs
vim.fn.sign_define(
	"DiagnosticSignError",
	{ texthl = "DiagnosticSignError", text = "", numhl = "DiagnosticSignError" }
)
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "", numhl = "DiagnosticSignInfo" })
