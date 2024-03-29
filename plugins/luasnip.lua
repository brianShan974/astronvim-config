return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  -- dependencies = {
  --   "rafamadriz/friendly-snippets",
  --   config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
  -- },
  dependencies = {
    "rafamadriz/friendly-snippets",
    "benfowler/telescope-luasnip.nvim",
  },
  config = function(_, opts)
    if opts then require("luasnip").config.setup(opts) end
    vim.tbl_map(function(type)
      require("luasnip.loaders.from_" .. type).lazy_load {
        exclude = { "plaintex", "tex" },
      }
      require("luasnip.loaders.from_lua").lazy_load { paths = { "~/.config/nvim/lua/user/LuaSnip/" } }
    end, { "vscode", "snipmate", "lua" })
    -- friendly-snippets - enable standardized comments snippets
    require("luasnip").filetype_extend("typescript", { "tsdoc" })
    require("luasnip").filetype_extend("javascript", { "jsdoc" })
    require("luasnip").filetype_extend("lua", { "luadoc" })
    require("luasnip").filetype_extend("python", { "pydoc" })
    require("luasnip").filetype_extend("rust", { "rustdoc" })
    require("luasnip").filetype_extend("cs", { "csharpdoc" })
    require("luasnip").filetype_extend("java", { "javadoc" })
    require("luasnip").filetype_extend("c", { "cdoc" })
    require("luasnip").filetype_extend("cpp", { "cppdoc" })
    require("luasnip").filetype_extend("php", { "phpdoc" })
    require("luasnip").filetype_extend("kotlin", { "kdoc" })
    require("luasnip").filetype_extend("ruby", { "rdoc" })
    require("luasnip").filetype_extend("sh", { "shelldoc" })
  end,
  opts = {
    history = true,
    delete_check_events = "TextChanged",
    enable_autosnippets = true,
    store_selection_keys = "`",
  },
  -- config = function()
  --   require("luasnip").config.set_config {
  --     enable_autosnippets = true,
  --     store_selection_keys = "`",
  --   }
  --   -- require "plugins.configs.luasnip"()
  --   require("luasnip.loaders.from_lua").load { paths = { "~/.config/nvim/lua/user/LuaSnip" } }
  -- end,
  keys = {
    {
      "fj",
      function()
        return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next"
          or "<c-\\><c-n>:call searchpair('[([{<|]', '', '[)\\]}>|]', 'W')<cr>a"
      end,
      expr = true,
      silent = true,
      mode = "i",
    },
    {
      "fj",
      function() require("luasnip").jump(1) end,
      mode = "s",
    },
    {
      "fk",
      function() require("luasnip").jump(-1) end,
      mode = { "i", "s" },
    },
  },
}
