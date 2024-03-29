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

return {
  s(
    { trig = "qb", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty(<>)", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qb", snippetType = "autosnippet" },
    fmta("\\qty(<>)", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qB", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qB", snippetType = "autosnippet" },
    fmta("\\qty{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qp", snippetType = "autosnippet", priority = 2000 },
    fmta("\\qty[<>]", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qp", snippetType = "autosnippet" },
    fmta("\\qty[<>]", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mb", snippetType = "autosnippet" },
    fmta("\\mqty(<>)", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mB", snippetType = "autosnippet" },
    fmta("\\mqty{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mp", snippetType = "autosnippet" },
    fmta("\\mqty[<>]", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "im", snippetType = "autosnippet" },
    fmta("\\imat{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "xm", snippetType = "autosnippet" },
    fmta("\\xmat{<>}{<>}{<>}", {
      i(1),
      i(2),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "zm", snippetType = "autosnippet" },
    fmta("\\zmat{<>}{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "pmat", snippetType = "autosnippet" },
    fmta("\\pmat{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "dm", snippetType = "autosnippet" },
    fmta("\\dmat{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "adm", snippetType = "autosnippet" },
    fmta("\\admat{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "comm", snippetType = "autosnippet" },
    fmta("\\comm{<>}{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "acom", snippetType = "autosnippet" },
    fmta("\\acomm{<>}{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "ket", snippetType = "autosnippet", priority = 2000 },
    fmta("\\ket{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "ket", snippetType = "autosnippet" },
    fmta("\\ket{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "bra", snippetType = "autosnippet", priority = 2000 },
    fmta("\\bra{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "bra", snippetType = "autosnippet" },
    fmta("\\bra{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "norm", snippetType = "autosnippet", priority = 2000 },
    fmta("\\norm{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "norm", snippetType = "autosnippet" },
    fmta("\\norm{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "abs", snippetType = "autosnippet", priority = 2000 },
    fmta("\\abs{<>}", {
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "abs", snippetType = "autosnippet" },
    fmta("\\abs*{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "vu", snippetType = "autosnippet" },
    fmta("\\vu{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  -- s(
  --   { trig = "bk", snippetType = "autosnippet" },
  --   fmta("\\ip{<>}{<>}", {
  --     i(1),
  --     i(0),
  --   }),
  --   { condition = tex.in_mathzone }
  -- ),
  -- s(
  --   { trig = "kb", snippetType = "autosnippet" },
  --   fmta("\\op{<>}{<>}", {
  --     i(1),
  --     i(0),
  --   }),
  --   { condition = tex.in_mathzone }
  -- ),
  s(
    { trig = "ev", snippetType = "autosnippet" },
    fmta("\\ev{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mev", snippetType = "autosnippet" },
    fmta("\\ev{<>}{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mel", snippetType = "autosnippet" },
    fmta("\\mel{<>}{<>}{<>}", {
      i(1),
      i(2),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "mdet", snippetType = "autosnippet" },
    fmta("\\mdet{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "pr", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\Pr{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "ord", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\order{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qif", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qif", {}),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qq", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qq{<>}", {
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qor", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qor", {}),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "qif", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\qif", {}),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "dv", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\dv[<>]{<>}{<>}", {
      i(1),
      i(2),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s(
    { trig = "pv", wordTrig = false, snippetType = "autosnippet" },
    fmta("\\pdv{<>}{<>}", {
      i(1),
      i(0),
    }),
    { condition = tex.in_mathzone }
  ),
  s({ trig = "tr", wordTrig = false, snippetType = "autosnippet" }, fmta("\\tr", {}), { condition = tex.in_mathzone }),
}
