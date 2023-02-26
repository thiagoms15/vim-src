local fn = require('functions')
local builtin = require('telescope.builtin')

-- Telescope
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Float terminal
fn.nmap('<C-t>', ':FloatermToggle<CR>')
fn.tmap('<C-t>', '<C-\\><C-n>:FloatermToggle<CR>')

-- Harpoon
fn.nmap('<leader>fm', ':lua require("harpoon.mark").add_file()<cr>')
fn.nmap('<leader>ft', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')

-- toggle comment line
fn.nmap('<leader>/', ':lua require("functions").toggle_comment()<CR>')
fn.vmap('<leader>/', ':lua require("functions").toggle_comment(true)<CR>')

-- show header file
fn.nmap('<leader>h', ':lua require("functions").open_header()<CR>')

-- Copy to plus register (quoteplus)
fn.nmap('<leader>cp', '"+y<CR>')
fn.vmap('<leader>cp', '"+y<CR>')

-- Paste from plus register
fn.nmap('<leader>pp', '"+p<CR>')
fn.vmap('<leader>pp', '"+p<CR>')

