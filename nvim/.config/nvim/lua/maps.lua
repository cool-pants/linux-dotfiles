local keymap = vim.keymap

-- Do not yank with x
keymap.set('n', 'x', '"_X')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- New split
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'ss', ':vsplit<Return><C-w>w')

-- Window/Pane nav
keymap.set('n', 's<left>', '<C-w>h')
keymap.set('n', 's<up>', '<C-w>k')
keymap.set('n', 's<down>', '<C-w>j')
keymap.set('n', 's<right>', '<C-w>l')

-- Window resize
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('n', '<C-w><right>', '<C-w>>')
