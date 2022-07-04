require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all"
	ensure_installed = { "lua", "go", "python", "latex", "bash", "markdown" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = true,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
