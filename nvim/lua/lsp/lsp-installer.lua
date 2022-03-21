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

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("lsp.servers.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "cssls" then
    local cssls_opts = require("lsp.servers.cssls")
    opts = vim.tbl_deep_extend("force", cssls_opts, opts)
  end

  if server.name == "html" then
    local html_opts = require("lsp.servers.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server.name == "zk" then
      local zk_opts = require("lsp.servers.zk")
      opts = vim.tbl_deep_extend("force", zk_opts, opts)
    end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
