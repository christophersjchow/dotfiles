local Util = require("lazyvim.util")

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
        config = function()
          Util.on_load("telescope.nvim", function()
            local telescope = require("telescope")
            telescope.setup({
              pickers = {
                find_files = {
                  find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
                },
              },
            })
            telescope.load_extension("fzf")
          end)
        end,
      },
    },
    keys = {
      { "<leader>t", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
      { "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Find Files (root dir)" },
      { "<leader>b", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>m", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
      },
    },
  },
}
