local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}
	-- Lua
	if server.name == "sumneko_lua" then
		local sumneko_opts = require("lsp.servers.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end
	-- CSS
	if server.name == "cssls" then
		local cssls_opts = require("lsp.servers.cssls")
		opts = vim.tbl_deep_extend("force", cssls_opts, opts)
	end
	-- HTML
	if server.name == "html" then
		local html_opts = require("lsp.servers.html")
		opts = vim.tbl_deep_extend("force", html_opts, opts)
	end
	-- Typescript
	if server.name == "tsserver" then
		local tsserver_opts = require("lsp.servers.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end
	-- Python
	if server.name == "pyright" then
		local pyright_opts = require("lsp.servers.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end
	-- LaTeX
	if server.name == "ltex" then
		local ltex_opts = require("lsp.servers.ltex")
		opts = vim.tbl_deep_extend("force", ltex_opts, opts)
	end
	-- Golang
	if server.name == "gopls" then
		local gopls_opts = require("lsp.servers.gopls")
		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end
	-- Arduino
	if server.name == "arduino-language-server" then
		local arduino_opts = require("lsp.servers.arduino-language-server")
		opts = vim.tbl_deep_extend("force", arduino_opts, opts)
	end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
