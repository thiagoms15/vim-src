local fn = require('functions')
local builtin = require('telescope.builtin')
local harpoon_ui = require('harpoon.ui')
local harpoon_mark = require('harpoon.mark')

-- Telescope
fn.nmap('<leader>ff', '', builtin.find_files)
fn.nmap('<leader>fg', '', builtin.live_grep)
fn.nmap('<leader>fb', '', builtin.buffers)
fn.nmap('<leader>fh', '', builtin.help_tags)

-- Float terminal
fn.nmap('<C-t>', ':FloatermToggle<CR>')
fn.tmap('<C-t>', '<C-\\><C-n>:FloatermToggle<CR>')

-- Harpoon
fn.nmap('<leader>fm', '', harpoon_mark.add_file)
fn.nmap('<leader>ft', '', harpoon_ui.toggle_quick_menu)
fn.nmap('<leader>j', '', harpoon_ui.nav_next)
fn.nmap('<leader>k', '', harpoon_ui.nav_prev)

-- toggle comment line
fn.nmap('<leader>/', '', fn.toggle_comment)
fn.vmap('<leader>/', '', function() fn.toggle_comment(true) end)

-- show header file
fn.nmap('<leader>h', '', function() fn.open_header() end)
fn.nmap('<leader>s', ':ClangdSwitchSourceHeader<CR>')

-- Copy to plus register (quoteplus)
fn.nmap('<leader>yp', '"+y<CR>')
fn.vmap('<leader>yp', '"+y<CR>')

-- Paste from plus register
fn.nmap('<leader>pp', '"+p<CR>')
fn.vmap('<leader>pp', '"+p<CR>')

-- save
fn.nmap('<leader>w', ':w<CR>')

-- find with ripgrep
fn.nmap('<leader>fr', '', fn.rg_find)

-- run cppcheck
fn.nmap('<leader>cc', '', fn.cpp_check)

