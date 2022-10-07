local ls = require("luasnip") -- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.config.set_config({
	history = true,
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 200,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = false,
	store_selection_keys = "<c-s>",
})

ls.add_snippets(nil, {
	tex = {
		snip({
			trig = "begintex",
			namr = "BeginTex",
			dscr = "Latex packages to start with",
		}, {
			text({
				[[\documentclass[a4paper, 12pt]{report}]],
				[[\usepackage[utf8]{inputenc}]],
				[[\usepackage{fancyhdr}]],
				[[\usepackage[export]{adjustbox}]],
				[[\usepackage{graphicx}]],
				[[% Español]],
				[[%\usepackage[spanish]{babel}]],
				[[% Math packages]],
				[[%\usepackage{textcomp,mathcomp}]],
				[[%\usepackage{amsmath}]],
				[[\graphicspath{ {images/ }}]],
				[[]],
				[[\author{Said Neder}]],
				[[\date{\today}]],
				[[\title{}]],
				[[]],
				[[\pagestyle{fancy}]],
				[[\fancyhf{}]],
				[[\rhead{\author}]],
				[[\lhead{\title}]],
				[[\cfoot{\thepage}]],
				[[]],
				[[\begin{document}]],
				[[\maketitle]],
				[[\tableofcontents]],
				[[]],
				[[end{document}]],
			}),
			insert(0),
		}),
	},
	sh = {
		snip("shebang", {
			text({ "#!/bin/sh", "" }),
			insert(0),
		}),
	},
	python = {
		snip("shebang", {
			text({ "#!/usr/bin/env python", "" }),
			insert(0),
		}),
	},
	lua = {
		snip("shebang", {
			text({ "#!/usr/bin/lua", "", "" }),
			insert(0),
		}),
	},
	markdown = {
		-- Select link, press C-s, enter link to receive snippet
		snip({
			trig = "link",
			namr = "markdown_link",
			dscr = "Create markdown link [txt](url)",
		}, {
			text("["),
			insert(1),
			text("]("),
			func(function(_, snip)
				return snip.env.TM_SELECTED_TEXT[1] or {}
			end, {}),
			text(")"),
			insert(0),
		}),
		snip({
			trig = "codeempty",
			namr = "markdown_code_empty",
			dscr = "Create empty markdown code block",
		}, {
			text("``` "),
			insert(1, "Language"),
			text({ "", "" }),
			insert(2, "Content"),
			text({ "", "```", "" }),
			insert(0),
		}),
	},
})
