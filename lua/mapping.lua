local fn = require('functions')

fn.nmap('<C-b>', ':NERDTreeToggle<cr>')

fn.nmap('<Leader>+', ':vertical resize +5<CR>')
fn.nmap('<Leader>-', ':vertical resize -5<CR>')
fn.nmap('<Leader>rp', ':resize 100<CR>')

fn.nmap('<C-t>', ':FloatermToggle<CR>')
fn.tmap('<C-t>', '<C-\\><C-n>:FloatermToggle<CR>')

-- Harpoon
fn.nmap('<Leader>fm', ':lua require("harpoon.mark").add_file()<cr>')
fn.nmap('<Leader>ft', ':lua require("harpoon.ui").toggle_quick_menu()<cr>')

