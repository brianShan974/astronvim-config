local ls = require "luasnip"
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = require "user.util.latex"

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local read_lines = function(file_name)
  local lines = {}
  for l in io.lines(file_name) do
    table.insert(lines, l)
  end
  return lines
end

local template_path = "/home/szh/.config/nvim/lua/user/LuaSnip/tex/template.txt"

return {
  s("mytemplate", t(read_lines(template_path))),
}
