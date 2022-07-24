local ls = require("luasnip")
local s = ls.s
local i = ls.i
local t = ls.t
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local begintex = s("begintex", { t([[ 
\documentclass[a4paper, 12pt]{report}
\usepackage{}
]]) })

table.insert(snippets, begintex)
