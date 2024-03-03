return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    keys = function()
      local telescope = require("telescope")
      local telescope_builtin = require("telescope.builtin")
      local telescope_grep_args = require("telescope-live-grep-args.shortcuts")
      return {
        { "<leader><space>", telescope_builtin.buffers },
        {
          "<leader>/",
          function()
            telescope_builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            }))
          end,
        },
        { "<leader>F",       telescope_builtin.find_files },
        { "<leader>S",       telescope.extensions.live_grep_args.live_grep_args },
        { "<leader>sh",      telescope_builtin.help_tags },
        { "<leader>sc",      telescope_builtin.git_status },
        { "<leader>sd",      telescope_builtin.diagnostics },
        { "<leader>ss",      telescope_builtin.lsp_document_symbols },
        { "<leader>sw",      telescope_grep_args.grep_word_under_cursor },
        { "<leader>sw",      telescope_grep_args.grep_visual_selection,         mode = "v" },
        { "<leader>f", function()
          telescope_builtin.find_files({ default_text = vim.fn.expand('<cword>') })
        end },
      }
    end,
    cmd = { "Telescope" },
    opts = function()
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      local lga_actions = require("telescope-live-grep-args.actions")

      return {
        defaults = {
          mappings = {
            n = {
              ["<M-p>"] = action_layout.toggle_preview,
            },
            i = {
              -- Live GREP Args
              ["<C-a>q"] = lga_actions.quote_prompt(),
              ["<C-a>i"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              ["<C-a>n"] = lga_actions.quote_prompt({ postfix = " --iglob !**/static/** " }),
              ["<C-a>t"] = lga_actions.quote_prompt({ postfix = " -t " }),
              -- Telescope
              ["<M-p>"] = action_layout.toggle_preview,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.load_extension("live_grep_args")
      telescope.load_extension("fzf")
      telescope.setup(opts)
    end,
  },
}
