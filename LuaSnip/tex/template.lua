local ls = require("luasnip")
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

local tex = require("util.latex")

local get_visual = function(args, parent)
  if #parent.snippet.env.SELECT_RAW > 0 then
    return sn(nil, t(parent.snippet.env.SELECT_RAW))
  else -- If SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end

local template_string = {
  [[%! Tex program = xelatex]],

  [[\documentclass[a4paper]{article}]],
  [[]],
  [[\usepackage[utf8]{inputenc}]],
  [[\usepackage[T1]{fontenc}]],
  [[\usepackage{textcomp}]],
  [[\usepackage[english]{babel}]],
  [[]],
  [[% figure support]],
  [[\usepackage{import}]],
  [[\usepackage{xifthen}]],
  [[\usepackage{pdfpages}]],
  [[\usepackage{transparent}]],
  [[]],
  [[\usepackage{physics}]],
  [[\usepackage{braket}]],
  [[\usepackage{mathtools}]],
  [[]],
  [[\usepackage{float}]],
  [[\usepackage{listings}]],
  [[]],
  [[\usepackage{ctex}]],
  [[\usepackage{amsthm}]],
  [[\usepackage{amsmath}]],
  [[\usepackage{amssymb}]],
  [[\usepackage{tikz}]],
  [[\usepackage{graphicx}]],
  [[\usepackage{wasysym}]],
  [[]],
  [[\usepackage[utf8]{inputenc}]],
  [[\usepackage{cite}]],
  [[\usepackage{amsfonts}]],
  [[\usepackage{algorithmic}]],
  [[\usepackage{textcomp}]],
  [[\usepackage{xcolor}]],
  [[\usepackage{mhchem}]],
  [[\usepackage{siunitx}]],
  [[\usepackage{xcolor}]],
  [[\usepackage{tikz}]],
  [[\usepackage{indentfirst}]],
  [[\usepackage{caption}]],
  [[]],
  [[\usepackage{pythonhighlight}]],
  [[]],
  [[\usepackage[siunitx, RPvoltages]{circuitikz}]],
  [[]],
  [[% Default fixed font does not support bold face]],
  [[\DeclareFixedFont{\ttb}{T1}{txtt}{bx}{n}{12} % for bold]],
  [[\DeclareFixedFont{\ttm}{T1}{txtt}{m}{n}{12}  % for normal]],
  [[]],
  [[% Custom colors]],
  [[\usepackage{color}]],
  [[\definecolor{deepblue}{rgb}{0,0,0.5}]],
  [[\definecolor{deepred}{rgb}{0.6,0,0}]],
  [[\definecolor{deepgreen}{rgb}{0,0.5,0}]],
  [[]],
  [[% Python style for highlighting]],
  [[\newcommand\pythonstyle{\lstset{]],
  [[language=Python,]],
  [[basicstyle=\ttm,]],
  [[morekeywords={self},              % Add keywords here]],
  [[keywordstyle=\ttb\color{deepblue},]],
  [[emph={MyClass,__init__},          % Custom highlighting]],
  [[emphstyle=\ttb\color{deepred},    % Custom highlighting style]],
  [[stringstyle=\color{deepgreen},]],
  [[frame=tb,                         % Any extra options here]],
  [[showstringspaces=false]],
  [[}}]],
  [[]],
  [[]],
  [[% Python environment]],
  [[\lstnewenvironment{python}[1][] ]],
  [[{]],
  [[\pythonstyle]],
  [[\lstset{#1}]],
  [[}]],
  [[{}]],
  [[]],
  [[% Python for external files]],
  [[\newcommand\pythonexternal[2][]{{]],
  [[\pythonstyle]],
  [[\lstinputlisting[#1]{#2}}}]],
  [[]],
  [[% Python for inline]],
  [[\newcommand\pythoninline[1]{{\pythonstyle\lstinline!#1!}}]],
  [[]],
  [[\usepackage{xeCJK}]],
  [[\setCJKmainfont{STXihei}]],
  [[]],
  [[\graphicspath{ {./images/} }]],
  [[]],
  [[\usetikzlibrary{positioning}]],
  [[\usetikzlibrary{tikzmark,calc,decorations.pathreplacing}]],
  [[]],
  [[\theoremstyle{theorem}]],
  [[\newtheorem{theorem}{Theorem}[section] ]],
  [[]],
  [[\theoremstyle{definition}]],
  [[\newtheorem{definition}{Definition}[section] ]],
  [[]],
  [[\theoremstyle{lemma}]],
  [[\newtheorem{lemma}[theorem]{Lemma}]],
  [[]],
  [[\theoremstyle{corollary}]],
  [[\newtheorem{corollary}{Corollary}[theorem] ]],
  [[]],
  [[\theoremstyle{remark}]],
  [[\newtheorem*{remark}{Remark}]],
  [[]],
  [[\theoremstyle{axiom}]],
  [[\newtheorem{axiom}{Axiom}[section] ]],
  [[]],
  [[\newcommand{\D}{\mathrm{d}}]],
  [[]],
  [[\title{}]],
  [[\author{brianShan974}]],
  [[\date{\today}]],
  [[]],
  [[\begin{document} \maketitle]],
  [[]],
  [[]],
  [[\end{document}]],
}

return {
    s(
        "template",
        t(template_string)
    ),
}
