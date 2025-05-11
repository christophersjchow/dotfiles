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
        tf = { "tfmt" },
        terraform = { "tfmt" },
        hcl = { "tfmt" },
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
    "nathom/filetype.nvim",
    config = function()
      -- Setup overrides for file extensions
      require("filetype").setup({
        overrides = {
          extensions = {
            tf = "terraform",
            tfvars = "terraform",
            tfstate = "json",
          },
        },
      })
    end,
  },
}
