-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { "tinted-theming/tinted-vim" },
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      colorscheme = "base24-one-black",
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = { enabled = false },
      scroll = { enabled = false },
      quickfile = { enabled = true },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        opentofu = { "tfmt" },
      },
      formatters = {
        tfmt = {
          -- Specify the command and its arguments for formatting
          command = "tofu",
          args = { "fmt", "-" },
          stdin = true,
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Map .tofu to its own filetype
      vim.filetype.add({
        extension = {
          tofu = "opentofu", -- unique filetype for .tofu files
        },
      })

      -- Tell Treesitter to use hcl parser for the "tofu" filetype
      vim.treesitter.language.register("hcl", "opentofu")
    end,
  },
}
