--local fn = require('functions')
--fn.nmap('<leader>ff', ':Telescope find_files<cr>')
--fn.nmap('<leader>fg', ':Telescope live_grep<cr>')
--fn.nmap('<leader>fb', ':Telescope buffers<cr>')
--fn.nmap('<leader>fh', ':Telescope help_tags<cr>')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

local telescope = require'telescope'
telescope.setup{
  defaults = {
      layout_config = {
      vertical = { width = 0.8 }
      -- other layout configuration here
    },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
--    live_grep = {
--      theme = "dropdown",
--  },
--    find_files = {
--      theme = "dropdown",
--  }
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}
