return function(_, opts)
  if opts then require("luasnip").config.setup(opts) end
  vim.tbl_map(
    function(type) require("luasnip.loaders.from_" .. type).load { paths = { "~/.config/nvim/lua/user/LuaSnip" } } end,
    { "vscode", "snipmate", "lua" }
  )
end
