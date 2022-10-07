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
	-- HTML&CSS
	if server.name == "emmet_ls" then
		local emmet_opts = require("lsp.servers.emmet")
		opts = vim.tbl_deep_extend("force", emmet_opts, opts)
	end
	-- Typescript
	if server.name == "tsserver" then
		local tsserver_opts = require("lsp.servers.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end
	-- Python
	if server.name == "pylsp" then
		local pylsp_opts = require("lsp.servers.pylsp")
		opts = vim.tbl_deep_extend("force", pylsp_opts, opts)
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
		local arduino_opts = require("lsp.servers.arduinolsp")
		opts = vim.tbl_deep_extend("force", arduino_opts, opts)
	end

	-- Markdown
	if server.name == "marksman" then
		local marksman_opts = require("lsp.servers.marksman")
		opts = vim.tbl_deep_extend("force", marksman_opts, opts)
	end

	-- C
	if server.name == "clangd" then
		local clang_opts = require("lsp.servers.clang")
		opts = vim.tbl_deep_extend("force", clang_opts, opts)
	end
	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
