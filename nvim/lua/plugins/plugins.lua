-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "freddiehaddad/base16-nvim",
    dependencies = { "RRethy/nvim-base16" },
    opts = {
      hot_reload = {
        enabled = true,
      },
    },
  },
  { "tpope/vim-surround" },
  { "tpope/vim-fugitive" },
  {
    "tpope/vim-eunuch",
    dependencies = { "tpope/vim-repeat" },
    keys = {
      { "<leader><leader>r", ":Rename ", desc = "Rename current file" },
    },
  },

  -- Language syntax support
  { "HerringtonDarkholme/yats.vim" },
  { "aklt/plantuml-syntax" },
  { "chr4/nginx.vim" },
  { "hashivim/vim-packer" },
  { "hashivim/vim-terraform" },
  { "jparise/vim-graphql" },
  { "maxmellon/vim-jsx-pretty" },
  { "pearofducks/ansible-vim" },
  { "towolf/vim-helm" },
  { "tpope/vim-rails" },
  { "tpope/vim-rake" },
  { "vim-ruby/vim-ruby" },
  { "wuelnerdotexe/vim-astro" },
  { "yuezk/vim-js" },
}
