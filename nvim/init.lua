vim.lsp.enable("tofu_ls")

-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
