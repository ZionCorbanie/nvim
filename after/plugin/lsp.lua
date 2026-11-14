vim.diagnostic.config({
  virtual_text = false,
})

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'gopls', 'lua_ls' }, -- Explicitly include Go LSP
  handlers = {
    -- Default handler for automatically installed servers
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,

    -- Custom Clangd Configuration
    ['clangd'] = function()
      require('lspconfig').clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--query-driver=" .. os.getenv("HOME") .. "/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-*"
        },
      })
    end,


    -- Custom Lua LSP Configuration
    ['lua_ls'] = function()
      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })
    end,
  },
})

if vim.fn.executable("coq-lsp") == 1 then
  require('lspconfig').coq_lsp.setup({})
end

vim.api.nvim_create_user_command("LspRestart", function()
  local clients = vim.lsp.get_clients({ bufnr = 0 })

  for _, client in ipairs(clients) do
    vim.lsp.stop_client(client.id)
  end

  vim.defer_fn(function()
    vim.cmd("edit")
  end, 100)
end, {})

