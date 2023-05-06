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

  -- From receipes to setup supertab behaviour
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local luasnip = require("luasnip")
      local cmp = require("cmp")

      -- Append emoji source
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }, 1, 1))

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- they way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
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
