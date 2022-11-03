local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then
  print('LSP not loaded')
  return
end

local s, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
if (not s) then
  print('cmp not loaded')
  return
end

local capabilities = cmp_lsp.default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
}

nvim_lsp.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" }
}

nvim_lsp.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "yaml", "yaml.docker-compose" },
  cmd = { "yaml-language-server", "--stdio" }
}

nvim_lsp.dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "dockerfile" },
  cmd = { "docker-langserver", "--stdio" }
}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'lua-language-server' },
  settings = {
    Lua = {
      runtime = { version='LuaJIT', path=runtime_path },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  update_in_insert = false,
  virtual_text = { spacing = 4, prefix = "●" },
  severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})
