local fn = require('config.functions')
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>e', ':Ex<cr>', { desc = 'Open [E]xplorer' })

-- Telescope
fn.nmap('<leader>ff', '', builtin.find_files)
fn.nmap('<leader>fg', '', builtin.live_grep)
fn.nmap('<leader>fb', '', builtin.buffers)
fn.nmap('<leader>fh', '', builtin.help_tags)

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

fn.nmap('<leader>tt', ':hi Normal guibg=NONE ctermbg=NONE<CR>')

--fn.nmap('<leader>ai', ':CodeiumToggle<CR>')

