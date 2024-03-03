local servers = {
  cssls = {},
  html = {},
  volar = {},
  eslint = {},
  jsonls = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {},
    cmd = { 'Mason' }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = vim.tbl_keys(servers),
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name],
          })
        end,
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      return {
        sources = {
          require("null-ls").builtins.formatting.prettierd.with({
            env = {
              PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("./.prettierrc"),
            },
          }),
        },
      }
    end,
  },
  {
    "wavded/vim-stylus",
    ft = { "stylus" },
    opts = {},
  },
}
