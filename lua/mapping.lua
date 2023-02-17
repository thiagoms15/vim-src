local fn = require('functions')

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

