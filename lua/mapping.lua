local fn = require('functions')
local builtin = require('telescope.builtin')

-- Telescope
fn.nmap('<leader>ff', '', builtin.find_files)
fn.nmap('<leader>fg', '', builtin.live_grep)
fn.nmap('<leader>fb', '', builtin.buffers)
fn.nmap('<leader>fh', '', builtin.help_tags)

-- Float terminal
fn.nmap('<C-t>', ':FloatermToggle<CR>')
fn.tmap('<C-t>', '<C-\\><C-n>:FloatermToggle<CR>')

-- Harpoon
fn.nmap('<leader>fm', ':lua require("harpoon.mark").add_file()<cr>')
fn.nmap('<leader>ft', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')

-- toggle comment line
fn.nmap('<leader>/', '', fn.toggle_comment)
fn.vmap('<leader>/', '', function() fn.toggle_comment(true) end)

-- show header file
fn.nmap('<leader>h', '', function() fn.open_header() end)
fn.nmap('<leader>s', ':ClangdSwitchSourceHeader<CR>')

-- Copy to plus register (quoteplus)
fn.nmap('<leader>cp', '"+y<CR>')
fn.vmap('<leader>cp', '"+y<CR>')

-- Paste from plus register
fn.nmap('<leader>pp', '"+p<CR>')
fn.vmap('<leader>pp', '"+p<CR>')

-- save
fn.nmap('<leader>w', ':w<CR>')

-- find with ripgrep
fn.nmap('<leader>fr', '', fn.rg_find)
