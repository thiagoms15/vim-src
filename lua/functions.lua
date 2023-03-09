local telescope = require('telescope.builtin')

local M = {}

M.map = function(mode, shortcut, command, callback)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true , callback = callback, })
end

M.nmap = function(shortcut, command, callback)
    M.map('n', shortcut, command, callback)
end

M.imap = function(shortcut, command, callback)
    M.map('i', shortcut, command, callback)
end

M.tmap = function(shortcut, command, callback)
    M.map('t', shortcut, command, callback)
end

M.vmap = function(shortcut, command, callback)
    M.map('v', shortcut, command, callback)
end

-- define function to toggle comment for current line
M.toggle_comment = function(is_multi_line)
    is_multi_line         = is_multi_line or false
    local filetype        = vim.api.nvim_buf_get_option(0, "filetype")
    local comment_tag     = ""
    local comment_escaped = ""

    local comment_map = {
        cpp = "//",
        cmake = "#",
        lua = "--",
        rust = "//",
        python = "#",
        sh = "#"
    }
    local comment_escaped_map = {
        cpp = "//",
        cmake = "#",
        lua = "%-%-",
        rust = "//",
        python = "#",
        sh = "#"
    }
    comment_tag = comment_map[filetype] or "//"
    comment_escaped = comment_escaped_map[filetype] or "//"

    local start_line = 0
    local end_line   = 0
    local size       = 0
    if is_multi_line then
        _, start_line, cscol, _ = unpack(vim.fn.getpos('.'))
        _, end_line, cecol, _   = unpack(vim.fn.getpos('v'))
        -- swap vars if needed
        if end_line < start_line then
            start_line, end_line = end_line, start_line
        end
        start_line = start_line - 1
        -- exit visual mode
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
            'n',
            true
        )
    else
        end_line = vim.fn.getpos(".")[2]
        start_line = end_line - 1
    end
    size = end_line - start_line

    local line_text       = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
    local is_commented    = line_text[1]:match('^ *' .. comment_escaped) or false
    local new_buffer_line = {}

    if is_commented then
        for i=1,size do
            new_buffer_line[i] = line_text[i]:gsub(comment_escaped, '', 1)
        end
    else
        for i=1,size do
            new_buffer_line[i] = comment_tag .. line_text[i]
        end

    end
    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, new_buffer_line)
end

M.open_header = function()
    local current_buffer = vim.api.nvim_get_current_buf()
    local buffer_name    = vim.api.nvim_buf_get_name(current_buffer)
    local header_file    = buffer_name:gsub('%.[^.]*$', '.h')

    header_file = header_file:gsub('.*/', '')
    local opts = {
        prompt_title = 'Header File (' .. header_file .. ')',
        prompt_prefix = ' >',
        search_file = header_file,
    }
    telescope.find_files(opts)
end

return M
