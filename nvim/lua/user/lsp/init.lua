local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("lua.user.lsp.lsp-installer")
require("lua.user.lsp.handlers").setup()
