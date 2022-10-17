local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local builtin = require("null-ls.builtins")
local formatting = builtin.formatting

local sources = {}

if vim.fn.executable("djlint") == 1 then
  sources[#sources + 1] = formatting.djlint.with({
    command = "djlint",
    args = { "--reformat", "-" },
  })
end

if vim.fn.executable("black") == 1 then
  sources[#sources + 1] = formatting.black.with({
    command = "black",
    args = { "--quiet", "--fast", "-" },
  })
end

if vim.fn.executable("yamlfmt") == 1 then
  sources[#sources + 1] = formatting.yamlfmt.with({
    command = "yamlfmt",
    args = { "-" },
  })
end

if vim.fn.executable("prettier") == 1 then
  sources[#sources + 1] = formatting.prettierd
  sources[#sources + 1] = builtin.diagnostics.eslint_d.with({
    diagnostics_format = '[eslint] #{m}\n(#{c})'
  })
  sources[#sources + 1] = builtin.diagnostics.fish
end

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)

local keymap = vim.api.nvim_set_keymap
keymap('n', '<Space>fm', '<ESC>:lua vim.lsp.buf.format{ async=true }<CR>', { noremap = true, silent = true })
