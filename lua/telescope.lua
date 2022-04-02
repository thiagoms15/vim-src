local fn = require('functions')

fn.nmap('<leader>ff', ':Telescope find_files<cr>')
fn.nmap('<leader>fg', ':Telescope live_grep<cr>')
fn.nmap('<leader>fb', ':Telescope buffers<cr>')
fn.nmap('<leader>fh', ':Telescope help_tags<cr>')
