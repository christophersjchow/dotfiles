return {
  {
    "nvim-telescope/telescope.nvim",
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
