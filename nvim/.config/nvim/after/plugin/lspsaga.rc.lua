local status, lspsaga = pcall(require, 'lspsaga')
if (not status) then return end

lspsaga.init_lsp_saga {
  server_filetype_map = {}
}

local opts = {noremap = true, silent=true}
vim.keymap.set('n','<C-j>','<Cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n','K','<Cmd>Lspsaga hover_doc<cr>', opts)
vim.keymap.set('n','gd','<Cmd>Lspsaga lsp_finder<cr>', opts)
vim.keymap.set('i','<C-k>','<Cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
vim.keymap.set('n','gp','<Cmd>Lspsaga peek_definition<cr>', opts)
vim.keymap.set('n','gr','<Cmd>Lspsaga rename<cr>', opts)
